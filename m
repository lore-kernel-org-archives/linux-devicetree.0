From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: Add LVDS decoder to R-Car V3M
 Eagle
Date: Fri, 9 Mar 2018 20:30:36 +0300
Message-ID: <e0ff40be-f134-5a86-6d00-9506d9829364@cogentembedded.com>
References: <1520603500-15218-1-git-send-email-jacopo+renesas@jmondi.org>
 <1520603500-15218-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1520603500-15218-4-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-MW
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, airlied@linux.ie, horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org, niklas.soderlund@ragnatech.se, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

T24gMDMvMDkvMjAxOCAwNDo1MSBQTSwgSmFjb3BvIE1vbmRpIHdyb3RlOgoKPiBUaGUgUi1DYXIg
VjNNIEVhZ2xlIGJvYXJkIGluY2x1ZGVzIGEgdHJhbnNwYXJlbnQgTFZEUyBkZWNvZGVyLCBjb25u
ZWN0ZWQKPiB0byB0aGUgb24tY2hpcCBMVkRTIGVuY29kZXIgb3V0cHV0IG9uIG9uZSBzaWRlIGFu
ZCB0byBIRE1JIGVuY29kZXIKPiBBRFY3NTExdyBvbiB0aGUgb3RoZXIgb25lLgo+IAo+IEFzIHRo
ZSBkZWNvZGVyIGRvZXMgbm90IG5lZWQgYW55IGNvbmZpZ3VyYXRpb24gaXQgaGFzIGJlZW4gc28t
ZmFyCj4gb21pdHRlZCBmcm9tIERUUy4gTm93IHRoYXQgYSBkcml2ZXIgZm9yIHRyYW5zcGFyZW50
IExWRFMgZGVjb2RlciBpcwo+IGF2YWlsYWJsZSwgZGVzY3JpYmUgaXQgaW4gRFQgYXMgd2VsbC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5v
cmc+Cj4gLS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk3MC1lYWdsZS5k
dHMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjkg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTcwLWVhZ2xlLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9yOGE3Nzk3MC1lYWdsZS5kdHMKPiBpbmRleCBjMGZkMTQ0Li4wYTk1YzIwIDEw
MDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk3MC1lYWdsZS5k
dHMKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NzAtZWFnbGUuZHRz
Cj4gQEAgLTQyLDYgKzQyLDMzIEBACj4gIAkJCX07Cj4gIAkJfTsKPiAgCX07Cj4gKwo+ICsJbHZk
cyxkZWNvZGVyIHsKCiAgIEkgc2FpZCBoeXBoZW4gKC0pLCBub3QgY29tbWEgKCwpISA6LSkKClsu
Li5dCgpNQlIsIFNlcmdlaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
