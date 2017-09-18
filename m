From: "Z.q. Hou" <zhiqiang.hou-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCHv3 0/3] arm64: dts: add ls2088a and 1088a pcie DT nodes
Date: Mon, 18 Sep 2017 09:52:17 +0000
Message-ID: <AM5PR0402MB2771422484B12A966BC06B9D84630@AM5PR0402MB2771.eurprd04.prod.outlook.com>
References: <20170918093223.33364-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170918093223.33364-1-Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Z.q. Hou" <zhiqiang.hou-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGkgU2hhd24sDQoNClRoZSBMUzEwODggYW5kIExTMjA4OCBkcml2ZXIgcGF0Y2ggc2V0IGhhcyBi
ZWVuIGFwcGxpZWQgdG8gTGludXgtbmV4dC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBaaGlxaWFuZyBIb3UgW21haWx0bzpaaGlxaWFuZy5Ib3VAbnhwLmNvbV0NCj4g
U2VudDogMjAxN8TqOdTCMTjI1SAxNzozMg0KPiBUbzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gcm9iaCtkdEBrZXJu
ZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgY2F0YWxpbi5tYXJpbmFzQGFybS5jb207DQo+
IHdpbGwuZGVhY29uQGFybS5jb207IHNoYXduZ3VvQGtlcm5lbC5vcmc7IFByYWJoYWthciBLdXNo
d2FoYQ0KPiA8cHJhYmhha2FyLmt1c2h3YWhhQG54cC5jb20+DQo+IENjOiBaLnEuIEhvdSA8emhp
cWlhbmcuaG91QG54cC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSHYzIDAvM10gYXJtNjQ6IGR0czog
YWRkIGxzMjA4OGEgYW5kIDEwODhhIHBjaWUgRFQgbm9kZXMNCj4gDQo+IEZyb206IEhvdSBaaGlx
aWFuZyA8WmhpcWlhbmcuSG91QG54cC5jb20+DQo+IA0KPiBBZGQgR0lDdjMgSVRTIERUIG5vZGUg
Zm9yIGxzMTA4OGEsIGJlY2F1c2UgdGhlIFBDSWUgbm9kZXMgbXVzdCBoYXZlIGENCj4gbXNpLXBh
cmVudC4NCj4gDQo+IEhvdSBaaGlxaWFuZyAoMyk6DQo+ICAgYXJtNjQ6IGR0czogbHMyMDg4YTog
YWRkIHBjaWUgc3VwcG9ydA0KPiAgIGFybTY0OiBkdHM6IGxzMTA4OGE6IGFkZCBnaWN2MyBJVFMg
RFQgbm9kZQ0KPiAgIGFybTY0OiBkdHM6IGxzMTA4OGE6IGFkZCBQQ0llIGNvbnRyb2xsZXIgRFQg
bm9kZXMNCj4gDQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDg4YS5k
dHNpIHwgODINCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvZnNsLWxzMjA4OGEuZHRzaSB8ICA0ICsrDQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDg2IGluc2VydGlvbnMoKykNCj4gDQo+IC0tDQo+IDIuMTQuMQ0KDQpUaGFua3MsDQpaaGlx
aWFuZw0K
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
