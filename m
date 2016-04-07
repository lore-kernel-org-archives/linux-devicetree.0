From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH] drm: bridge: analogix/dp: fix no drm hpd event when panel
 plug in
Date: Thu, 7 Apr 2016 12:19:01 +0800
Message-ID: <5705DFB5.4010602@rock-chips.com>
References: <1460002529-30719-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1460002529-30719-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

U29ycnkgZm9yIGRpc3R1cmIsIEkgbWFrZSBhIG1pc3Rha2VuIGFib3V0IHRoZQpyZWNlaXZlIGxp
c3QsIHBsZWFzZSBpZ25vcmUgdGhpcyBlbWFpbC4KCi0gWWFraXIKCk9uIDA0LzA3LzIwMTYgMTI6
MTUgUE0sIFlha2lyIFlhbmcgd3JvdGU6Cj4gVGhlIGVudW0gdmFsdWUgb2YgRFBfSVJRX1RZUEVf
SFBfQ0FCTEVfSU4gaXMgemVybywgYnV0IGRyaXZlciBvbmx5Cj4gc2VuZCBkcm0gaHAgZXZlbnQg
d2hlbiB0aGUgaXJxX3R5cGUgYW5kIHRoZSBlbnVtIHZhbHVlIGlzIHRydWUuCj4KPiBpZiAoaXJx
X3R5cGUgJiBEUF9JUlFfVFlQRV9IUF9DQUJMRV9JTiB8fCAuLi4pCj4gCWRybV9oZWxwZXJfaHBk
X2lycV9ldmVudChkcC0+ZHJtX2Rldik7Cj4KPiBTbyB0aGVyZSB3b3VsZCBubyBkcm0gaHBkIGV2
ZW50IHdoZW4gY2FibGUgcGx1ZyBpbiwgdG8gZml4IHRoYXQKPiBqdXN0IG5lZWQgdG8gYXNzaWdu
IGFsbCBob3RwbHVnIGVudW0gd2l0aCBuby16ZXJvIHZhbHVlcy4KPgo+IFJlcG9ydGVkLWJ5OiBE
YW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
WWFraXIgWWFuZyA8eWtrQHJvY2stY2hpcHMuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmggfCA4ICsrKystLS0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5oIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmgKPiBpbmRl
eCBmMDkyNzVkLi5iNDU2MzgwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
YW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmgKPiBAQCAtMTI3LDEwICsxMjcsMTAgQEAgZW51
bSBhbmFsb2dfcG93ZXJfYmxvY2sgewo+ICAgfTsKPiAgIAo+ICAgZW51bSBkcF9pcnFfdHlwZSB7
Cj4gLQlEUF9JUlFfVFlQRV9IUF9DQUJMRV9JTiwKPiAtCURQX0lSUV9UWVBFX0hQX0NBQkxFX09V
VCwKPiAtCURQX0lSUV9UWVBFX0hQX0NIQU5HRSwKPiAtCURQX0lSUV9UWVBFX1VOS05PV04sCj4g
KwlEUF9JUlFfVFlQRV9IUF9DQUJMRV9JTiAgPSBCSVQoMCksCj4gKwlEUF9JUlFfVFlQRV9IUF9D
QUJMRV9PVVQgPSBCSVQoMSksCj4gKwlEUF9JUlFfVFlQRV9IUF9DSEFOR0UgICAgPSBCSVQoMiks
Cj4gKwlEUF9JUlFfVFlQRV9VTktOT1dOICAgICAgPSBCSVQoMyksCj4gICB9Owo+ICAgCj4gICBz
dHJ1Y3QgdmlkZW9faW5mbyB7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
