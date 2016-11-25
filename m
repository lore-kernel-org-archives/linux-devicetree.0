From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/3] ARM: dts: da850: tilcdc related DT changes
Date: Fri, 25 Nov 2016 17:03:12 +0100
Message-ID: <1480089795-29811-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

SSBwcmV2aW91c2x5IHNlbnQgdGhlc2UgcGF0Y2hlcyBzZXBhcmF0ZWx5LCBidXQgc2luY2UgdGhl
eSdyZSB0b3VjaGluZwp0aGUgc2FtZSBmaWxlcyB3aGlsZSBjb21pbmcgZnJvbSBkaWZmZXJlbnQg
dHJlZXMsIEkgZGVjaWRlZCB0byBwb3N0Cml0IGFnYWluIGluIGEgc2VyaWVzIHRvIG1ha2UgYXBw
bHlpbmcgdGhlbSBlYXNpZXIuCgpCYXJ0b3N6IEdvbGFzemV3c2tpICgzKToKICBBUk06IGRhODUw
LWxjZGs6IGFkZCB0aGUgZHVtYi12Z2EtZGFjIG5vZGUKICBBUk06IGR0czogZGE4NTA6IHNwZWNp
ZnkgdGhlIG1heGltdW0gYmFuZHdpZHRoIGZvciB0aWxjZGMKICBBUk06IGR0czogZGE4NTA6IGVu
YWJsZSB0aGUgbWVtY3RybCBhbmQgbXN0cHJpIG5vZGVzIHBlciBib2FyZAoKIGFyY2gvYXJtL2Jv
b3QvZHRzL2RhODUwLWxjZGsuZHRzIHwgNjYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAuZHRzaSAgICAgfCAyMCArKysrKysr
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKQoKLS0gCjIuOS4zCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
