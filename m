From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 1/6] drm: panfrost: add optional bus_clock
Date: Fri, 17 May 2019 17:16:49 -0500
Message-ID: <CAL_JsqJgo8NpK00ApBcdtYGW24yuqU=4EMna+r_07=dqceZyyg@mail.gmail.com>
References: <20190517184659.18828-1-peron.clem@gmail.com>
 <20190517184659.18828-2-peron.clem@gmail.com>
 <CAL_JsqKPazGn+g1zS4NMwvQZ_6GcAm0tgcOTqyQA0dz0+2dp3g@mail.gmail.com>
 <CAJiuCcdMxXAXYk=QpRwsvBUW0tvBVMqXvgx0Y7fAKP=ouyBnKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAJiuCcdMxXAXYk=QpRwsvBUW0tvBVMqXvgx0Y7fAKP=ouyBnKQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Steven Price <steven.price@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Linux IOMMU <iommu@lists.linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgNTowOCBQTSBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNs
ZW1AZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIFJvYiwKPgo+IE9uIEZyaSwgMTcgTWF5IDIwMTkg
YXQgMjI6MDcsIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+
IE9uIEZyaSwgTWF5IDE3LCAyMDE5IGF0IDE6NDcgUE0gQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5j
bGVtQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEFsbHdpbm5lciBINiBoYXMgYW4gQVJN
IE1hbGktVDcyMCBNUDIgd2hpY2ggcmVxdWlyZWQgYSBidXNfY2xvY2suCj4gPiA+Cj4gPiA+IEFk
ZCBhbiBvcHRpb25hbCBidXNfY2xvY2sgYXQgdGhlIGluaXQgb2YgdGhlIHBhbmZyb3N0IGRyaXZl
ci4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVt
QGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZGV2aWNlLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKystCj4gPiA+ICBkcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmggfCAgMSArCj4gPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwo+ID4gPiBpbmRleCAzYjJi
Y2VkMWIwMTUuLjhkYTZlNjEyZDM4NCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwo+ID4gPiBAQCAtNDQsNyArNDQsOCBAQCBzdGF0aWMg
aW50IHBhbmZyb3N0X2Nsa19pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQo+ID4g
Pgo+ID4gPiAgICAgICAgIHBmZGV2LT5jbG9jayA9IGRldm1fY2xrX2dldChwZmRldi0+ZGV2LCBO
VUxMKTsKPiA+ID4gICAgICAgICBpZiAoSVNfRVJSKHBmZGV2LT5jbG9jaykpIHsKPiA+ID4gLSAg
ICAgICAgICAgICAgIGRldl9lcnIocGZkZXYtPmRldiwgImdldCBjbG9jayBmYWlsZWQgJWxkXG4i
LCBQVFJfRVJSKHBmZGV2LT5jbG9jaykpOwo+ID4gPiArICAgICAgICAgICAgICAgZGV2X2Vycihw
ZmRldi0+ZGV2LCAiZ2V0IGNsb2NrIGZhaWxlZCAlbGRcbiIsCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIFBUUl9FUlIocGZkZXYtPmNsb2NrKSk7Cj4gPgo+ID4gUGxlYXNlIGRyb3AgdGhp
cyB3aGl0ZXNwYWNlIGNoYW5nZS4KPgo+IFNvcnJ5LCBJIHRob3VnaHQgaXQgd2FzIG9ubHkgYSBt
aXN0YWtlIGhlcmUsIEkgd2lsbCBkcm9wIGl0Lgo+IFdoeSBhcmUgdGhleSBzbyBtYW55IGxpbmVz
IG92ZXIgODAgY2hhcmFjdGVycz8KCkknZCBndWVzcyBtb3N0IGFyZSBwcmludHMgYW5kL29yIGp1
c3Qgc2xpZ2h0bHkgb3Zlci4KCj4gSXMgdGhlcmUgYSBzcGVjaWZpYyBjb2Rpbmcgc3R5bGUgdG8g
Zm9sbG93ID8KClllcywgYnV0IGdlbmVyYWxseSB0aGUgODAgY2hhcmFjdGVyIHRoaW5nIGlzIG1v
cmUgYSBndWlkYW5jZS4gTm90CmhhdmluZyB1bnJlbGF0ZWQgY2hhbmdlcyBpbiBhIHNpbmdsZSBj
b21taXQgaXMgbW9yZSBvZiBhIGhhcmQgcnVsZS4KClJvYgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
