From: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/9] ARC: [dts] Introduce Timer bindings
Date: Tue, 2 Feb 2016 12:48:28 +0000
Message-ID: <1454417306.25997.5.camel@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
	 <1454410739-24444-3-git-send-email-vgupta@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454410739-24444-3-git-send-email-vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Content-ID: <BCF042255C7FA049A077D2001D13A97E-z7JfP6tgrtVBCHUSTMH8dZqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "noamc-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org" <noamc-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGkgVmluZWV0LA0KDQpPbiBUdWUsIDIwMTYtMDItMDIgYXQgMTY6MjggKzA1MzAsIFZpbmVldCBH
dXB0YSB3cm90ZToNCj4gQVJDIFRpbWVycyBoYXZlIGhpc3RvcmljYWxseSBiZWVuIHByb2JlZCBk
aXJlY3RseS4NCj4gQXMgcHJlY3Vyc29yIHRvIHN0YXJ0IHByb2JpbmcgVGltZXJzIHRocnUgRFQg
aW50cm9kdWNlIHRoZXNlIGJpbmRpbmdzDQo+IA0KPiBDYzogRGFuaWVsIExlemNhbm8gPGRhbmll
bC5sZXpjYW5vQGxpbmFyby5vcmc+DQo+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
Pg0KPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU2lnbmVkLW9mZi1ieTogVmlu
ZWV0IEd1cHRhIDx2Z3VwdGFAc3lub3BzeXMuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gK1Jl
cXVpcmVkIHByb3BlcnRpZXM6DQo+ICsNCj4gKy0gY29tcGF0aWJsZSA6IHNob3VsZCBiZSAic25w
cyxhcmMtdGltZXIwIg0KPiArLSBpbnRlcnJ1cHRzIDogc2luZ2xlIEludGVycnVwdCBnb2luZyBp
bnRvIHBhcmVudCBpbnRjDQo+ICsJICAgICAgICgxNiBmb3IgQVJDSFMgY29yZXMsIDMgZm9yIEFS
QzcwMCBjb3JlcykNCj4gKy0gY2xvY2tzICAgICA6IHBoYW5kbGUgdG8gdGhlIHNvdXJjZSBjbG9j
aw0KPiArDQo+ICtPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiArDQo+ICstIGludGVycnVwdC1wYXJl
bnQgOiBwaGFuZGxlIHRvIHBhcmVudCBpbnRjDQo+ICsNCj4gK0V4YW1wbGU6DQo+ICsNCj4gKwl0
aW1lcjA6IHRpbWVyX2Nsa2V2dCB7DQo+ICsJCWNvbXBhdGlibGUgPSAic25wcyxhcmMtdGltZXIw
IjsNCj4gKwkJaW50ZXJydXB0cyA9IDwzPjsNCj4gKwkJaW50ZXJydXB0LXBhcmVudCA9IDwmY29y
ZV9pbnRjPjsNCj4gKwkJY2xvY2tzID0gPCZ0aW1lcjBfY2xrPjsNCg0KRXZlbiB0aG91Z2ggdGhp
cyBpcyBhbiBleGFtcGxlIG1heWJlIHdlIG1heQ0KdXNlIHRoZSBzYW1lICJjb3JlX2NsayIgYXMg
aW4gcmVhbCAuZHRzIGJlbG93Pw0KDQotQWxleGV5
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
