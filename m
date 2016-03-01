From: Zhiqiang Hou <zhiqiang.hou-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v2 2/2] ARM64: dts: add LS1043a-QDS board support
Date: Tue, 1 Mar 2016 02:42:02 +0000
Message-ID: <AM4PR04MB2148867ED34556A79AC0EB1584BB0@AM4PR04MB2148.eurprd04.prod.outlook.com>
References: <1450948298-33238-1-git-send-email-Zhiqiang.Hou@freescale.com>
 <1450948298-33238-2-git-send-email-Zhiqiang.Hou@freescale.com>
 <20160219032830.GG6756@tiger>
 <HE1PR04MB0906707F686591B374AA364F84A00@HE1PR04MB0906.eurprd04.prod.outlook.com>
 <20160228023818.GB22051@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160228023818.GB22051@tiger>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Zhiqiang Hou <Zhiqiang.Hou-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGkgU2hhd24sDQoNClRoYW5rcyBmb3IgeW91ciBhZHZpY2UhDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhd24gR3VvIFttYWlsdG86c2hhd25ndW9Aa2VybmVsLm9y
Z10NCj4gU2VudDogMjAxNsTqMtTCMjjI1SAxMDozOA0KPiBUbzogWmhpcWlhbmcgSG91IDx6aGlx
aWFuZy5ob3VAbnhwLmNvbT4NCj4gQ2M6IFpoaXFpYW5nIEhvdSA8WmhpcWlhbmcuSG91QGZyZWVz
Y2FsZS5jb20+OyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc7IFNoYW9odWkuWGllQGZyZWVzY2FsZS5jb207IHBhd2VsLm1vbGxAYXJtLmNvbTsNCj4g
aWpjK2RldmljZXRyZWVAaGVsbGlvbi5vcmcudWs7IGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tOyB3
aWxsLmRlYWNvbkBhcm0uY29tOw0KPiByb2JoK2R0QGtlcm5lbC5vcmc7IGdhbGFrQGNvZGVhdXJv
cmEub3JnOyBzY290dHdvb2RAZnJlZXNjYWxlLmNvbTsNCj4gTWluZ2thaS5IdUBmcmVlc2NhbGUu
Y29tOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiAyLzJdIEFSTTY0OiBkdHM6IGFkZCBMUzEwNDNhLVFEUyBib2FyZCBzdXBwb3J0
DQo+IA0KPiBPbiBGcmksIEZlYiAxOSwgMjAxNiBhdCAxMDoxMDowNEFNICswMDAwLCBaaGlxaWFu
ZyBIb3Ugd3JvdGU6DQo+IA0KPiA8c25pcD4NCj4gDQo+ID4gPiA+ICsJcGNhOTU0N0A3NyB7DQo+
ID4gPiA+ICsJCWNvbXBhdGlibGUgPSAicGhpbGlwcyxwY2E5NTQ3IjsNCj4gPiA+DQo+ID4gPiBJ
IGNhbm5vdCBmaW5kIHRoaXMgY29tcGF0aWJsZSBzdHJpbmcgaW4gZWl0aGVyIGJpbmRpbmcgZG9j
cyBvciBkcml2ZXIgY29kZS4NCj4gPiA+DQo+ID4NCj4gPiBTZWUgdGhlIGZpbGUgYmVsb3cuDQo+
ID4gLi9kcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NHguYzoxMTU6CXsgInBjYTk1NDci
LCBwY2FfOTU0NyB9LA0KPiA+IFBlcmhhcHMgdGhlIHZlbmRlciBuYW1lIHNob3VsZCBiZSB1cGRh
dGVkIHRvIG54cC4NCj4gDQo+IFllcywgaWYgeW91IGxvb2sgYXQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXV4LXBjYTk1NHgudHh0LA0KPiAibnhwLHBjYTk1NDci
IGlzIHRoZSBvbmUgeW91IHNob3VsZCB1c2UgaGVyZS4NCj4gDQo+IDxzbmlwPg0KPiANCj4gPiA+
ID4gKwkJCWVlcHJvbUA1NiB7DQo+ID4gPiA+ICsJCQkJY29tcGF0aWJsZSA9ICJhdDI0LDI0YzUx
MiI7DQo+ID4gPg0KPiA+ID4gVW5zdXBwb3J0ZWQvdW5kb2N1bWVudGVkIGNvbXBhdGlibGU/DQo+
ID4NCj4gPiBXaWxsIGNoYW5nZSBpdCB0byAiYXRtZWwsIDI0YzUxMiIuDQo+IA0KPiBZZXMsIGJ1
dCB3aXRob3V0IHRoZSBzcGFjZSBpbiB0aGUgbWlkZGxlLg0KPiANCj4gPg0KPiA+ID4NCj4gPiA+
ID4gKwkJCQlyZWcgPSA8MHg1Nj47DQo+ID4gPiA+ICsJCQl9Ow0KPiA+ID4gPiArDQo+ID4gPiA+
ICsJCQllZXByb21ANTcgew0KPiA+ID4gPiArCQkJCWNvbXBhdGlibGUgPSAiYXQyNCwyNGM1MTIi
Ow0KPiA+ID4gPiArCQkJCXJlZyA9IDwweDU3PjsNCj4gPiA+ID4gKwkJCX07DQo+ID4gPiA+ICsN
Cj4gPiA+ID4gKwkJCWFkdDc0NjFhQDRjIHsNCj4gPiA+DQo+ID4gPiB0ZW1wLXNlbnNvciBzaG91
bGQgYmUgYSBiZXR0ZXIgbm9kZSBuYW1lLCBpZiBJIHVuZGVyc3RhbmQgdGhlIGRldmljZSBjb3Jy
ZWN0bHkuDQo+ID4gPg0KPiA+DQo+ID4gSSBkaWRuJ3QgZmluZCBhIHJlZmVyZW5jZSBpbiBrZXJu
ZWwsIHNvIHdoYXQgbmFtZSBzaG91bGQgYmUgYmV0dGVyLCBkbyB5b3UgaGF2ZQ0KPiBhbnkgYWR2
aWNlPw0KPiANCj4gInRlbXAtc2Vuc29yIiBpcyB3aGF0IEkgc2VlIGZyb20gdGhlIGV4YW1wbGUg
aW4NCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL2xtOTAudHh0Lg0K
PiANCg0KVGhhbmtzLA0KWmhpcWlhbmcNCg==
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
