import Foundation

struct Event {
    let date: Date
    let name: String
}

extension Array where Element == Event {
    static let allEvents: [Element] = {
        let formatter = ISO8601DateFormatter()
        return  [
            Event(date: formatter.date(from: "2018-09-27T05:44:55Z")!, name: "Document Review"),
            Event(date: formatter.date(from: "2018-11-19T10:02:21Z")!, name: "Multilingual"),
            Event(date: formatter.date(from: "2018-09-13T08:01:55Z")!, name: "Xara"),
            Event(date: formatter.date(from: "2018-10-12T12:59:00Z")!, name: "Turf"),
            Event(date: formatter.date(from: "2018-07-15T03:43:29Z")!, name: "DVT"),
            Event(date: formatter.date(from: "2018-06-23T18:23:05Z")!, name: "Pain Management"),
            Event(date: formatter.date(from: "2018-10-26T18:08:49Z")!, name: "Whiplash"),
            Event(date: formatter.date(from: "2018-09-29T18:06:17Z")!, name: "AHU"),
            Event(date: formatter.date(from: "2018-03-28T04:01:53Z")!, name: "XRY"),
            Event(date: formatter.date(from: "2018-10-21T14:56:47Z")!, name: "IT Strategy"),
            Event(date: formatter.date(from: "2018-08-26T16:30:31Z")!, name: "Liability"),
            Event(date: formatter.date(from: "2018-03-03T14:16:51Z")!, name: "OMB Circular A-133"),
            Event(date: formatter.date(from: "2018-12-14T16:21:23Z")!, name: "UCP"),
            Event(date: formatter.date(from: "2018-11-21T03:15:31Z")!, name: "Izotope RX"),
            Event(date: formatter.date(from: "2018-03-23T17:27:37Z")!, name: "Kyphoplasty"),
            Event(date: formatter.date(from: "2018-07-22T14:03:56Z")!, name: "Classroom Management"),
            Event(date: formatter.date(from: "2018-08-11T15:42:46Z")!, name: "Airworthiness"),
            Event(date: formatter.date(from: "2018-03-15T05:20:01Z")!, name: "Web Typography"),
            Event(date: formatter.date(from: "2018-06-23T20:49:14Z")!, name: "Perl"),
            Event(date: formatter.date(from: "2019-01-17T06:59:08Z")!, name: "AHU"),
            Event(date: formatter.date(from: "2018-12-02T03:36:01Z")!, name: "Zooarchaeology"),
            Event(date: formatter.date(from: "2018-06-28T01:34:00Z")!, name: "PMO Design"),
            Event(date: formatter.date(from: "2018-09-20T19:13:39Z")!, name: "AHU"),
            Event(date: formatter.date(from: "2018-02-18T09:05:30Z")!, name: "Blues"),
            Event(date: formatter.date(from: "2018-04-30T08:52:47Z")!, name: "Vector Illustration"),
            Event(date: formatter.date(from: "2018-02-14T08:42:13Z")!, name: "Customer Insight"),
            Event(date: formatter.date(from: "2018-10-17T23:45:58Z")!, name: "Mergers & Acquisitions"),
            Event(date: formatter.date(from: "2018-03-14T01:55:12Z")!, name: "Self-esteem"),
            Event(date: formatter.date(from: "2018-04-13T07:16:46Z")!, name: "JSP440"),
            Event(date: formatter.date(from: "2019-01-13T13:37:35Z")!, name: "Information Technology"),
            Event(date: formatter.date(from: "2018-07-31T07:08:03Z")!, name: "Visual Effects"),
            Event(date: formatter.date(from: "2018-11-28T14:02:13Z")!, name: "Stage Make-up"),
            Event(date: formatter.date(from: "2018-06-01T11:18:25Z")!, name: "Order Picking"),
            Event(date: formatter.date(from: "2018-09-21T05:41:26Z")!, name: "WCF"),
            Event(date: formatter.date(from: "2018-03-13T01:17:44Z")!, name: "MCSA"),
            Event(date: formatter.date(from: "2018-08-02T09:42:26Z")!, name: "Oceanography"),
            Event(date: formatter.date(from: "2018-08-06T23:26:23Z")!, name: "Commercial Aviation"),
            Event(date: formatter.date(from: "2018-03-04T22:19:46Z")!, name: "Critical Illness"),
            Event(date: formatter.date(from: "2018-03-17T08:08:14Z")!, name: "EPR"),
            Event(date: formatter.date(from: "2018-07-09T02:22:18Z")!, name: "Market Knowledge"),
            Event(date: formatter.date(from: "2018-10-24T09:19:04Z")!, name: "GDI"),
            Event(date: formatter.date(from: "2018-03-27T09:45:18Z")!, name: "NX-OS"),
            Event(date: formatter.date(from: "2018-08-29T14:16:51Z")!, name: "Loan Origination"),
            Event(date: formatter.date(from: "2019-01-27T13:17:51Z")!, name: "Twitter Marketing"),
            Event(date: formatter.date(from: "2019-01-22T13:42:40Z")!, name: "EGL"),
            Event(date: formatter.date(from: "2018-07-19T13:11:29Z")!, name: "fMRI"),
            Event(date: formatter.date(from: "2018-02-14T04:24:18Z")!, name: "Sketching"),
            Event(date: formatter.date(from: "2018-02-10T19:03:17Z")!, name: "Blackberry"),
            Event(date: formatter.date(from: "2018-09-30T15:45:04Z")!, name: "OllyDbg"),
            Event(date: formatter.date(from: "2018-02-02T00:05:19Z")!, name: "Financial Mgmt")
        ]
    }()
}
