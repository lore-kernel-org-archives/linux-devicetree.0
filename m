From: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 3/3] ARM: dts: r7s72100: add USB device to device tree
Date: Fri, 5 Jan 2018 12:42:11 +0000
Message-ID: <SG2PR06MB11655E1F0E338FE4EB455DFA8A1C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20180104200150.11352-1-chris.brandt@renesas.com>
 <20180104200150.11352-4-chris.brandt@renesas.com>
 <c6eac313-2d2d-70c8-16bb-ddb860fb7aa1@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c6eac313-2d2d-70c8-16bb-ddb860fb7aa1-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpZGF5LCBKYW51YXJ5IDA1LCAyMDE4LCBTZXJnZWkgU2h0eWx5b3Ygd3JvdGU6DQo+ID4g
Kwl1c2JoczA6IHVzYmhzQGU4MDEwMDAwIHsNCj4gDQo+ICAgICBUaGUgbm9kZSBuYW1lcyBzaG91
bGQgYmUgZ2VuZXJpYywgaS5lICJ1c2JAZTgwMTAwMDAiLg0KPiANCj4gPiArCQljb21wYXRpYmxl
ID0gInJlbmVzYXMsdXNiaHMtcjdzNzIxMDAiOw0KPiA+ICsJCXJlZyA9IDwweGU4MDEwMDAwIDB4
MUEwPjsNCj4gDQo+ICAgICBMb3dlcmNhc2UgaW4gdGhlIGhleCB2YWx1ZXMsIHBsZWFzZSBiZSBj
b25zaXN0ZW50Li4uDQo+IA0KPiA+ICsJCWludGVycnVwdHMgPSA8R0lDX1NQSSAoNzMtMzIpIElS
UV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICsJCWNsb2NrcyA9IDwmbXN0cDdfY2xrcyBSN1M3MjEw
MF9DTEtfVVNCMD47DQo+ID4gKwkJcmVuZXNhcyxidXN3YWl0ID0gPDQ+Ow0KPiA+ICsJCXBvd2Vy
LWRvbWFpbnMgPSA8JmNwZ19jbG9ja3M+Ow0KPiA+ICsJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+
ID4gKwl9Ow0KPiA+ICsNCj4gPiArCXVzYmhzMTogdXNiaHNAZTgyMDcwMDAgew0KPiA+ICsJCWNv
bXBhdGlibGUgPSAicmVuZXNhcyx1c2Jocy1yN3M3MjEwMCI7DQo+ID4gKwkJcmVnID0gPDB4ZTgy
MDcwMDAgMHgxQTA+Ow0KPiA+ICsJCWludGVycnVwdHMgPSA8R0lDX1NQSSAoNzQtMzIpIElSUV9U
WVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICsJCWNsb2NrcyA9IDwmbXN0cDdfY2xrcyBSN1M3MjEwMF9D
TEtfVVNCMT47DQo+ID4gKwkJcmVuZXNhcyxidXN3YWl0ID0gPDQ+Ow0KPiA+ICsJCXBvd2VyLWRv
bWFpbnMgPSA8JmNwZ19jbG9ja3M+Ow0KPiA+ICsJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4g
Kwl9Ow0KPiA+ICAgfTsNCj4gDQo+ICAgICBUaGUgc2FtZSBjb21tZW50cyBmb3IgdGhlIDJuZCBk
ZXZpY2UuDQoNClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCg0KSSdsbCBtYWtlIHRoZSBjaGFu
Z2VzIGFuZCByZXN1Ym1pdC4NCg0KQ2hyaXMNCg0K
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
