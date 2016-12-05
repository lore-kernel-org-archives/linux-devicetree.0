From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 1/2] ARM: dts: da850-lcdk: add the dumb-vga-dac node
Date: Mon, 5 Dec 2016 08:32:12 -0600
Message-ID: <CAL_Jsq+OKbSvu0bG8KNtw4tsLH46B2Vnb9ZampPafCum4xSZWA@mail.gmail.com>
References: <1480420624-23544-1-git-send-email-bgolaszewski@baylibre.com>
 <1480420624-23544-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1480420624-23544-2-git-send-email-bgolaszewski@baylibre.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-devicetree <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Russell King <linux@armlinux.org.uk>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>, Frank Rowand <frowand.list@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBOb3YgMjksIDIwMTYgYXQgNTo1NyBBTSwgQmFydG9zeiBHb2xhc3pld3NraQo8Ymdv
bGFzemV3c2tpQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gQWRkIHRoZSBkdW1iLXZnYS1kYWMgbm9k
ZSB0byB0aGUgYm9hcmQgRFQgdG9nZXRoZXIgd2l0aCBjb3JyZXNwb25kaW5nCj4gcG9ydHMgYW5k
IHZnYSBjb25uZWN0b3IuIFRoaXMgYWxsb3dzIHRvIHJldHJpZXZlIHRoZSBlZGlkIGluZm8gZnJv
bQo+IHRoZSBkaXNwbGF5IGF1dG9tYXRpY2FsbHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6
IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBhcmNoL2Fy
bS9ib290L2R0cy9kYTg1MC1sY2RrLmR0cyB8IDU4ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAuZHRzaSAgICAgfCAxNyAr
KysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAtbGNkay5kdHMgYi9hcmNoL2FybS9ib290
L2R0cy9kYTg1MC1sY2RrLmR0cwo+IGluZGV4IDcxMWI5YWQuLmQ4NjRmMTEgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAtbGNkay5kdHMKPiArKysgYi9hcmNoL2FybS9ib290
L2R0cy9kYTg1MC1sY2RrLmR0cwo+IEBAIC01MCw2ICs1MCw1MyBAQAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIHN5c3RlbS1jbG9jay1mcmVxdWVuY3kgPSA8MjQ1NzYwMDA+Owo+ICAgICAgICAg
ICAgICAgICB9Owo+ICAgICAgICAgfTsKPiArCj4gKyAgICAgICB2Z2FfYnJpZGdlIHsKCnMvXy8t
LwoKPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJkdW1iLXZnYS1kYWMiOwo+ICsgICAg
ICAgICAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICsgICAgICAgICAgICAgICBw
aW5jdHJsLTAgPSA8JmxjZF9waW5zPjsKCkFyZSB0aGVzZSBwaW5zIGZyb20gdGhlIExDRCBjb250
cm9sbGVyPyBUaGV5IHNob3VsZCBiZSBwYXJ0IG9mIHRoZSBMQ0QKY29udHJvbGxlciBub2RlLgoK
Um9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
