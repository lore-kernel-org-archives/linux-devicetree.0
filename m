From: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: RE: [PATCH v6 1/2] drivers: watchdog: add a driver to support
 SAMA5D4 watchdog timer
Date: Fri, 28 Aug 2015 01:30:51 +0000
Message-ID: <B256D81BAE5131468A838E5D7A243641C9F967D2@penmbx01>
References: <1438856146-2459-1-git-send-email-wenyou.yang@atmel.com>
 <1438856206-2503-1-git-send-email-wenyou.yang@atmel.com>
 <55C4CDEB.9020505@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55C4CDEB.9020505-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org" <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org" <sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org>, "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayBb
bWFpbHRvOmxpbnV4QHJvZWNrLXVzLm5ldF0NCj4gU2VudDogMjAxNcTqONTCN8jVIDIzOjI2DQo+
IFRvOiBZYW5nLCBXZW55b3U7IHdpbUBpZ3VhbmEuYmU7IHJvYmgrZHRAa2VybmVsLm9yZzsgcGF3
ZWwubW9sbEBhcm0uY29tOw0KPiBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgaWpjK2RldmljZXRyZWVA
aGVsbGlvbi5vcmcudWs7IGdhbGFrQGNvZGVhdXJvcmEub3JnDQo+IENjOiBzeWx2YWluLnJvY2hl
dEBmaW5zZWN1ci5jb207IEZlcnJlLCBOaWNvbGFzOyBib3Jpcy5icmV6aWxsb25AZnJlZS0NCj4g
ZWxlY3Ryb25zLmNvbTsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiB3YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2NiAxLzJdIGRyaXZlcnM6IHdhdGNoZG9nOiBhZGQgYSBkcml2ZXIg
dG8gc3VwcG9ydCBTQU1BNUQ0DQo+IHdhdGNoZG9nIHRpbWVyDQo+IA0KPiBPbiAwOC8wNi8yMDE1
IDAzOjE2IEFNLCBXZW55b3UgWWFuZyB3cm90ZToNCj4gPj5Gcm9tIFNBTUE1RDQsIHRoZSB3YXRj
aGRvZyB0aW1lciBpcyB1cGdyYXRlZCB3aXRoIGEgbmV3IGZlYXR1cmUsDQo+ID4gd2hpY2ggaXMg
ZGVzY3JpYmxlZCBhcyBpbiB0aGUgZGF0YXNoZWV0LCAiV0RUX01SIGNhbiBiZSB3cml0dGVuIHVu
dGlsDQo+ID4gYSBMT0NLTVIgY29tbWFuZCBpcyBpc3N1ZWQgaW4gV0RUX0NSIi4NCj4gPiBUaGF0
IGlzIHRvIHNheSwgYXMgbG9uZyBhcyB0aGUgYm9vdHN0cmFwIGFuZCB1LWJvb3QgZG9uJ3QgaXNz
dWUgYQ0KPiA+IExPQ0tNUiBjb21tYW5kLCBXRFRfTVIgY2FuIGJlIHdyaXR0ZW4gbW9yZSB0aGFu
IG9uY2UgaW4gdGhlIGRyaXZlci4NCj4gPg0KPiA+IFNvIHRoZSBTQU1BNUQ0IHdhdGNoZG9nIGRy
aXZlcidzIGltcGxlbWVudGF0aW9uIGlzIGRpZmZlcmVudCBmcm9tIHRoZQ0KPiA+IGF0OTFzYW05
MjYwIHdhdGNoZG9nIGRyaXZlciBpbXBsZW1lbnRlZCBpbiBmaWxlIGF0OTFzYW05X3dkdC5jLg0K
PiA+IFRoZSB1c2VyIGFwcGxpY2F0aW9uIG9wZW4gdGhlIGRldmljZSBmaWxlIHRvIGVuYWJsZSB0
aGUgd2F0Y2hkb2cgdGltZXINCj4gPiBoYXJkd2FyZSwgYW5kIGNsb3NlIHRvIGRpc2FibGUgaXQs
IGFuZCBzZXQgdGhlIHdhdGNoZG9nIHRpbWVyIHRpbWVvdXQNCj4gPiBieSBzZXRpbmcgV0RWIGFu
ZCBXREQgZmllbGRzIG9mIFdEVF9NUiByZWdpc3RlciwgYW5kIHBpbmcgdGhlIHdhdGNoZG9nDQo+
ID4gYnkgaXNzdWluZyBXRFJTVFQgY29tbWFuZCB0byBXRFRfQ1IgcmVnaXN0ZXIgd2l0aCBoYXJk
LWNvZGVkIGtleS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlbnlvdSBZYW5nIDx3ZW55b3Uu
eWFuZ0BhdG1lbC5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhA
cm9lY2stdXMubmV0Pg0KDQpIaSBWaW0sDQoNCkNhbiB0aGlzIHBhdGNoIHNlcmllcyBiZSBtZXJn
ZWQ/IENvdWxkIHlvdSBwbGVhc2U/DQoNCkJlc3QgUmVnYXJkcywNCldlbnlvdSBZYW5nDQoNCg==
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
