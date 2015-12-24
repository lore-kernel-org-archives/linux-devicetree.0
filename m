From: Zhiqiang Hou <zhiqiang.hou-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH] ARM64: dts: add LS1043a-QDS board support
Date: Thu, 24 Dec 2015 09:16:00 +0000
Message-ID: <HE1PR04MB0906CD54FAA8EED00DE1F4B384E70@HE1PR04MB0906.eurprd04.prod.outlook.com>
References: <1450935037-42930-1-git-send-email-Zhiqiang.Hou@freescale.com>
 <1450935615.18314.125.camel@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450935615.18314.125.camel-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Zhiqiang Hou <Zhiqiang.Hou-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: "Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2NvdHQgV29vZCBbbWFp
bHRvOnNjb3R0d29vZEBmcmVlc2NhbGUuY29tXQ0KPiBTZW50OiAyMDE15bm0MTLmnIgyNOaXpSAx
Mzo0MA0KPiBUbzogWmhpcWlhbmcgSG91IDxaaGlxaWFuZy5Ib3VAZnJlZXNjYWxlLmNvbT47IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0
bGFuZEBhcm0uY29tOyBwYXdlbC5tb2xsQGFybS5jb207DQo+IGlqYytkZXZpY2V0cmVlQGhlbGxp
b24ub3JnLnVrOyBnYWxha0Bjb2RlYXVyb3JhLm9yZzsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsgY2F0YWxpbi5tYXJpbmFzQGFybS5jb207IHdpbGwuZGVhY29uQGFy
bS5jb20NCj4gQ2M6IE1pbmdrYWkuSHVAZnJlZXNjYWxlLmNvbTsgU2hhb2h1aS5YaWVAZnJlZXNj
YWxlLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBBUk02NDogZHRzOiBhZGQgTFMxMDQzYS1R
RFMgYm9hcmQgc3VwcG9ydA0KPiANCj4gT24gVGh1LCAyMDE1LTEyLTI0IGF0IDEzOjMwICswODAw
LCBaaGlxaWFuZyBIb3Ugd3JvdGU6DQo+ID4gKy9kdHMtdjEvOw0KPiA+ICsvaW5jbHVkZS8gImZz
bC1sczEwNDNhLmR0c2kiDQo+ID4gKw0KPiA+ICsvIHsNCj4gPiArCW1vZGVsID0gIkxTMTA0M0Eg
UURTIEJvYXJkIjsNCj4gPiArDQo+IA0KPiBjb21wYXRpYmxlPw0KDQp3aWxsIGFkZCByb290IG5v
ZGUgY29tcGF0aWJsZSBpbiB2Mi4NCg0KVGhhbmtzLA0KWmhpcWlhbmcNCg==
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
