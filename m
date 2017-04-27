From: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dmaengine: Add DW AXI DMAC driver
Date: Thu, 27 Apr 2017 15:34:33 +0000
Message-ID: <1493307272.25985.20.camel@synopsys.com>
References: <1491573855-1039-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1491573855-1039-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1492518695.24567.56.camel@linux.intel.com>
         <1492784977.16657.6.camel@synopsys.com>
         <1492787583.24567.120.camel@linux.intel.com>
         <1493049305.25985.4.camel@synopsys.com>
         <1493052970.24567.168.camel@linux.intel.com>
         <1493133369.25985.10.camel@synopsys.com>
         <1493143941.24567.196.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493143941.24567.196.camel-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
Content-ID: <5F1B665FD522044486BB772894009119-z7JfP6tgrtVBCHUSTMH8dZqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAyMDE3LTA0LTI1IGF0IDIxOjEyICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIFR1ZSwgMjAxNy0wNC0yNSBhdCAxNToxNiArMDAwMCwgRXVnZW5peSBQYWx0c2V2IHdy
b3RlOg0KPiA+IE9uIE1vbiwgMjAxNy0wNC0yNCBhdCAxOTo1NiArMDMwMCwgQW5keSBTaGV2Y2hl
bmtvIHdyb3RlOg0KPiA+ID4gT24gTW9uLCAyMDE3LTA0LTI0IGF0IDE1OjU1ICswMDAwLCBFdWdl
bml5IFBhbHRzZXYgd3JvdGU6DQo+ID4gPiA+IEhpLA0KPiA+ID4gPiBPbiBGcmksIDIwMTctMDQt
MjEgYXQgMTg6MTMgKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gPiA+ID4gPiBPbiBG
cmksIDIwMTctMDQtMjEgYXQgMTQ6MjkgKzAwMDAsIEV1Z2VuaXkgUGFsdHNldiB3cm90ZToNCj4g
PiA+ID4gPiA+IE9uIFR1ZSwgMjAxNy0wNC0xOCBhdCAxNTozMSArMDMwMCwgQW5keSBTaGV2Y2hl
bmtvIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBPbiBGcmksIDIwMTctMDQtMDcgYXQgMTc6MDQgKzAz
MDAsIEV1Z2VuaXkgUGFsdHNldiB3cm90ZToNCj4gPiA+ID4gVGhpcyBJUCBjYW4gYmUgKGFucyBp
cykgY29uZmlndXJlZCB3aXRoIHNtYWxsIGJsb2NrIHNpemUuDQo+ID4gPiA+IChub3RlLCB0aGF0
IEkgYW0gbm90IHNheWluZyBhYm91dCBydW50aW1lIEhXIGNvbmZpZ3VyYXRpb24pDQo+ID4gPiA+
DQo+ID4gPiA+IEFuZCB0aGVyZSBpcyBvcHBvcnR1bml0eSB3aGF0IHdlIGNhbid0IHVzZSBzZ19s
aXN0IGRpcmVjdGx5IGFuZA0KPiA+ID4gPiBuZWVkDQo+ID4gPiA+IHRvDQo+ID4gPiA+IHNwbGl0
IHNnX2xpc3QgdG8gYSBzbWFsbGVyIGNodW5rcy4NCj4gPiA+DQo+ID4gPiBUaGF0J3Mgd2hhdCBJ
IGhhdmUgcmVmZXJyZWQgcXVpdGUgYWdvLiBUaGUgZHJpdmVyIHNob3VsZCBwcm92aWRlDQo+ID4g
PiBhbg0KPiA+ID4gaW50ZXJmYWNlIHRvIHRlbGwgcG90ZW50aWFsIGNhbGxlciB3aGF0IG1heGlt
dW0gYmxvY2sgKG51bWJlciBvZg0KPiA+ID4gaXRlbXMNCj4gPiA+IHdpdGggZ2l2ZW4gYnVzIHdp
ZHRoKSBpdCBzdXBwb3J0cy4NCj4gPiA+DQo+ID4gPiBXZSBoYXZlIHN0cnVjdCBkbWFfcGFybXMg
aW4gc3RydWN0IGRldmljZSwgYnV0IHdoYXQgd2UgYWN0dWFsbHkNCj4gPiA+IG5lZWQNCj4gPiA+
IGlzDQo+ID4gPiB0byBzdXBwb3J0IHNpbWlsYXIgb24gcGVyIGNoYW5uZWwgYmFzaXMgaW4gRE1B
ZW5naW5lIGZyYW1ld29yay4NCj4gPiA+DQo+ID4gPiBTbywgaW5zdGVhZCBvZiB3b3JraW5nIGFy
b3VuZCB0aGlzIEkgcmVjb21tZW5kIGVpdGhlciB0bw0KPiA+ID4gaW1wbGVtZW50DQo+ID4gPiBp
dA0KPiA+ID4gcHJvcGVybHkgb3IgcmVseSBvbiB0aGUgZmFjdCB0aGF0IGluIHRoZSBmdXR1cmUg
c29tZW9uZQ0KPiA+ID4gZXZlbnR1YWxseQ0KPiA+ID4gZG9lcyB0aGF0IGZvciB5b3UuDQo+ID4g
Pg0KPiA+ID4gRWFjaCBkcml2ZXIgd2hpY2ggaGFzIHRoaXMgcmUtc3BsaXR0aW5nIG1lY2hhbmlz
bSBzaG91bGQgYmUNCj4gPiA+IGNsZWFuZWQNCj4gPiA+IHVwIGFuZCByZWZhY3RvcmVkLg0KPiA+
DQo+ID4gSSBzdGlsbCBjYW4ndCBzZWUgYW55IHByb3Mgb2YgdGhpcyBpbXBsZW1lbnRhdGlvbi4N
Cj4gPiBUaGVyZSBpcyBubyBwZXJmb3JtYW5jZSBwcm9maXQ6IHdlIGFueXdheSBuZWVkIHRvIHJl
LXNwbGl0dCBzZ19saXN0DQo+ID4gKGJ1dCBub3cgaW4gZG1hLXVzZXIgZHJpdmVyIGluc3RlYWQg
b2YgZG1hIGRyaXZlcikNCi0tLT4tLS0NCj4gPiBJZiB3ZSB3YW50IHRvIHVzZSBzYW1lIGRlc2Ny
aXB0b3JzIHNldmVyYWwgdGltZXMgd2UganVzdCBjYW4gdXNlDQo+ID4gRE1BX0NUUkxfUkVVU0Ug
b3B0aW9uIC0gdGhlIGRlc2NyaXB0b3JzIHdpbGwgYmUgY3JlYXRlZCBvbmUgdGltZQ0KPiA+IGFu
ZCByZS1zcGxpdHRpbmcgd2lsbCBiZSDRgW9tcGxldGVkIG9ubHkgb25lIHRpbWUuDQo+DQo+IFRo
ZXJlIGFyZSB0d28gdHlwZSBvZiBkZXNjcmlwdG9yczogU1cgYW5kIEhXLiBUaGF0IGZsYWcgYWJv
dXQgU1cNCj4gZGVzY3JpcHRvciwgc28sIGl0IGluIG1vc3QgY2FzZXMgaGFzIG5vdGhpbmcgdG8g
ZG8gd2l0aCB0aGUgYWN0dWFsDQo+IGVudHJ5IHNpemUuDQoNCkhtbSwgSSBjaGVja2VkIGFsbCB2
aXJ0LWRtYSBjb2RlIGF0dGVudGl2ZWx5IGFuZCBJIGRvbid0IHNlZSB0aGlzDQpsaW1pdGF0aW9u
Lg0KVGhlIG9ubHkgZXhpc3RpbmcgbGltaXRhdGlvbiBJIGNhbiBzZWUgaXMgdGhhdCB3ZSBjYW4g
dXNlDQpETUFfQ1RSTF9SRVVTRSBvbmx5IGZvciBjaGFubmVscyBzdXBwb3J0aW5nIHNsYXZlIHRy
YW5zZmVycy4gKEJ1dCBpdCBpcw0KaXJyZWxldmFudCB0byBvdXIgZGlzY3Vzc2lvbikNCg0KU28s
IHdlIGNhbiB1c2UgRE1BX0NUUkxfUkVVU0UgZm9yIGJvdGggSFcvU1cgZGVzY3JpcHRvciB0eXBl
cy4NCg0KLS0NCsKgRXVnZW5peSBQYWx0c2V2
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
