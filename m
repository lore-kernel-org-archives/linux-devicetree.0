From: "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] dma: Add Xilinx AXI Video Direct Memory Access
 Engine driver support
Date: Thu, 23 Jan 2014 13:38:37 +0000
Message-ID: <1390484317.7619.81.camel@smile>
References: <1390409565-4200-1-git-send-email-sthokal@xilinx.com>
	 <1390409565-4200-2-git-send-email-sthokal@xilinx.com>
	 <52E0FC22.8060903@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52E0FC22.8060903-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Content-Language: en-US
Content-ID: <AF2F9C8839194F4C8194B17569A6F1F3-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "Williams, Dan J" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDE0LTAxLTIzIGF0IDEyOjI1ICswMTAwLCBMYXJzLVBldGVyIENsYXVzZW4gd3Jv
dGU6DQo+IE9uIDAxLzIyLzIwMTQgMDU6NTIgUE0sIFNyaWthbnRoIFRob2thbGEgd3JvdGU6DQoN
ClsuLi5dDQoNCj4gPiArCS8qIFJlcXVlc3QgdGhlIGludGVycnVwdCAqLw0KPiA+ICsJY2hhbi0+
aXJxID0gaXJxX29mX3BhcnNlX2FuZF9tYXAobm9kZSwgMCk7DQo+ID4gKwllcnIgPSBkZXZtX3Jl
cXVlc3RfaXJxKHhkZXYtPmRldiwgY2hhbi0+aXJxLCB4aWxpbnhfdmRtYV9pcnFfaGFuZGxlciwN
Cj4gPiArCQkJICAgICAgIElSUUZfU0hBUkVELCAieGlsaW54LXZkbWEtY29udHJvbGxlciIsIGNo
YW4pOw0KPiANCj4gVGhpcyBpcyBhIGNsYXNpYyBleGFtcGxlIG9mIHdoZXJlIHRvIG5vdCB1c2Ug
ZGV2bV9yZXF1ZXN0X2lycS4gJ2NoYW4nIGlzDQo+IGFjY2Vzc2VkIGluIHRoZSBpbnRlcnJ1cHQg
aGFuZGxlciwgYnV0IGlmIHlvdSB1c2UgZGV2bV9yZXF1ZXN0X2lycSAnY2hhbicNCj4gd2lsbCBi
ZSBmcmVlZCBiZWZvcmUgdGhlIGludGVycnVwdCBoYW5kbGVyIGhhcyBiZWVuIHJlbGVhc2VkLCB3
aGljaCBtZWFucw0KPiB0aGVyZSBpcyBub3cgYSByYWNlIGNvbmRpdGlvbiB3aGVyZSB0aGUgaW50
ZXJydXB0IGhhbmRsZXIgY2FuIGFjY2VzcyBhbHJlYWR5DQo+IGZyZWVkIG1lbW9yeS4NCg0KQ291
bGQgeW91IGVsYWJvcmF0ZSB0aGlzIGNhc2U/IEFzIGZhciBhcyBJIHVuZGVyc3Rvb2QgbWFuYWdl
ZCByZXNvdXJjZXMNCmFyZSBhIGtpbmQgb2Ygc3RhY2sgcGlsZS4gSW4gdGhpcyBjYXNlIHlvdSBo
YXZlIG5vIHN1Y2ggY29uZGl0aW9uLiBXaGVyZQ0KYW0gSSB3cm9uZz8NCg0KDQotLSANCkFuZHkg
U2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AaW50ZWwuY29tPg0KSW50ZWwgRmlubGFuZCBP
eQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCkludGVsIEZpbmxhbmQgT3kKUmVnaXN0ZXJlZCBBZGRyZXNzOiBQTCAy
ODEsIDAwMTgxIEhlbHNpbmtpIApCdXNpbmVzcyBJZGVudGl0eSBDb2RlOiAwMzU3NjA2IC0gNCAK
RG9taWNpbGVkIGluIEhlbHNpbmtpIAoKVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBt
YXkgY29udGFpbiBjb25maWRlbnRpYWwgbWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVzZSBvZiB0aGUg
aW50ZW5kZWQgcmVjaXBpZW50KHMpLiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbgpieSBvdGhl
cnMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkCnJl
Y2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXMu
Cg==

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
