From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 0/2] ARM: dts: da850: tilcdc related DT changes
Date: Tue,  6 Dec 2016 14:13:44 +0100
Message-ID: <1481030026-7329-1-git-send-email-bgolaszewski@baylibre.com>
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

VGhpcyBzZXJpZXMgY29udGFpbnMgdGhlIGxhc3QgRFQgY2hhbmdlcyByZXF1aXJlZCBmb3IgTENE
QyBzdXBwb3J0Cm9uIGRhODUwLWxjZGsuIFRoZSBmaXJzdCBvbmUgYWRkcyB0aGUgZHVtYi12Z2Et
ZGFjIG5vZGVzLCB0aGUgc2Vjb25kCmxpbWl0cyB0aGUgbWF4aW11bSBwaXhlbCBjbG9jayByYXRl
LgoKdjEgLT4gdjI6Ci0gZHJvcCBwYXRjaCAzLzMgKGFscmVhZHkgbWVyZ2VkKQotIHVzZSBtYXgt
cGl4ZWxjbG9jayBpbnN0ZWFkIG9mIG1heC1iYW5kd2lkdGggZm9yIGRpc3BsYXkgbW9kZSBsaW1p
dGluZwoKdjIgLT4gdjM6Ci0gbWFrZSB0aGUgY29tbWl0IG1lc3NhZ2UgaW4gcGF0Y2ggWzIvMl0g
bW9yZSBkZXRhaWxlZAotIG1vdmUgdGhlIG1heC1waXhlbGNsb2NrIHByb3BlcnR5IHRvIGRhODUw
LmR0c2kgYXMgdGhlIGxpbWl0CiAgYWZmZWN0cyBhbGwgZGE4NTAtYmFzZWQgYm9hcmRzCgp2MyAt
PiB2NDoKLSByZW1vdmUgdGhlIGlucHV0IHBvcnQgZnJvbSB0aGUgZGlzcGxheSBub2RlCi0gbW92
ZSB0aGUgZGlzcGxheSBwb3J0cyBub2RlIHRvIGRhODUwLWxjZGsuZHRzCi0gcmVuYW1lIHRoZSB2
Z2FfYnJpZGdlIG5vZGUgdG8gdmdhLWJyaWRnZQotIG1vdmUgdGhlIExDREMgcGlucyB0byB0aGUg
TENEQyBub2RlIChmcm9tIHRoZSB2Z2EgYnJpZGdlIG5vZGUpCgpCYXJ0b3N6IEdvbGFzemV3c2tp
ICgyKToKICBBUk06IGR0czogZGE4NTAtbGNkazogYWRkIHRoZSBkdW1iLXZnYS1kYWMgbm9kZQog
IEFSTTogZHRzOiBkYTg1MDogc3BlY2lmeSB0aGUgbWF4aW11bSBwaXhlbCBjbG9jayByYXRlIGZv
ciB0aWxjZGMKCiBhcmNoL2FybS9ib290L2R0cy9kYTg1MC1sY2RrLmR0cyB8IDY5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL2RhODUw
LmR0c2kgICAgIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspCgotLSAK
Mi45LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
