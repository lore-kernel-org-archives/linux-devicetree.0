From: "Opensource [Steve Twiss]" <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH V2 1/2] mfd: da9063: Add device tree support
Date: Tue, 20 Jan 2015 13:23:23 +0000
Message-ID: <6ED8E3B22081A4459DAC7699F3695FB7D0B52DA5@SW-EX-MBX02.diasemi.com>
References: <cover.1421684991.git.stwiss.opensource@diasemi.com>
 <d765ef11de06a4ac5721ecf3283ba1333a6d0c8c.1421684991.git.stwiss.opensource@diasemi.com>
 <20150120104544.GS5767@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150120104544.GS5767@x1>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Dajun Chen <david.chen-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Support Opensource <Support.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DQpPbiAyMCBKYW51YXJ5IDIwMTUgMTA6NDYgTGVlIEpvbmVzIHdyb3RlOg0KDQpbLi4uXQ0KDQo+
ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFwX3JhbmdlIGRhOTA2M19hZF9yZWFkYWJsZV9y
YW5nZXNbXSA9IHsNCj4gPiAgCXsNCj4gPiAgCQkucmFuZ2VfbWluID0gREE5MDYzX1JFR19QQUdF
X0NPTiwNCj4gPiBAQCAtMjAzLDYgKzIwNiwxMyBAQCBzdGF0aWMgc3RydWN0IHJlZ21hcF9jb25m
aWcgZGE5MDYzX3JlZ21hcF9jb25maWcNCj4gPSB7DQo+ID4gIAkuY2FjaGVfdHlwZSA9IFJFR0NB
Q0hFX1JCVFJFRSwNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBkYTkwNjNfZHRfaWRzW10gPSB7DQo+ID4gKwl7IC5jb21wYXRpYmxlID0gImRsZyxk
YTkwNjMtYWQiLCB9LA0KPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJkbGcsZGE5MDYzLWJiIiwgfSwN
Cj4gPiArCXsgLmNvbXBhdGlibGUgPSAiZGxnLGRhOTA2My1jYSIsIH0sDQo+IA0KPiBJJ20gc3Rp
bGwgYSBiaXQgYmVtdXNlZCBhcyB0byB3aHkgdGhlc2UgcmVxdWlyZSB0aGVpciBvd24gY29tcGF0
aWJsZQ0KPiBzdHJpbmdzPyAgVGhleSBhcmUgbmV2ZXIgbWF0Y2hlZCAob2ZfbWF0Y2hfZGV2aWNl
KCkpIG9uIGFuZCBpdCBhcHBlYXJzDQo+IHRoZXkgY2FuIGJlIGR5bmFtaWNhbGx5IHRvbGQgYXBh
cnQgYnkgcG9raW5nLg0KPiANCg0KWWVzOiBsaWtlIHlvdSBzYWlkLiBXaHkgYm90aGVyIHdpdGgg
YSAyLWxldHRlciB2YXJpYW50IGNvZGUgaW4gdGhlIERUIGlmIHRoZQ0KZHJpdmVyJ3MgYmVoYXZp
b3VyIGlzIGF1dG9tYXRpYz8NCg0KSXQgd2FzIGEgZGVzaWduIHN0eWxlIGRlY2lzaW9uIG9uIG15
IHNpZGUuIEkgd2FzIGJlaW5nIGV4cGxpY2l0IGluIG15IGRlZmluaXRpb25zIA0KYW5kIEkgYWRk
ZWQgdGhlIDItbGV0dGVyIGNvZGUgdG8gaGFuZGxlIChwb3RlbnRpYWwpIGRpZmZlcmVuY2VzIGlu
IHRoZSB3YXkNCnBsYXRmb3JtIGRhdGEgY2FuIGJlIGhhbmRsZWQgaW4gdGhlIGRyaXZlci4gVGhl
cmUgaXMgbm90aGluZyByaWdodCBub3csIEkgd2FzIGp1c3QNCmNvbnNpZGVyaW5nIHRoZSBmdXR1
cmUgYW5kIHRoZSBBQkkuDQoNCkhvd2V2ZXIsIEkndmUgdGFsa2VkIG15c2VsZiByb3VuZCB0aGlz
IGFyZ3VtZW50IHNldmVyYWwgdGltZXMgLS0gSSBndWVzcyB0aGUNCmV4cGxpY2l0IGNvbXBhdGli
aWxpdHkgbGV0dGVycyBpbiB0aGUgZGV2aWNlcyB0cmVlIGFyZSBqYXJyaW5nIGFnYWluc3QgdGhl
IGF1dG9tYXRpYw0KZGV0ZWN0aW9uIGluc2lkZSB0aGUgZHJpdmVyLg0KDQpJIHdpbGwgcmVtb3Zl
IHRoZSAyLWxldHRlciBleHRlbnNpb25zIGZyb20gdGhlIG5leHQgc3VibWlzc2lvbi4NCg0KUmVn
YXJkcywNClN0ZXZlDQoNCg0K
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
