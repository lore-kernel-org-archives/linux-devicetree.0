From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/7] arm64: dts: renesas: r8a77970: add FCPVD support
Date: Fri, 06 Apr 2018 16:28:17 +0300
Message-ID: <22085242.zeaVs0iFPW@avalon>
References: <1523020092-25540-1-git-send-email-jacopo+renesas@jmondi.org>
 <1523020092-25540-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1523020092-25540-2-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: devicetree@vger.kernel.org, Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, sergei.shtylyov@cogentembedded.com, magnus.damm@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, geert@linux-m68k.org, niklas.soderlund@ragnatech.se
List-Id: devicetree@vger.kernel.org

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBGcmlkYXksIDYgQXByaWwg
MjAxOCAxNjowODowNiBFRVNUIEphY29wbyBNb25kaSB3cm90ZToKPiBGcm9tOiBTZXJnZWkgU2h0
eWx5b3YgPHNlcmdlaS5zaHR5bHlvdkBjb2dlbnRlbWJlZGRlZC5jb20+Cj4gCj4gRGVzY3JpYmUg
RkNQVkQwIGluIHRoZSBSOEE3Nzk3MCBkZXZpY2UgdHJlZTsgaXQgd2lsbCBiZSB1c2VkIGJ5IFZT
UEQwIGluCj4gdGhlIG5leHQgcGF0Y2guLi4KPiAKPiBCYXNlZCBvbiB0aGUgb3JpZ2luYWwgKGFu
ZCBsYXJnZSkgcGF0Y2ggYnkgRGFpc3VrZSBNYXRzdXNoaXRhCj4gPGRhaXN1a2UubWF0c3VzaGl0
YS5uc0BoaXRhY2hpLmNvbT4uCj4gCj4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgQmFyaW5vdiA8
dmxhZGltaXIuYmFyaW5vdkBjb2dlbnRlbWJlZGRlZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU2Vy
Z2VpIFNodHlseW92IDxzZXJnZWkuc2h0eWx5b3ZAY29nZW50ZW1iZWRkZWQuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IE5pa2xhcyBTw7ZkZXJsdW5kIDxuaWtsYXMuc29kZXJsdW5kK3JlbmVzYXNAcmFn
bmF0ZWNoLnNlPgoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KCj4gLS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9yOGE3Nzk3MC5kdHNpIHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3
Nzk3MC5kdHNpCj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NzAuZHRzaSBp
bmRleCBlODM1OGQ5Li43MWY0NjZkIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9yOGE3Nzk3MC5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3I4YTc3OTcwLmR0c2kKPiBAQCAtNjE3LDYgKzYxNywxNCBAQAo+ICAJCQkjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKPiAgCQkJI3NpemUtY2VsbHMgPSA8MD47Cj4gIAkJfTsKPiArCj4gKwkJZmNwdmQw
OiBmY3BAZmVhMjcwMDAgewo+ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMsZmNwdiI7Cj4gKwkJ
CXJlZyA9IDwwIDB4ZmVhMjcwMDAgMCAweDIwMD47Cj4gKwkJCWNsb2NrcyA9IDwmY3BnIENQR19N
T0QgNjAzPjsKPiArCQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk3MF9QRF9BTFdBWVNf
T04+Owo+ICsJCQlyZXNldHMgPSA8JmNwZyA2MDM+Owo+ICsJCX07Cj4gIAl9Owo+IAo+ICAJdGlt
ZXIgewoKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
