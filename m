From: Po Liu <po.liu-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v3 1/2] nxp/dts: add pcie aer interrupt-name property in
 the dts
Date: Thu, 16 Jun 2016 10:50:23 +0000
Message-ID: <VI1PR0401MB1709B98EC43F035158CF022E92560@VI1PR0401MB1709.eurprd04.prod.outlook.com>
References: <1464242406-20203-1-git-send-email-po.liu@nxp.com>
 <1465892645-32381-1-git-send-email-po.liu@nxp.com>
 <20160616003627.GJ20243@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160616003627.GJ20243@tiger>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Zang <roy.zang-3arQi8VN3Tc@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>, Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, Minghuan Lian <minghuan.lian-3arQi8VN3Tc@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGkgU2hhd24sDQoNCj4gIC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ICBGcm9tOiBTaGF3
biBHdW8gW21haWx0bzpzaGF3bmd1b0BrZXJuZWwub3JnXQ0KPiAgU2VudDogVGh1cnNkYXksIEp1
bmUgMTYsIDIwMTYgODozNiBBTQ0KPiAgVG86IFBvIExpdQ0KPiAgQ2M6IGxpbnV4LXBjaUB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gIGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBS
b3kgWmFuZzsgQXJuZA0KPiAgQmVyZ21hbm47IE1hcmMgWnluZ2llcjsgU3R1YXJ0IFlvZGVyOyBZ
YW5nLUxlbyBMaTsgTWluZ2h1YW4gTGlhbjsgTXVyYWxpDQo+ICBLYXJpY2hlcmk7IEJqb3JuIEhl
bGdhYXM7IE1pbmdrYWkgSHUNCj4gIFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS8yXSBueHAvZHRz
OiBhZGQgcGNpZSBhZXIgaW50ZXJydXB0LW5hbWUNCj4gIHByb3BlcnR5IGluIHRoZSBkdHMNCj4g
IA0KPiAgT24gVHVlLCBKdW4gMTQsIDIwMTYgYXQgMDQ6MjQ6MDRQTSArMDgwMCwgUG8gTGl1IHdy
b3RlOg0KPiAgPiBOWFAgc29tZSBwbGF0Zm9ybXMgYWVyIGludGVycnVwdCB3YXMgbm90IE1TSS9N
U0ktWC9JTlR4IGJ1dCB1c2luZw0KPiAgPiBpbnRlcnJ1cHQgbGluZSBpbmRlcGVuZGVudGx5LiBU
aGlzIHBhdGNoIGFkZCBhICJhZXIiDQo+ICA+IGludGVycnVwdC1uYW1lcyBmb3IgYWVyIGludGVy
cnVwdC4NCj4gID4NCj4gID4gU2lnbmVkLW9mZi1ieTogUG8gTGl1IDxwby5saXVAbnhwLmNvbT4N
Cj4gID4gLS0tDQo+ICA+IGNoYW5nZXMgZm9yIHYzOg0KPiAgPiAJLSBOb25lOw0KPiAgPg0KPiAg
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2xheWVyc2NhcGUtcGNpLnR4dCAgICAgICAg
IHwgIDQgKystLQ0KPiAgDQo+ICBUaGUgYmluZGluZ3Mgc2hvdWxkbid0IGJlIHBhcnQgb2YgZHRz
IHBhdGNoIGJ1dCB0aGUgZHJpdmVyIHBhdGNoIHdobyBpcw0KPiAgYWN0dWFsbHkgdXNpbmcgaXQu
DQo+ICANCj4gIFNoYXduDQoNCk9rLCBJJ2xsIG1vdmUgdGhlIGRvYyBwYXJ0IHRvIHRoZSBkcml2
ZXIgcGF0Y2guDQoNClBvIExpdQ0KRnJvbSBOWFANCj4gIA0KPiAgPiAgYXJjaC9hcm0vYm9vdC9k
dHMvbHMxMDIxYS5kdHNpICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrKy0tDQo+ICA+
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDQzYS5kdHNpICAgICAgICAg
fCAxOA0KPiAgKysrKysrKysrLS0tLS0tLS0tDQo+ICA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9mc2wtbHMyMDgwYS5kdHNpICAgICAgICAgfCAxNiArKysrKysrKy0NCj4gIC0tLS0t
LS0NCj4gID4gIDQgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25z
KC0pDQo=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
