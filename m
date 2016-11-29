From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: da850-lcdk: specify the maximum pixel
 clock rate for tilcdc
Date: Tue, 29 Nov 2016 12:57:50 +0100
Message-ID: <CAMpxmJVN08Xw8AYeAxhgGj+XQnk60Wm1O+re_tfftYwwjKcQPQ@mail.gmail.com>
References: <1480335328-4010-1-git-send-email-bgolaszewski@baylibre.com>
 <1480335328-4010-3-git-send-email-bgolaszewski@baylibre.com>
 <4f2a02c4-062f-6faf-1024-2a8718a9701f@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <4f2a02c4-062f-6faf-1024-2a8718a9701f@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sekhar Nori <nsekhar@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-devicetree <devicetree@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>, Jyri Sarha <jsarha@ti.com>, Frank Rowand <frowand.list@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

MjAxNi0xMS0yOSAxMTo1MyBHTVQrMDE6MDAgU2VraGFyIE5vcmkgPG5zZWtoYXJAdGkuY29tPjoK
PiBPbiBNb25kYXkgMjggTm92ZW1iZXIgMjAxNiAwNTo0NSBQTSwgQmFydG9zeiBHb2xhc3pld3Nr
aSB3cm90ZToKPj4gRHVlIHRvIG1lbW9yeSB0aHJvdWdocHV0IGNvbnN0cmFpbnRzIGFueSBkaXNw
bGF5IG1vZGUgZm9yIHdoaWNoIHRoZQo+PiBwaXhlbCBjbG9jayByYXRlIGV4Y2VlZHMgdGhlIHJl
Y29tbWVuZGVkIHZhbHVlIG9mIDM3NTAwIEtIeiBtdXN0IGJlCj4+IGZpbHRlcmVkIG91dC4KPgo+
IEkgdGhpbmsgdGhlcmUgbWlnaHQgYmUgbW9yZSByZWFzb25zIHRoYW4gbWVtb3J5IHRocm91Z2hw
dXQgY29uc3RyYWludHMKPiBmb3IgdGhlIHJlYXNvbmluZyBiZWhpbmQgMzcuNU1oeiBjYXAgb24g
cGl4ZWwgY2xvY2suIFdoeSBub3QganVzdCByZWZlcgo+IHRvIHRoZSBkYXRhc2hlZXQgc2VjdGlv
biB0aGF0IHBsYWNlcyB0aGlzIGNvbnN0cmFpbnQgc28gd2Uga25vdyBpdHMgYQo+IGhhcmR3YXJl
IHJlc3RyaWN0aW9uLgo+Cj4+Cj4+IFNwZWNpZnkgdGhlIG1heC1waXhlbGNsb2NrIHByb3BlcnR5
IGZvciB0aGUgZGlzcGxheSBub2RlIGZvcgo+PiBkYTg1MC1sY2RrLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+PiAt
LS0KPj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2RhODUwLWxjZGsuZHRzIHwgMSArCj4+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2RhODUwLWxjZGsuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAtbGNkay5kdHMKPj4g
aW5kZXggZDg2NGYxMS4uMTI4MzI2MyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMv
ZGE4NTAtbGNkay5kdHMKPj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAtbGNkay5kdHMK
Pj4gQEAgLTI4NSw2ICsyODUsNyBAQAo+Pgo+PiAgJmRpc3BsYXkgewo+PiAgICAgICBzdGF0dXMg
PSAib2theSI7Cj4+ICsgICAgIG1heC1waXhlbGNsb2NrID0gPDM3NTAwPjsKPgo+IFNob3VsZCB0
aGlzIG5vdCBiZSBpbiBkYTg1MC5kdHNpIHNpbmNlIGl0cyBhbiBTb0MgaW1wb3NlZCBjb25zdHJh
aW50PyBJZgo+IGEgYm9hcmQgbmVlZHMgbmFycm93ZXIgY29uc3RyYWludCwgaXQgY2FuIG92ZXJy
aWRlIGl0LiBCdXQgSSBndWVzcyBtb3N0Cj4gd2VsbCBkZXNpZ25lZCBib2FyZHMgd2lsbCBqdXN0
IGhpdCB0aGUgU29DIGNvbnN0cmFpbnQuCj4KCkJvdGggaXNzdWVzIGZpeGVkIGluIHYzLgoKVGhh
bmtzLApCYXJ0b3N6IEdvbGFzemV3c2tpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
