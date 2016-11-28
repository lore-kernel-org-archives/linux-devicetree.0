From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 0/2] ARM: dts: da850: tilcdc related DT changes
Date: Mon, 28 Nov 2016 13:15:26 +0100
Message-ID: <1480335328-4010-1-git-send-email-bgolaszewski@baylibre.com>
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
dGluZwoKQmFydG9zeiBHb2xhc3pld3NraSAoMik6CiAgQVJNOiBkdHM6IGRhODUwLWxjZGs6IGFk
ZCB0aGUgZHVtYi12Z2EtZGFjIG5vZGUKICBBUk06IGR0czogZGE4NTAtbGNkazogc3BlY2lmeSB0
aGUgbWF4aW11bSBwaXhlbCBjbG9jayByYXRlIGZvciB0aWxjZGMKCiBhcmNoL2FybS9ib290L2R0
cy9kYTg1MC1sY2RrLmR0cyB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL2RhODUwLmR0c2kgICAgIHwgMTcgKysrKysrKysrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDc2IGluc2VydGlvbnMoKykKCi0tIAoyLjkuMwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
