From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v7 2/5] drm: bridge: add DT bindings for TI ths8135
Date: Tue, 13 Dec 2016 11:09:16 +0100
Message-ID: <1481623759-12786-3-git-send-email-bgolaszewski@baylibre.com>
References: <1481623759-12786-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1481623759-12786-1-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-devicetree <devicetree@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

VEhTODEzNSBpcyBhIGNvbmZpZ3VyYWJsZSB2aWRlbyBEQUMuIEFkZCBEVCBiaW5kaW5ncyBmb3Ig
dGhpcyBjaGlwLgoKU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3
c2tpQGJheWxpYnJlLmNvbT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLHRoczgxMzUudHh0
ICAgICAgICAgfCA0NiArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDYg
aW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSx0aHM4MTM1LnR4dAoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSx0aHM4MTM1
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90
aSx0aHM4MTM1LnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi42ZWMxYTg4
Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL3RpLHRoczgxMzUudHh0CkBAIC0wLDAgKzEsNDYgQEAKK1RIUzgxMzUgVmlk
ZW8gREFDCistLS0tLS0tLS0tLS0tLS0tLQorCitUaGlzIGlzIHRoZSBiaW5kaW5nIGZvciBUZXhh
cyBJbnN0cnVtZW50cyBUSFM4MTM1IFZpZGVvIERBQyBicmlkZ2UuCisKK1JlcXVpcmVkIHByb3Bl
cnRpZXM6CisKKy0gY29tcGF0aWJsZTogTXVzdCBiZSAidGksdGhzODEzNSIKKworUmVxdWlyZWQg
bm9kZXM6CisKK1RoaXMgZGV2aWNlIGhhcyB0d28gdmlkZW8gcG9ydHMuIFRoZWlyIGNvbm5lY3Rp
b25zIGFyZSBtb2RlbGxlZCB1c2luZyB0aGUgT0YKK2dyYXBoIGJpbmRpbmdzIHNwZWNpZmllZCBp
biBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3JhcGgudHh0LgorCistIFZpZGVv
IHBvcnQgMCBmb3IgUkdCIGlucHV0CistIFZpZGVvIHBvcnQgMSBmb3IgVkdBIG91dHB1dAorCitF
eGFtcGxlCistLS0tLS0tCisKK3ZnYS1icmlkZ2UgeworCWNvbXBhdGlibGUgPSAidGksdGhzODEz
NSI7CisJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJI3NpemUtY2VsbHMgPSA8MD47CisKKwlwb3J0
cyB7CisJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkjc2l6ZS1jZWxscyA9IDwwPjsKKworCQlw
b3J0QDAgeworCQkJcmVnID0gPDA+OworCisJCQl2Z2FfYnJpZGdlX2luOiBlbmRwb2ludCB7CisJ
CQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsY2RjX291dF92Z2E+OworCQkJfTsKKwkJfTsKKworCQlw
b3J0QDEgeworCQkJcmVnID0gPDE+OworCisJCQl2Z2FfYnJpZGdlX291dDogZW5kcG9pbnQgewor
CQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdmdhX2Nvbl9pbj47CisJCQl9OworCQl9OworCX07Cit9
OwotLSAKMi45LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
