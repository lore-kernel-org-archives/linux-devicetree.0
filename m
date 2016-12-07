From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 0/4] ARM: dts: da850: tilcdc related DT changes
Date: Wed,  7 Dec 2016 11:42:41 +0100
Message-ID: <1481107365-24839-1-git-send-email-bgolaszewski@baylibre.com>
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
To: Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-devicetree <devicetree@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
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
TENEQyBub2RlIChmcm9tIHRoZSB2Z2EgYnJpZGdlIG5vZGUpCgp2NCAtPiB2NToKLSByZW5hbWUg
dGhlIGRpc3BsYXkgbGFiZWwgdG8gbGNkYwotIGluc3RlYWQgb2YgdXNpbmcgdGhlICdkdW1iLXZn
YS1kYWMnIGNvbXBhdGlibGUsIGFkZCBiaW5kaW5ncyBmb3IKICB0aSx0aHM4MTM1IGFuZCB1c2Ug
aXQgYXMgdGhlIHZnYS1icmlkZ2Ugbm9kZSBjb21wYXRpYmxlCgpCYXJ0b3N6IEdvbGFzemV3c2tp
ICg0KToKICBBUk06IGR0czogZGE4NTA6IHJlbmFtZSB0aGUgZGlzcGxheSBub2RlIGxhYmVsCiAg
ZHJtOiBicmlkZ2U6IGFkZCBzdXBwb3J0IGZvciBUSSB0aHM4MTM1CiAgQVJNOiBkdHM6IGRhODUw
LWxjZGs6IGFkZCB0aGUgdmdhLWJyaWRnZSBub2RlCiAgQVJNOiBkdHM6IGRhODUwOiBzcGVjaWZ5
IHRoZSBtYXhpbXVtIHBpeGVsIGNsb2NrIHJhdGUgZm9yIHRpbGNkYwoKIC4uLi9iaW5kaW5ncy9k
aXNwbGF5L2JyaWRnZS90aSx0aHM4MTM1LnR4dCAgICAgICAgIHwgNTIgKysrKysrKysrKysrKysr
KysKIGFyY2gvYXJtL2Jvb3QvZHRzL2RhODUwLWxjZGsuZHRzICAgICAgICAgICAgICAgICAgIHwg
NjcgKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAuZHRzaSAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1i
LXZnYS1kYWMuYyAgICAgICAgICAgICAgfCAgMSArCiA0IGZpbGVzIGNoYW5nZWQsIDEyMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLHRoczgxMzUudHh0CgotLSAK
Mi45LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
