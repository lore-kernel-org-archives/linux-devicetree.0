From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 4/4] ARM: dts: sun8i: add OTG function to Lichee Pi Zero
Date: Thu, 12 Jan 2017 04:13:34 +0800
Message-ID: <418251484165614@web21h.yandex.ru>
References: <20170103152534.20118-1-icenowy@aosc.xyz>
 <20170103152534.20118-5-icenowy@aosc.xyz>
 <20170110202443.GC2479@uda0271908>
 <2733831484164533@web1g.yandex.ru> <20170111200811.GA16865@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170111200811.GA16865@uda0271908>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bin Liu <b-liu@ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CgoxMi4wMS4yMDE3LCAwNDowOCwgIkJpbiBMaXUiIDxiLWxpdUB0aS5jb20+Ogo+IE9uIFRodSwg
SmFuIDEyLCAyMDE3IGF0IDAzOjU1OjMzQU0gKzA4MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4+
IMKgMTEuMDEuMjAxNywgMDQ6MjQsICJCaW4gTGl1IiA8Yi1saXVAdGkuY29tPjoKPj4gwqA+IE9u
IFR1ZSwgSmFuIDAzLCAyMDE3IGF0IDExOjI1OjM0UE0gKzA4MDAsIEljZW5vd3kgWmhlbmcgd3Jv
dGU6Cj4+IMKgPj4gwqBMaWNoZWUgUGkgWmVybyBmZWF0dXJlcyBhIFVTQiBPVEcgcG9ydC4KPj4g
wqA+Pgo+PiDCoD4+IMKgQWRkIHN1cHBvcnQgZm9yIGl0Lgo+PiDCoD4+Cj4+IMKgPj4gwqBOb3Rl
OiBpbiBvcmRlciB0byB1c2UgdGhlIEhvc3QgbW9kZSwgdGhlIGJvYXJkIG11c3QgYmUgcG93ZXJl
ZCB2aWEgdGhlCj4+IMKgPj4gwqArNVYgYW5kIEdORCBwaW5zLgo+PiDCoD4+Cj4+IMKgPj4gwqBT
aWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MueHl6Pgo+PiDCoD4+IMKg
LS0tCj4+IMKgPj4gwqDCoGFyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXYzcy1saWNoZWVwaS16ZXJv
LmR0cyB8IDEwICsrKysrKysrKysKPj4gwqA+PiDCoMKgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKykKPj4gwqA+Pgo+PiDCoD4+IMKgZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3N1bjhpLXYzcy1saWNoZWVwaS16ZXJvLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXYz
cy1saWNoZWVwaS16ZXJvLmR0cwo+PiDCoD4+IMKgaW5kZXggMDA5OWFmZmM2Y2UzLi4zZDkxNjhj
YmFlY2EgMTAwNjQ0Cj4+IMKgPj4gwqAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdW44aS12M3Mt
bGljaGVlcGktemVyby5kdHMKPj4gwqA+PiDCoCsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhp
LXYzcy1saWNoZWVwaS16ZXJvLmR0cwo+PiDCoD4+IMKgQEAgLTcxLDMgKzcxLDEzIEBACj4+IMKg
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+PiDCoD4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhdHVzID0gIm9rYXkiOwo+PiDCoD4+IMKgwqB9Owo+PiDC
oD4+IMKgKwo+PiDCoD4+IMKgKyZ1c2Jfb3RnIHsKPj4gwqA+PiDCoCsgZHJfbW9kZSA9ICJvdGci
Owo+PiDCoD4KPj4gwqA+IFdoeSBub3Qgc2V0IHRoaXMgZGVmYXVsdCBtb2RlIGluIGR0c2kgaW5z
dGVhZD8KPj4gwqA+Cj4+IMKgPiBSZWdhcmRzLAo+PiDCoD4gLUJpbi4KPj4KPj4gwqBUaGVyZSdz
IHBvc3NpYmx5IGJvYXJkcyB3aGljaCBkbyBub3QgaGF2ZSBPVEcgZnVuY3Rpb25zLgo+Cj4gVGhh
dCBpcyBib2FyZCBzcGVjaWZpYy4KPgo+IFlvdSdkIGJldHRlciB0byBkZWZpbmUgdGhlIGRlZmF1
bHQgZHJfbW9kZSB3aGljaCB0aGUgbXVzYiBfY29udHJvbGxlcl8KPiBzdXBwb3J0cyBpbiB0aGUg
ZHRzaSwgYW5kIHRoZW4gb3ZlcnJpZGUgaXQgaW4gYSBzcGVjaWZpYyBib2FyZCBkdHMgaWYKPiBu
ZWNlc3NhcnkuCgpJcyB0aGVyZSBNVVNCIGNvbnRyb2xsZXJzIHdoaWNoIGRvIG5vdCBzdXBwb3J0
IGEgY2VydGFpbiBtb2RlPwoKKEkgcmVtZW1iZXJlZCBteSBvbWFwMy1uOTAwIHdoaWNoIGRvIG5v
dCB3b3JrIHVuZGVyIE9URyBtb2RlLi4uKQoKPgo+IFJlZ2FyZHMsCj4gLUJpbi4KPgo+PiDCoEV2
ZW4gdGhlIG9mZmljaWFsIENEUiBkZXNpZ24gb2YgVjNzIHVzZXMgdGhlIFVTQiBjb250cm9sbGVy
IHRvCj4+IMKgY29ubmVjdCBhIFVWQyB3ZWJjYW0gdG8gbWFrZSB0aGUgZGVzaWduIGEgZHVhbC1j
YW0gZGVzaWduCj4+IMKgKFYzcyBpdHNlbGYgaGFzIGEgQ1NJKS4KPj4KPj4gwqA+Cj4+IMKgPj4g
wqArIHN0YXR1cyA9ICJva2F5IjsKPj4gwqA+PiDCoCt9Owo+PiDCoD4+IMKgKwo+PiDCoD4+IMKg
KyZ1c2JwaHkgewo+PiDCoD4+IMKgKyB1c2IwX2lkX2RldC1ncGlvID0gPCZwaW8gNSA2IEdQSU9f
QUNUSVZFX0hJR0g+Owo+PiDCoD4+IMKgKyBzdGF0dXMgPSAib2theSI7Cj4+IMKgPj4gwqArfTsK
Pj4gwqA+PiDCoC0tCj4+IMKgPj4gwqAyLjExLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
