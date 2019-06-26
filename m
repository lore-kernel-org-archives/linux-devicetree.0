From: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [EXT] Re: [PATCH v5 2/2] drm/panel: Add support for Raydium
 RM67191 panel driver
Date: Wed, 26 Jun 2019 12:13:23 +0000
Message-ID: <1561551202.9328.93.camel@nxp.com>
References: <1561544420-15572-1-git-send-email-robert.chiras@nxp.com>
         <1561544420-15572-3-git-send-email-robert.chiras@nxp.com>
         <20190626113306.GA24921@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626113306.GA24921@ravnborg.org>
Content-Language: en-US
Content-ID: <891AD3EE32C2F64BB3ABB9E1B06E6B39@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "sam@ravnborg.org" <sam@ravnborg.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "airlied@linux.ie" <airlied@linux.ie>
List-Id: devicetree@vger.kernel.org

SGkgU2FtLA0KDQpPbiBNaSwgMjAxOS0wNi0yNiBhdCAxMzozMyArMDIwMCwgU2FtIFJhdm5ib3Jn
IHdyb3RlOg0KPiBIaSBSb2JlcnQuDQo+IA0KPiBPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAwMToy
MDoyMFBNICswMzAwLCBSb2JlcnQgQ2hpcmFzIHdyb3RlOg0KPiA+IA0KPiA+IFRoaXMgcGF0Y2gg
YWRkcyBSYXlkaXVtIFJNNjcxOTEgVEZUIExDRCBwYW5lbCBkcml2ZXIgKE1JUEktRFNJDQo+ID4g
cHJvdG9jb2wpLg0KPiBJIHdhcyBhYm91dCB0byBhcHBseSB0aGVzZSAtIGJ1dCBJIGdldCBmb2xs
b3dpbmcgd2FybmluZ3MgZHVyaW5nDQo+IGJ1aWxkOg0KPiDCoCBDQ8KgwqDCoMKgwqDCoGRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXlkaXVtLXJtNjcxOTEubw0KPiAvaG9tZS9zYW0vZHJt
L2xpbnV4LmdpdC9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmF5ZGl1bS0NCj4gcm02NzE5
MS5jOiBJbiBmdW5jdGlvbiDigJhyYWRfYmxfZ2V0X2JyaWdodG5lc3PigJk6DQo+IC9ob21lL3Nh
bS9kcm0vbGludXguZ2l0L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXlkaXVtLQ0KPiBy
bTY3MTkxLmM6NDcwOjE3OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg4oCYZGV24oCZIFstV3Vu
dXNlZC12YXJpYWJsZV0NCj4gwqAgc3RydWN0IGRldmljZSAqZGV2ID0gJmRzaS0+ZGV2Ow0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgXn5+DQo+IC9ob21lL3NhbS9kcm0vbGlu
dXguZ2l0L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXlkaXVtLQ0KPiBybTY3MTkxLmM6
IEluIGZ1bmN0aW9uIOKAmHJhZF9ibF91cGRhdGVfc3RhdHVz4oCZOg0KPiAvaG9tZS9zYW0vZHJt
L2xpbnV4LmdpdC9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmF5ZGl1bS0NCj4gcm02NzE5
MS5jOjQ5MjoxNzogd2FybmluZzogdW51c2VkIHZhcmlhYmxlIOKAmGRlduKAmSBbLVd1bnVzZWQt
dmFyaWFibGVdDQo+IMKgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZkc2ktPmRldjsNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoF5+fg0KPiANCj4gUGxlYXNlIGZpeCBhbmQgdXBk
YXRlIHlvdXIgc2NyaXB0cyB0byBjYXRjaCB0aGlzIGluIHRoZSBmdXR1cmUuDQpPaCwgSSBhbSBz
b3JyeSBhYm91dCB0aGF0LCBzZWVtcyB0aGF0IEkgbWlzc2VkIHRoYXQgOigNCkZpeGVkIGFuZCBz
dWJtaXR0ZWQuDQo+IA0KPiDCoMKgwqDCoMKgwqDCoMKgU2FtDQoNClRoYW5rcywNClJvYmVydA==
