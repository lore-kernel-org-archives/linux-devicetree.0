From: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/9] ARC: [dts] Introduce Timer bindings
Date: Tue, 2 Feb 2016 22:57:26 +0000
Message-ID: <1454453846.25997.31.camel@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
	 <1454410739-24444-3-git-send-email-vgupta@synopsys.com>
	 <1454418916.25997.18.camel@synopsys.com> <56B0BD2F.5080409@synopsys.com>
	 <1454427373.25997.24.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454427373.25997.24.camel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Content-ID: <B49EFE5805EDDE488765FBE7B6704328-z7JfP6tgrtVBCHUSTMH8dZqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "noamc-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org" <noamc-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGkgVmluZWV0LA0KDQpPbiBUdWUsIDIwMTYtMDItMDIgYXQgMTg6MzYgKzAzMDAsIEFsZXhleSBC
cm9ka2luIHdyb3RlOg0KPiBIaSBWaW5lZXQsDQo+IA0KPiBPbiBUdWUsIDIwMTYtMDItMDIgYXQg
MTk6NTkgKzA1MzAsIFZpbmVldCBHdXB0YSB3cm90ZToNCj4gPiBIaSBBbGV4ZXksDQo+ID4gDQo+
ID4gT24gVHVlc2RheSAwMiBGZWJydWFyeSAyMDE2IDA2OjQ1IFBNLCBBbGV4ZXkgQnJvZGtpbiB3
cm90ZToNCj4gPiA+IEhpIFZpbmVldCwNCj4gPiA+IA0KPiA+ID4gT24gVHVlLCAyMDE2LTAyLTAy
IGF0IDE2OjI4ICswNTMwLCBWaW5lZXQgR3VwdGEgd3JvdGU6DQo+ID4gPiA+ICsNCj4gPiA+ID4g
K1JlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gPiA+ICsNCj4gPiA+ID4gKy0gY29tcGF0aWJsZSA6
IHNob3VsZCBiZSAic25wcyxhcmMtdGltZXIwIg0KPiA+ID4gPiArLSBpbnRlcnJ1cHRzIDogc2lu
Z2xlIEludGVycnVwdCBnb2luZyBpbnRvIHBhcmVudCBpbnRjDQo+ID4gPiA+ICsJICAgICAgICgx
NiBmb3IgQVJDSFMgY29yZXMsIDMgZm9yIEFSQzcwMCBjb3JlcykNCj4gPiA+ID4gKy0gY2xvY2tz
ICAgICA6IHBoYW5kbGUgdG8gdGhlIHNvdXJjZSBjbG9jaw0KPiA+ID4gDQo+ID4gPiBBY3R1YWxs
eSB3ZSdyZSBub3QgZmxleGlibGUgaGVyZS4NCj4gPiA+IFNlZSB3ZSBoYXZlIGhhcmQtY29kZWQg
ImNvcmVfY2xrIiBpbiBbUEFUQ0ggOC85XS4NCj4gPiA+IFdlIHVzZSBpdCBkaXJlY3RseSBpbiBz
aG93X2NwdWluZm8oKSBmb3IgcmVhZGluZyBjbG9jayBzcGVlZA0KPiA+ID4gYXMgd2VsbCBhcyBp
biBheHMxMDNfZWFybHlfaW5pdCgpLg0KPiA+ID4gDQo+ID4gPiBTbyAic291cmNlIGNsb2NrIiBo
ZXJlIE1VU1QgYmUgImNvcmVfY2xrIiwgb3RoZXJ3aXNlDQo+ID4gPiAvcHJvYy9jcHVpbmZvIHdp
bGwgcmVwb3J0IGp1bmsgaW5zdGVhZCBvZiBtZWFuaW5nZnVsIGRhdGEgYXQgbGVhc3QuDQo+ID4g
DQo+ID4gVXNpbmcgaGFyZGNvZGVkIERUIG5hbWVzIGluIGdlbmVyaWMgY29kZSBpcyB0b3RhbCBC
UyBhbmQgSSBzbGFwIG15c2VsZiBmb3IgbWlzc2luZw0KPiA+IHRoYXQgaW4gcmV2aWV3aW5nIDgv
OS4gUGxlYXNlIGZpeCBpdCAhDQo+IA0KPiBCdXQgdGhlIG9ubHkgb3RoZXIgYWx0ZXJuYXRpdmUg
dG8gaGFyZC1jb2RlZCBuYW1lIGlzIHVzZSBvZiBzb21lIGludGVybmFsIHZhcmlhYmxlDQo+IGxp
a2UgImFyY190aW1lcl9mcmVxIi4NCj4gDQo+IEkuZS4gd2UgbWFrZSAiYXJjX3RpbWVyX2ZyZXEi
IGdsb2JhbCBhbmQgdXNlIGl0IGZvciBkaXNwbGF5aW5nIGNvcmUgZnJlcXVlbmN5Lg0KDQpXZWxs
IGFjdHVhbGx5IHRoZXJlJ3MgYW5vdGhlciBwb3NzaWJpbGl0eSB0aGF0IGlzIHVzZWQgb24gbWFu
eSBvdGhlciBwbGF0Zm9ybXMNCihBUk0gYm90aCAzMiBhbmQgNjQtYml0IGZsYXZvcnMgaXMgYSBn
b29kIGV4YW1wbGUpIC0ganVzdCBwcmludCBib2dvbWlwcyBpbnN0ZWFkDQpvZiBhZGRpdGlvbmFs
IGNvcmUgZnJlcXVlbmN5Lg0KDQotQWxleGV5
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
