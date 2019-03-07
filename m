From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH RESEND V2 1/4] dt-bindings: fsl: scu: add watchdog binding
Date: Thu, 7 Mar 2019 12:22:32 +0000
Message-ID: <AM0PR04MB4211EAEA6F03465D372B0B4F804C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1550472539-16590-1-git-send-email-Anson.Huang@nxp.com>
 <1550472539-16590-2-git-send-email-Anson.Huang@nxp.com>
 <20190222195217.GA22194@bogus>
 <bb19470c-1590-f8dd-72e6-b382444d7902@roeck-us.net>
 <DB3PR0402MB3916912A64AF0837A9649913F5790@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <96932b3e-87f1-d8f2-95bc-0e9a8d5d45ed@roeck-us.net>
 <DB3PR0402MB391659B6A466B1D85114E9C9F57A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAL_JsqJV9NxpOJi3Jh2Uk-TOmOL4rWwqZp3sodxsRinAHZ3m3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJV9NxpOJi3Jh2Uk-TOmOL4rWwqZp3sodxsRinAHZ3m3w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Anson Huang <anson.huang@nxp.com>
Cc: Guenter Roeck <linux@roeck-us.net>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "heiko@sntech.de" <heiko@sntech.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, Andy Gross <andy.gross@linaro.org>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, enri
List-Id: devicetree@vger.kernel.org

SGkgUm9iLA0KDQo+ID4gPiBJIHRoaW5rIFJvYiBzdWdnZXN0ZWQgdGhhdCB0aGUgU0NVIHBhcmVu
dCBkcml2ZXIgc2hvdWxkIGluc3RhbnRpYXRlDQo+ID4gPiB0aGUgd2F0Y2hkb2cgd2l0aG91dCBl
eHBsaWNpdCB3YXRjaGRvZyBub2RlLiBUaGF0IHdvdWxkIGJlIHBvc3NpYmxlLA0KPiA+ID4gYnV0
IGl0IGN1cnJlbnRseSB1c2VzDQo+ID4gPiBkZXZtX29mX3BsYXRmb3JtX3BvcHVsYXRlKCkgdG8g
ZG8gdGhlIGluc3RhbnRpYXRpb24sIGFuZCBjaGFuZ2luZw0KPiA+ID4gdGhhdCB3b3VsZCBiZSBh
IG1lc3MuIEJlc2lkZXMsIGl0IGRvZXMgc2VtIHRvIG1lIHRoYXQgeW91ciBzdWdnZXN0ZWQNCj4g
PiA+IG5vZGUgd291bGQgZGVzY3JpYmUgdGhlIGhhcmR3YXJlLCBzbyBJIGFtIG5vdCBzdXJlIEkg
dW5kZXJzdGFuZCB0aGUNCj4gcmVhc29uaW5nLg0KPiANCj4gSXQgd291bGQganVzdCBiZSBhIGNh
bGwgdG8gY3JlYXRlIGEgcGxhdGZvcm0gZGV2aWNlIGluc3RlYWQuIEhvdyBpcyB0aGF0IGEgbWVz
cz8NCj4gDQo+IEl0J3MgZGVzY3JpYmluZyBmaXJtd2FyZS4gV2UgaGF2ZSBEVCBmb3IgZGVzY3Jp
YmluZyBoL3cgd2UndmUgZmFpbGVkIHRvIG1ha2UNCj4gZGlzY292ZXJhYmxlLiBXZSBzaG91bGQg
bm90IHJlcGVhdCB0aGF0IGFuZCBqdXN0IGRlc2NyaWJlIGZpcm13YXJlIGluIERULg0KPiBNYWtl
IHRoZSBmaXJtd2FyZSBkaXNjb3ZlcmFibGUhIFRob3VnaCB0aGVyZSBhcmUgY2FzZXMgbGlrZSBm
aXJtd2FyZQ0KPiBwcm92aWRlZCBjbG9ja3Mgd2hlcmUgd2Ugc3RpbGwgbmVlZCBzb21ldGhpbmcg
aW4gRFQsIGJ1dCB0aGlzIGlzIG5vdCBvbmUgb2YNCj4gdGhlbS4NCj4gDQoNClRoZSB3YXRjaGRv
ZyBub2RlIGhlcmUgaW4gcXVlc3Rpb24gYWN0dWFsbHkgaXMgbm90IHVzaW5nIFNDVSBmaXJtd2Fy
ZSBjYWxsLg0KRHVlIHRvIHNlY3VyaXR5IHJlcXVpcmVtZW50IGJ5IFNDVSwgd2F0Y2hkb2cgY2Fu
IG9ubHkgYmUgYWNjZXNzZWQgaW4NCnNlY3VyaXR5IG1vZGUsIGZvciBJTVggY2FzZSwgdmlhIEFS
TSBUcnVzdCBGaXJtd2FyZS4gVGhhdCBtZWFucyB0aGUNCndhdGNoZG9nIHVzZWQgaW4gTGludXgg
YWN0dWFsbHkgaXMgdXNpbmcgQVJNIFNNQyBjYWxsIGFuZCBkb2VzIG5vdA0KZGVwZW5kIFNDVSBk
cml2ZXIuIFNvIEl0IHdvdWxkIGJlIHN0cmFuZ2UgZm9yIFNDVSBkcml2ZXIgdG8gaW5zdGFudGlh
dGUgaXQuDQoNCkZvciB0aGlzIHNpdHVhdGlvbiwgZG8geW91IHRoaW5rIHdlIGNhbiBtb3ZlIHdh
dGNoZG9nIG91dCBvZiBzY3Ugbm9kZT8NCk1heWJlIHJlbmFtZSB0aGUgY29tcGF0aWJsZSBzdHJp
bmcgbGlrZSAiZnNsLGlteDhxeHAtc2lwLXdhdGNoZG9nIg0KYmVjYXVzZSBpdCdzIGFjdHVhbGx5
IGEgd2F0Y2hkb2cgc2VydmljZWQgYnkgQVRGIGZpcm13YXJlLg0KDQpSZWdhcmRzDQpEb25nIEFp
c2hlbmcNCg==
