From: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/9] ARC: [dts] Introduce Timer bindings
Date: Tue, 2 Feb 2016 15:36:14 +0000
Message-ID: <1454427373.25997.24.camel@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
	 <1454410739-24444-3-git-send-email-vgupta@synopsys.com>
	 <1454418916.25997.18.camel@synopsys.com> <56B0BD2F.5080409@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B0BD2F.5080409-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Content-ID: <E9DC1CDF46B31449BA5423CBA7D66A8A-z7JfP6tgrtVBCHUSTMH8dZqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "noamc-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org" <noamc-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGkgVmluZWV0LA0KDQpPbiBUdWUsIDIwMTYtMDItMDIgYXQgMTk6NTkgKzA1MzAsIFZpbmVldCBH
dXB0YSB3cm90ZToNCj4gSGkgQWxleGV5LA0KPiANCj4gT24gVHVlc2RheSAwMiBGZWJydWFyeSAy
MDE2IDA2OjQ1IFBNLCBBbGV4ZXkgQnJvZGtpbiB3cm90ZToNCj4gPiBIaSBWaW5lZXQsDQo+ID4g
DQo+ID4gT24gVHVlLCAyMDE2LTAyLTAyIGF0IDE2OjI4ICswNTMwLCBWaW5lZXQgR3VwdGEgd3Jv
dGU6DQo+ID4gPiArDQo+ID4gPiArUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiA+ICsNCj4gPiA+
ICstIGNvbXBhdGlibGUgOiBzaG91bGQgYmUgInNucHMsYXJjLXRpbWVyMCINCj4gPiA+ICstIGlu
dGVycnVwdHMgOiBzaW5nbGUgSW50ZXJydXB0IGdvaW5nIGludG8gcGFyZW50IGludGMNCj4gPiA+
ICsJICAgICAgICgxNiBmb3IgQVJDSFMgY29yZXMsIDMgZm9yIEFSQzcwMCBjb3JlcykNCj4gPiA+
ICstIGNsb2NrcyAgICAgOiBwaGFuZGxlIHRvIHRoZSBzb3VyY2UgY2xvY2sNCj4gPiANCj4gPiBB
Y3R1YWxseSB3ZSdyZSBub3QgZmxleGlibGUgaGVyZS4NCj4gPiBTZWUgd2UgaGF2ZSBoYXJkLWNv
ZGVkICJjb3JlX2NsayIgaW4gW1BBVENIIDgvOV0uDQo+ID4gV2UgdXNlIGl0IGRpcmVjdGx5IGlu
IHNob3dfY3B1aW5mbygpIGZvciByZWFkaW5nIGNsb2NrIHNwZWVkDQo+ID4gYXMgd2VsbCBhcyBp
biBheHMxMDNfZWFybHlfaW5pdCgpLg0KPiA+IA0KPiA+IFNvICJzb3VyY2UgY2xvY2siIGhlcmUg
TVVTVCBiZSAiY29yZV9jbGsiLCBvdGhlcndpc2UNCj4gPiAvcHJvYy9jcHVpbmZvIHdpbGwgcmVw
b3J0IGp1bmsgaW5zdGVhZCBvZiBtZWFuaW5nZnVsIGRhdGEgYXQgbGVhc3QuDQo+IA0KPiBVc2lu
ZyBoYXJkY29kZWQgRFQgbmFtZXMgaW4gZ2VuZXJpYyBjb2RlIGlzIHRvdGFsIEJTIGFuZCBJIHNs
YXAgbXlzZWxmIGZvciBtaXNzaW5nDQo+IHRoYXQgaW4gcmV2aWV3aW5nIDgvOS4gUGxlYXNlIGZp
eCBpdCAhDQoNCkJ1dCB0aGUgb25seSBvdGhlciBhbHRlcm5hdGl2ZSB0byBoYXJkLWNvZGVkIG5h
bWUgaXMgdXNlIG9mIHNvbWUgaW50ZXJuYWwgdmFyaWFibGUNCmxpa2UgImFyY190aW1lcl9mcmVx
Ii4NCg0KSS5lLiB3ZSBtYWtlICJhcmNfdGltZXJfZnJlcSIgZ2xvYmFsIGFuZCB1c2UgaXQgZm9y
IGRpc3BsYXlpbmcgY29yZSBmcmVxdWVuY3kuDQoNCkFyZSB5b3UgT0sgd2l0aCB0aGF0Pw0KDQot
QWxleGV5
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
