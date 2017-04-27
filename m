From: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dmaengine: Add DW AXI DMAC driver
Date: Thu, 27 Apr 2017 13:21:41 +0000
Message-ID: <1493299300.25985.17.camel@synopsys.com>
References: <1491573855-1039-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1491573855-1039-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1492518695.24567.56.camel@linux.intel.com>
         <1492784977.16657.6.camel@synopsys.com>
         <1492787583.24567.120.camel@linux.intel.com>
         <1493049305.25985.4.camel@synopsys.com>
         <1493052970.24567.168.camel@linux.intel.com>
         <1493133369.25985.10.camel@synopsys.com>
         <1493143941.24567.196.camel@linux.intel.com>
         <1493219075.24567.211.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493219075.24567.211.camel-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
Content-ID: <B7F2B3D16C45B743AD0B276C42D7C890-z7JfP6tgrtVBCHUSTMH8dZqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE3LTA0LTI2IGF0IDE4OjA0ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIFR1ZSwgMjAxNy0wNC0yNSBhdCAyMToxMiArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdy
b3RlOg0KPiA+IE9uIFR1ZSwgMjAxNy0wNC0yNSBhdCAxNToxNiArMDAwMCwgRXVnZW5peSBQYWx0
c2V2IHdyb3RlOg0KPiA+ID4gT24gTW9uLCAyMDE3LTA0LTI0IGF0IDE5OjU2ICswMzAwLCBBbmR5
IFNoZXZjaGVua28gd3JvdGU6DQo+ID4gPiA+IE9uIE1vbiwgMjAxNy0wNC0yNCBhdCAxNTo1NSAr
MDAwMCwgRXVnZW5peSBQYWx0c2V2IHdyb3RlOg0KPiA+ID4gPiBEZXNjcmlwdG9yIGlzIGFjdGl2
ZSB1bnRpbCB0ZXJtaW5hdGVfYWxsKCkgaXMgY2FsbGVkIG9yIG5ldw0KPiA+ID4gPiBkZXNjcmlw
dG9yDQo+ID4gPiA+IGlzIHN1cHBsaWVkLiBTbywgdGhlIGNhbGxlciBoYXMgYSBxdWl0ZSB0aW1l
IHRvIGNoZWNrIG9uIGl0Lg0KPiA+ID4gPg0KPiA+ID4gPiBTbywgd2hhdCdzIHdyb25nIG9uIGl0
IGJ5IHlvdXIgb3Bpbmlvbj8NCj4gPiA+DQo+ID4gPiBIbW0sIHRoaXMgbG9va3MgT0suIChJbiBt
eSBleGFtcGxlIChoc3UvaHN1LmMgZHJpdmVyKSBlcnJvcg0KPiA+ID4gZGVzY3JpcHRvcnMNCj4g
PiA+IGFyZSBub3QgZnJlZWQgZXZlbiBhZnRlciB0ZXJtaW5hdGVfYWxsIGlzIGNhbGxlZCkNCj4g
Pg0KPiA+IElmIGl0J3MgYWN0aXZlIGl0IHdpbGwgYmUgZnJlZWQuDQo+ID4gT3RoZXJ3aXNlIGNh
bGxlciBzaG91bGQgY2hlY2sgc29tZXdoZXJlIHRoYXQgZGVzY3JpcHRvciBmYWlscy4NCj4gPg0K
PiA+IEJ1dCBhY3R1YWxseSB0aGlzIGlzIGZyYWdpbGUgYW5kIHdlIG5lZWQgdG8gbW9uaXRvciBm
YWlsZWQNCj4gPiBkZXNjcmlwdG9ycy4NCj4gPiBUaGFua3MgZm9yIHJlcG9ydGluZy4NCj4gPg0K
PiA+ID4NCj4gPiA+ID4gT2YgY291cnNlLCBpZiB5b3Ugd2FudCB0byBrZWVwIGJ5IHNvbWUgcmVh
c29uIChzaG91bGQgYmUgc3RhdGVkDQo+ID4gPiA+IHdoYXQNCj4gPiA+ID4gdGhlIHJlYXNvbiBp
biBjb21tZW50KSBlcnJlZCBkZXNjcmlwdG9ycywgeW91IGNhbiBkbyB0aGF0Lg0KPiA+ID4NCj4g
PiA+IFNvLCBJJ2xsIGNyZWF0ZSBkZXNjX2Vycm9yIGxpc3QgYW5kIHN0b3JlIGZhaWxlZCBkZXNj
cmlwdG9ycyBpbg0KPiA+ID4gdGhpcw0KPiA+ID4gbGlzdCB1bnRpbCB0ZXJtaW5hdGVfYWxsKCkg
aXMgY2FsbGVkLg0KPiA+ID4gSXMgaXQgT0sgaW1wbGVtZW50YXRpb24/DQo+ID4NCj4gPiBOb3Bl
LCB3ZSBuZWVkIHRvIGFtZW5kIHZpcnQtY2hhbiBBUEkgZm9yIHRoYXQuIEknbSBvbiBpdC4gV2ls
bCBzZW5kDQo+ID4gYSBzZXJpZXMgc29vbi4NCj4NCj4gSSBoYXZlIHRvIGNvcnJlY3Qgd2hhdCBJ
IHdyb3RlIGJlZm9yZS4NCj4NCj4gV2UgaGF2ZSB0d28gb3B0aW9uczoNCj4gYSkgb25lIEkgcHJv
cG9zZWQgYWJvdmU7DQo+IGIpIG1vdmUgZGVzY3JpcHRvciB0byBjb21wbGV0ZSBsaXN0IGFuZCBj
YWxsIGNvbXBsZXRlIGNhbGxiYWNrIHdpdGgNCj4gcmVzdWx0Lg0KPg0KPiBTbywgaXQgbG9va3Mg
bGlrZSB0aGUgYikgdmFyaWFudCBpcyB3aGF0IGlzIGRvbmUgYWxyZWFkeSBpbiA0IChkaWQgSQ0K
PiBjYWxjdWxhdGUgY29ycmVjdGx5PykgZHJpdmVycyBhbmQgcmVzcGVjdGl2ZSB1c2Vycy4NCg0K
SW4gbXkgb3BpbmlvbiB3ZSBzaG91bGQgY2FsbCBlcnJvciBkZXNjcmlwdG9yIGNvbXBsZXRlIGNh
bGxiYWNrLg0KQnV0IEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIG1vdmUgZXJyb3IgZGVzY3JpcHRv
ciB0byBkZXNjX2NvbXBsZXRlZA0KbGlzdC4NCg0KV2hlbiBkZXNjcmlwdG9yIGZvbGxvd2luZyBv
dXIgZXJyb3IgZGVzY3JpcHRvciB3aWxsIGJlIGNvbXBsZXRlZA0Kc3VjY2Vzc2Z1bGx5IHZjaGFu
IHRhc2tsZXQgd2lsbCBiZSBjYWxsZWQuDQpTbyBhbGwgZGVzY3JpcHRvcnMgZnJvbSBkZXNjX2Nv
bXBsZXRlZCBsaXN0IHdpbGwgYmUgZnJlZWQgKGluY2x1ZGluZw0Kb3VyIGVycm9yIGRlc2NyaXB0
b3IpDQpXZSdsbCBsb3N0IGluZm9ybWF0aW9uIGFib3V0IGVycm9yIGRlc2NyaXB0b3JzIGFuZCB3
ZSdsbCBub3QgYmUgYWJsZSB0bw0KcmV0dXJuIGNvcnJlY3Qgc3RhdHVzIGZyb20gZG1hX2FzeW5j
X2lzX3R4X2NvbXBsZXRlKCkuDQoNCkluIG15IG9waW5pb24sIHdlIHNob3VsZCBjcmVhdGUgZGVz
Y19lcnJvciBsaXN0Lg0KV2hlbiB3ZSBnZXQgZXJyb3Igd2UnbGwgbW92ZSBkZXNjcmlwdG9yIHRv
IGRlc2NfZXJyb3IgbGlzdCBhbmQgY2FsbA0KY29tcGxldGUgY2FsbGJhY2suDQoNCi0tDQrCoEV1
Z2VuaXkgUGFsdHNldg==
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
