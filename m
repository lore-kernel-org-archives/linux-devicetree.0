From: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v2 6/6] usb: chipidea: add work-around for Marvell HSIC
 PHY startup
Date: Thu, 21 May 2015 09:54:20 +0000
Message-ID: <BN3PR0301MB0849D35E915D701DE931EA9081C10@BN3PR0301MB0849.namprd03.prod.outlook.com>
References: <1432087805-16671-1-git-send-email-robh@kernel.org>
 <1432087805-16671-7-git-send-email-robh@kernel.org>
 <20150521031334.GA2897@shlinux2>
 <CAL_Jsq+0zaKZJwgAPea25a=TrChOJs0LdCRV-R824=qij3pnTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+0zaKZJwgAPea25a=TrChOJs0LdCRV-R824=qij3pnTw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
List-Id: devicetree@vger.kernel.org

IA0KPiANCj4gT24gV2VkLCBNYXkgMjAsIDIwMTUgYXQgMTA6MTMgUE0sIFBldGVyIENoZW4gPHBl
dGVyLmNoZW5AZnJlZXNjYWxlLmNvbT4NCj4gd3JvdGU6DQo+ID4gT24gVHVlLCBNYXkgMTksIDIw
MTUgYXQgMDk6MTA6MDVQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+ID4+IFRoZSBNYXJ2
ZWxsIDI4bm0gSFNJQyBQSFkgcmVxdWlyZXMgdGhlIHBvcnQgdG8gYmUgZm9yY2VkIHRvIEhTIG1v
ZGUNCj4gPj4gYWZ0ZXIgdGhlIHBvcnQgcG93ZXIgaXMgYXBwbGllZC4gVGhpcyBpcyBkb25lIHVz
aW5nIHRoZSB0ZXN0IG1vZGUgaW4NCj4gPj4gdGhlIFBPUlRTQyByZWdpc3Rlci4NCj4gPj4NCj4g
Pj4gQXMgSFNJQyBpcyBhbHdheXMgSFMsIHRoaXMgd29yay1hcm91bmQgc2hvdWxkIGJlIHNhZmUg
dG8gZG8gd2l0aCBhbGwNCj4gPj4gSFNJQyBQSFlzLiBJZiBub3QsIGEgZmxhZyBjYW4gYWxzbyBi
ZSBhZGRlZC4NCj4gPg0KPiA+IEkgdGhpbmsgYSBmbGFnIGlzIG5lZWRlZCwgbm90IHN1cmUgYWxs
IHZlbmRvcnMgY2FuIHdvcmsgd2VsbCB3aXRoIHRoYXQuDQo+IA0KPiBPbmx5IGkuTVg2U3ggdXNl
cyBIU0lDIGluIG1haW5saW5lLiBJcyB0aGF0IHNvbWV0aGluZyB5b3UgY2FuIHRlc3Q/IEl0IHdv
dWxkIGJlDQo+IGJldHRlciB0byBub3QgYWRkIGZsYWdzIHVubGVzcyB0aGV5IGFyZSByZWFsbHkg
bmVlZGVkLg0KPiBPdGhlcndpc2UgeW91IGVuZCB1cCB3aXRoIGRvemVucyBvZiBmbGFncyBsaWtl
IFNESENJIGRyaXZlcnMgaGF2ZS4NCj4gDQoNCkkgd2lsbCBoYXZlIGEgdGVzdCBmb3IgdGhpcywg
YW5kIHNob3cgeW91IHRoZSByZXN1bHQgbGF0ZXIuDQoNClBldGVyDQo=
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
