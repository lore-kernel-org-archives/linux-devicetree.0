From: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: RE: [PATCH 2/2] regulator: add documentation for ACT8945A's
 regulator DT bindings
Date: Mon, 18 Jan 2016 01:31:58 +0000
Message-ID: <B256D81BAE5131468A838E5D7A243641D63F1B1E@penmbx01>
References: <1452218938-10621-1-git-send-email-wenyou.yang@atmel.com>
 <1452218938-10621-3-git-send-email-wenyou.yang@atmel.com>
 <20160115175905.GB6588@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160115175905.GB6588-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGkgTWFyaywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJrIEJy
b3duIFttYWlsdG86YnJvb25pZUBrZXJuZWwub3JnXQ0KPiBTZW50OiAyMDE2xOox1MIxNsjVIDE6
NTkNCj4gVG86IFlhbmcsIFdlbnlvdSA8V2VueW91LllhbmdAYXRtZWwuY29tPg0KPiBDYzogTGlh
bSBHaXJkd29vZCA8bGdpcmR3b29kQGdtYWlsLmNvbT47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtl
cm5lbC5vcmc+Ow0KPiBQYXdlbCBNb2xsIDxwYXdlbC5tb2xsQGFybS5jb20+OyBNYXJrIFJ1dGxh
bmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPjsgSWFuDQo+IENhbXBiZWxsIDxpamMrZGV2aWNldHJl
ZUBoZWxsaW9uLm9yZy51az47IEt1bWFyIEdhbGEgPGdhbGFrQGNvZGVhdXJvcmEub3JnPjsNCj4g
RmVycmUsIE5pY29sYXMgPE5pY29sYXMuRkVSUkVAYXRtZWwuY29tPjsgbGludXgtYXJtLQ0KPiBr
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsN
Cj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJd
IHJlZ3VsYXRvcjogYWRkIGRvY3VtZW50YXRpb24gZm9yIEFDVDg5NDVBJ3MgcmVndWxhdG9yDQo+
IERUIGJpbmRpbmdzDQo+IA0KPiBPbiBGcmksIEphbiAwOCwgMjAxNiBhdCAxMDowODo1OEFNICsw
ODAwLCBXZW55b3UgWWFuZyB3cm90ZToNCj4gDQo+ID4gK09wdGlvbmFsIHByb3BlcnRpZXM6DQo+
ID4gKy0gYWN0aXZlLXNlbWksdnNlbC1oaWdoOiBJbmRpY2F0ZXMgaWYgdGhlIFZTRUwgcGluIGlz
IHNldCB0byBsb2dpYy1oaWdoLg0KPiA+ICsgIElmIHRoaXMgcHJvcGVydHkgaXMgbWlzc2luZywg
YXNzdW1lIHRoZSBWU0VMIHBpbiBpcyBzZXQgdG8gbG9naWMtbG93Lg0KPiANCj4gV291bGRuJ3Qg
c3VjaCBhIHBpbiBub3JtYWxseSBiZSBjb25uZWN0ZWQgdG8gYSBHUElPIGZvciBydW50aW1lIGNv
bnRyb2wNCj4gLSB3aHkgaXMgaXQgZXhwZWN0ZWQgdG8gYmUgdGllZCBzdGF0aWNhbGx5IGFsbCB0
aGUgdGltZT8NCg0KT24gdGhlIHJlZmVyZW5jZSBib2FyZCwgaXQgaXMgY29ubmVjdGVkIHRvIHRo
ZSBWU1lTXzVWIHN0YXRpY2FsbHkuDQoNClllcywgaXQgc2hvdWxkIGJlIGNvbm5lY3RlZCB0byBh
IEdQSU8sIGl0IHNob3VsZCBiZSBjb250cm9sbGFibGUgYXQgdGhlIG5lY2Vzc2FyeSB0aW1lLg0K
DQoNCkJlc3QgUmVnYXJkcywNCldlbnlvdSBZYW5nIA0K
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
