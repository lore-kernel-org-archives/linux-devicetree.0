From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/2] ARM: davinci: da8xx-dt: add OF_DEV_AUXDATA entry for lcdc
Date: Wed,  5 Oct 2016 15:05:31 +0200
Message-ID: <1475672732-17111-2-git-send-email-bgolaszewski@baylibre.com>
References: <1475672732-17111-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1475672732-17111-1-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>, Karl Beldan <karl.beldan@gmail.com>
Cc: linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Karl Beldan <kbeldan@baylibre.com>, Jyri Sarha <jsarha@ti.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

RnJvbTogS2FybCBCZWxkYW4gPGtiZWxkYW5AYmF5bGlicmUuY29tPgoKVGhpcyBpcyByZXF1aXJl
ZCBmb3IgdGlsY2RjIHRvIGJlIGFibGUgdG8gYWNxdWlyZSBhIGZ1bmN0aW9uYWwgY2xvY2sKb24g
ZGE4NTAgU29Dcy4KClNpZ25lZC1vZmYtYnk6IEthcmwgQmVsZGFuIDxrYmVsZGFuQGJheWxpYnJl
LmNvbT4KW0JhcnRvc3o6CiAgLSBhZGRlZCB0aGUgY29tbWl0IGRlc2NyaXB0aW9uCiAgLSBjaGFu
Z2VkIHRoZSBjb21wYXRpYmxlIHN0cmluZyB0byAndGksZGE4NTAtdGlsY2RjJ10KU2lnbmVkLW9m
Zi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KLS0t
CiBhcmNoL2FybS9tYWNoLWRhdmluY2kvZGE4eHgtZHQuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1kYXZpbmNpL2RhOHh4
LWR0LmMgYi9hcmNoL2FybS9tYWNoLWRhdmluY2kvZGE4eHgtZHQuYwppbmRleCBjOWY3ZTkyLi42
OTdkYTNkIDEwMDY0NAotLS0gYS9hcmNoL2FybS9tYWNoLWRhdmluY2kvZGE4eHgtZHQuYworKysg
Yi9hcmNoL2FybS9tYWNoLWRhdmluY2kvZGE4eHgtZHQuYwpAQCAtMzgsNiArMzgsNyBAQCBzdGF0
aWMgc3RydWN0IG9mX2Rldl9hdXhkYXRhIGRhODUwX2F1eGRhdGFfbG9va3VwW10gX19pbml0ZGF0
YSA9IHsKIAkJICAgICAgIE5VTEwpLAogCU9GX0RFVl9BVVhEQVRBKCJ0aSxkYTgzMC1tY2FzcC1h
dWRpbyIsIDB4MDFkMDAwMDAsICJkYXZpbmNpLW1jYXNwLjAiLCBOVUxMKSwKIAlPRl9ERVZfQVVY
REFUQSgidGksZGE4NTAtYWVtaWYiLCAweDY4MDAwMDAwLCAidGktYWVtaWYiLCBOVUxMKSwKKwlP
Rl9ERVZfQVVYREFUQSgidGksZGE4NTAtdGlsY2RjIiwgMHgwMWUxMzAwMCwgImRhOHh4X2xjZGMu
MCIsIE5VTEwpLAogCXt9CiB9OwogCi0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
