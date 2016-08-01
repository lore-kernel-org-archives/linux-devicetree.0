From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 3/3] ehci-platform: add the max clock number to 4
Date: Mon, 01 Aug 2016 16:18:09 +0800
Message-ID: <255931470039489@web30j.yandex.ru>
References: <20160731112536.4625-1-icenowy@aosc.xyz>
 <20160731112536.4625-3-icenowy@aosc.xyz> <2477355.hXm3xYUusy@wuerfel>
 <414101470035152@web9j.yandex.ru>
 <01a348da-3b26-68a6-9d9f-c37d81b4fd64@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <01a348da-3b26-68a6-9d9f-c37d81b4fd64@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans de Goede <hdegoede@redhat.com>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Reinder de Haan <patchesrdh@mveas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Tony Prisk <linux@prisktech.co.nz>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

CgowMS4wOC4yMDE2LCAxNToyNywgIkhhbnMgZGUgR29lZGUiIDxoZGVnb2VkZUByZWRoYXQuY29t
PjoKPiBIaSwKPgo+IE9uIDAxLTA4LTE2IDA5OjA1LCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsb2NrcyA9
IDwmY2N1IENMS19BNjRfQlVTX09IQ0kxPiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA8JmNjdSBDTEtfQTY0X0JV
U19FSENJMT4sCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgPCZjY3UgQ0xLX0E2NF9VU0JfT0hDSTA+LAo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoDwmY2N1IENMS19BNjRfVVNCX09IQ0kxPjsKPj4KPj4gwqBPbiBBNjQsIEVIQ0kgcmVx
dWlyZXMgdGhlIG1hdGNoZWQgT0hDSSB0byB3b3JrLgo+Cj4gQWgsIHNvIGp1c3QgbGlrZSBvbiB0
aGUgSDMgKHdoZXJlIHRoaXMgYWxzbyBpcyBuZWVkZWQKPiBhbmQgbm90IGRvY3VtZW50ZWQpLgpZ
ZXMsIEkgZmVlbGVkIHRoYXQgQTY0IGlzIGxpa2UgYSBoeWJyaWQgb2YgSDMgYW5kIEEzMy4KPgo+
PiDCoEFuZCBPSENJMSBjbG9jayByZXF1aXJlcyBPSENJMCBjbG9jayB0byB3b3JrLgo+Cj4gSG1t
LCB0aGF0IG9uZSBpcyBuZXcsIGNhbiB5b3UgZG91YmxlIGNoZWNrIHRoaXMgPwpTQ0xLX0dBVElO
R19PSENJLgpHYXRpbmcgU3BlY2lhbCBDbG9jayBGb3IgT0hDSSg0OE0gYW5kIDEyTSkKMDA6IENs
b2NrIGlzIE9GRgowMTogT1RHLU9IQ0kgQ2xvY2sgaXMgT04KMTA6IENsb2NrIGlzIE9GRgoxMTpP
VEctT0hDSSBhbmQgT0hDSTAgQ2xvY2sgaXMgT04KClAuMTEzIG9mIEE2NCB1c2VyIG1hbnVhbCAx
LjAKPgo+IFJlZ2FyZHMsCj4KPiBIYW5zCj4KPj4gwqAoQnV0IGZyb20gdGhlIFNvQydzIHVzZXIg
bWFudWFsIHdlIGNhbm5vdCBnZXQgYW55IGluZm9tYXRpb24KPj4gwqBhYm91dCB0aGUgcmVsYXRp
b25zaGlwIGJldHdlZW4gT0hDSTEgY2xvY2sgYW5kIE9IQ0kwIGNsb2NrLAo+PiDCoGFuZCBpbiB0
aGUgbWFudWFsIE9IQ0kwIGNsb2NrIGlzIGNhbGxlZCBPVEctT0hDSSkKPj4KPj4gwqAwMS4wOC4y
MDE2LCAxNTowMSwgIkFybmQgQmVyZ21hbm4iIDxhcm5kQGFybmRiLmRlPjoKPj4+IMKgT24gU3Vu
ZGF5LCBKdWx5IDMxLCAyMDE2IDc6MjU6MzYgUE0gQ0VTVCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+
Pj4+IMKgwqBBbGx3aW5uZXIgQTY0IEVIQ0kgcmVxdWlyZXMgNCBjbG9ja3MgdG8gYmUgZW5hYmxl
ZC4KPj4+Pgo+Pj4+IMKgwqBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFv
c2MueHl6Pgo+Pj4KPj4+IMKgQ2FuIHlvdSBzYXkgd2hhdCB0aG9zZSBmb3VyIGNsb2NrcyBhcmU/
Cj4+Pgo+Pj4gwqBBcmUgeW91IHN1cmUgdGhhdCBpdCdzIG5vdCBqdXN0IGEgY2FzZSBvZiBhIGNs
b2NrIGJlaW5nCj4+PiDCoGluY29ycmVjdGx5IGRlc2NyaWJlZCBpbiB0aGUgY2xrIGRyaXZlciwg
aS5lLiB5b3UgcmVmZXJlbmNlCj4+PiDCoG9uZSBjbG9jayBhbG9uZyB3aXRoIGl0cyBwYXJlbnQg
aGVyZT8KPj4+Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqBBcm5kCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
