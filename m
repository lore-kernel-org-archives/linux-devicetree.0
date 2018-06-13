From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH 26/28] drm/mediatek: add DPI1/DSI1/DSI2/DSI3 in comp_init
Date: Wed, 13 Jun 2018 15:35:05 +0800
Message-ID: <1528875305.30263.14.camel@mtksdaap41>
References: <1528687580-549-1-git-send-email-stu.hsieh@mediatek.com>
 <1528687580-549-27-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1528687580-549-27-git-send-email-stu.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stu Hsieh <stu.hsieh@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksIFN0dToKCk9uIE1vbiwgMjAxOC0wNi0xMSBhdCAxMToyNiArMDgwMCwgU3R1IEhzaWVoIHdy
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkIGNvbXBvbmVudHMgRFBJMS9EU0kxL0RTSTIvRFNJMyBpbiBj
b21wX2luaXQuCj4gQmVjYXVzZSB0aGUgc29tZSBwYXJhbWV0ZXIgZm9yIHRoZXNlIGNvbXBvbmVu
dHMgaW5pdGlhbGl6ZWQKPiBpbiB0aGVpciBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3R1
IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZGRwX2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cF9jb21wLmMKPiBpbmRleCAyMmY0YzcyZmE3ODUuLmZmOTc0ZDgyYTRhNiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IEBAIC0yNzgsNyArMjc4
LDExIEBAIGludCBtdGtfZGRwX2NvbXBfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSwKPiAgCj4gIAlpZiAoY29tcF9pZCA9PSBERFBfQ09NUE9ORU5UX0JM
UyB8fAo+ICAJICAgIGNvbXBfaWQgPT0gRERQX0NPTVBPTkVOVF9EUEkwIHx8Cj4gKwkgICAgY29t
cF9pZCA9PSBERFBfQ09NUE9ORU5UX0RQSTEgfHwKCldoeSBub3QgbW92ZSB0aGlzIG1vZGlmaWNh
dGlvbiB0byB0aGUgcGF0Y2ggJ2FkZCBjb21wb25lbnQgRFBJMSc/Cgo+ICAJICAgIGNvbXBfaWQg
PT0gRERQX0NPTVBPTkVOVF9EU0kwIHx8Cj4gKwkgICAgY29tcF9pZCA9PSBERFBfQ09NUE9ORU5U
X0RTSTEgfHwKPiArCSAgICBjb21wX2lkID09IEREUF9DT01QT05FTlRfRFNJMiB8fAoKV2h5IG5v
dCBtb3ZlIHRoaXMgbW9kaWZpY2F0aW9uIHRvIHRoZSBwYXRjaCAnYWRkIGNvbXBvbmVudCBEU0ky
Jz8KCj4gKwkgICAgY29tcF9pZCA9PSBERFBfQ09NUE9ORU5UX0RTSTMgfHwKCldoeSBub3QgbW92
ZSB0aGlzIG1vZGlmaWNhdGlvbiB0byB0aGUgcGF0Y2ggJ2FkZCBjb21wb25lbnQgRFNJMyc/CgpS
ZWdhcmRzLApDSwoKPiAgCSAgICBjb21wX2lkID09IEREUF9DT01QT05FTlRfUFdNMCkgewo+ICAJ
CWNvbXAtPnJlZ3MgPSBOVUxMOwo+ICAJCWNvbXAtPmNsayA9IE5VTEw7CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
