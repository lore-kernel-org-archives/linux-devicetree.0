From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 4/4] ARM: dts: sun8i: add OTG function to Lichee Pi Zero
Date: Thu, 12 Jan 2017 03:55:33 +0800
Message-ID: <2733831484164533@web1g.yandex.ru>
References: <20170103152534.20118-1-icenowy@aosc.xyz>
 <20170103152534.20118-5-icenowy@aosc.xyz> <20170110202443.GC2479@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170110202443.GC2479@uda0271908>
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

CgoxMS4wMS4yMDE3LCAwNDoyNCwgIkJpbiBMaXUiIDxiLWxpdUB0aS5jb20+Ogo+IE9uIFR1ZSwg
SmFuIDAzLCAyMDE3IGF0IDExOjI1OjM0UE0gKzA4MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4+
IMKgTGljaGVlIFBpIFplcm8gZmVhdHVyZXMgYSBVU0IgT1RHIHBvcnQuCj4+Cj4+IMKgQWRkIHN1
cHBvcnQgZm9yIGl0Lgo+Pgo+PiDCoE5vdGU6IGluIG9yZGVyIHRvIHVzZSB0aGUgSG9zdCBtb2Rl
LCB0aGUgYm9hcmQgbXVzdCBiZSBwb3dlcmVkIHZpYSB0aGUKPj4gwqArNVYgYW5kIEdORCBwaW5z
Lgo+Pgo+PiDCoFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy54eXo+
Cj4+IMKgLS0tCj4+IMKgwqBhcmNoL2FybS9ib290L2R0cy9zdW44aS12M3MtbGljaGVlcGktemVy
by5kdHMgfCAxMCArKysrKysrKysrCj4+IMKgwqAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKQo+Pgo+PiDCoGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdW44aS12M3MtbGlj
aGVlcGktemVyby5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdW44aS12M3MtbGljaGVlcGktemVy
by5kdHMKPj4gwqBpbmRleCAwMDk5YWZmYzZjZTMuLjNkOTE2OGNiYWVjYSAxMDA2NDQKPj4gwqAt
LS0gYS9hcmNoL2FybS9ib290L2R0cy9zdW44aS12M3MtbGljaGVlcGktemVyby5kdHMKPj4gwqAr
KysgYi9hcmNoL2FybS9ib290L2R0cy9zdW44aS12M3MtbGljaGVlcGktemVyby5kdHMKPj4gwqBA
QCAtNzEsMyArNzEsMTMgQEAKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqBwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJva2F5IjsKPj4gwqDC
oH07Cj4+IMKgKwo+PiDCoCsmdXNiX290ZyB7Cj4+IMKgKyBkcl9tb2RlID0gIm90ZyI7Cj4KPiBX
aHkgbm90IHNldCB0aGlzIGRlZmF1bHQgbW9kZSBpbiBkdHNpIGluc3RlYWQ/Cj4KPiBSZWdhcmRz
LAo+IC1CaW4uCgpUaGVyZSdzIHBvc3NpYmx5IGJvYXJkcyB3aGljaCBkbyBub3QgaGF2ZSBPVEcg
ZnVuY3Rpb25zLgoKRXZlbiB0aGUgb2ZmaWNpYWwgQ0RSIGRlc2lnbiBvZiBWM3MgdXNlcyB0aGUg
VVNCIGNvbnRyb2xsZXIgdG8KY29ubmVjdCBhIFVWQyB3ZWJjYW0gdG8gbWFrZSB0aGUgZGVzaWdu
IGEgZHVhbC1jYW0gZGVzaWduCihWM3MgaXRzZWxmIGhhcyBhIENTSSkuCgo+Cj4+IMKgKyBzdGF0
dXMgPSAib2theSI7Cj4+IMKgK307Cj4+IMKgKwo+PiDCoCsmdXNicGh5IHsKPj4gwqArIHVzYjBf
aWRfZGV0LWdwaW8gPSA8JnBpbyA1IDYgR1BJT19BQ1RJVkVfSElHSD47Cj4+IMKgKyBzdGF0dXMg
PSAib2theSI7Cj4+IMKgK307Cj4+IMKgLS0KPj4gwqAyLjExLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBs
aXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
