From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 4/5] ARM: dts: da850-lcdk: enable mstpri and ddrctl
 nodes
Date: Mon, 31 Oct 2016 22:22:54 +0200
Message-ID: <12222113.L5elJM2tqN@avalon>
References: <1477925138-23457-1-git-send-email-bgolaszewski@baylibre.com>
 <1477925138-23457-5-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1477925138-23457-5-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-devicetree <devicetree@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Russell King <linux@armlinux.org.uk>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>, Jyri Sarha <jsarha@ti.com>, Frank Rowand <frowand.list@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgQmFydG9zeiwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gTW9uZGF5IDMxIE9jdCAy
MDE2IDE1OjQ1OjM3IEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gRW5hYmxlIHRoZSBNU1RQ
UkkgY29uZmlndXJhdGlvbiBhbmQgRERSMi9tRERSIG1lbW9yeSBjb250cm9sbGVyCj4gbm9kZXMg
b24gZGE4NTAtbGNkay4gVGhpcyBpcyBuZWVkZWQgaW4gb3JkZXIgdG8gYWRqdXN0IHRoZSBtZW1v
cnkKPiB0aHJvdWdocHV0IGNvbnN0cmFpbnRzIGZvciBiZXR0ZXIgdGlsY2RjIHN1cHBvcnQuCgpJ
cyB0aGVyZSBhIHJlYXNvbiBub3QgdG8gZW5hYmxlIHRoZXNlIHVuY29uZGl0aW9uYWxseSBpbiBk
YTg1MC5kdHNpIChvciByYXRoZXIgCm5vdCBkaXNhYmxpbmcgdGhlbSkgaW5zdGVhZCBvZiBoYW5k
bGluZyBpdCBwZXIgYm9hcmQgPwoKPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBhcmNoL2FybS9ib290L2R0cy9k
YTg1MC1sY2RrLmR0cyB8IDggKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9kYTg1MC1sY2RrLmR0cwo+
IGIvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAtbGNkay5kdHMgaW5kZXggNDc0NzYyOS4uYjM5Nzk2
ZSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9kYTg1MC1sY2RrLmR0cwo+ICsrKyBi
L2FyY2gvYXJtL2Jvb3QvZHRzL2RhODUwLWxjZGsuZHRzCj4gQEAgLTI0MywzICsyNDMsMTEgQEAK
PiAgCQl9Owo+ICAJfTsKPiAgfTsKPiArCj4gKyZtc3Rwcmkgewo+ICsJc3RhdHVzID0gIm9rYXki
Owo+ICt9Owo+ICsKPiArJmRkcmN0bCB7Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4gK307CgotLSAK
UmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
