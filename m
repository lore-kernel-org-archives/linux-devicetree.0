From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v5 6/6] media: rcar-vin: Handle data-enable polarity
Date: Mon,  9 Jul 2018 16:19:21 +0200
Message-ID: <1531145962-1540-7-git-send-email-jacopo+renesas@jmondi.org>
References: <1531145962-1540-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531145962-1540-1-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com, horms@verge.net.au, geert@glider.be
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

SGFuZGxlIGRhdGEtZW5hYmxlIHNpZ25hbCBwb2xhcml0eS4gSWYgdGhlIHBvbGFyaXR5IGlzIG5v
dCBzcGVjaWZpY2FsbHkKcmVxdWVzdGVkIHRvIGJlIGFjdGl2ZSBsb3csIHVzZSB0aGUgYWN0aXZl
IGhpZ2ggZGVmYXVsdC4KClNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVz
YXNAam1vbmRpLm9yZz4KQWNrZWQtYnk6IE5pa2xhcyBTw7ZkZXJsdW5kIDxuaWtsYXMuc29kZXJs
dW5kK3JlbmVzYXNAcmFnbmF0ZWNoLnNlPgotLS0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmNh
ci12aW4vcmNhci1kbWEuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JjYXItdmluL3JjYXItZG1h
LmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JjYXItdmluL3JjYXItZG1hLmMKaW5kZXggMWRl
NTk4MS4uOTE0NmY2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yY2FyLXZp
bi9yY2FyLWRtYS5jCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmNhci12aW4vcmNhci1k
bWEuYwpAQCAtMTIzLDYgKzEyMyw3IEBACiAvKiBWaWRlbyBuIERhdGEgTW9kZSBSZWdpc3RlciAy
IGJpdHMgKi8KICNkZWZpbmUgVk5ETVIyX1ZQUwkJKDEgPDwgMzApCiAjZGVmaW5lIFZORE1SMl9I
UFMJCSgxIDw8IDI5KQorI2RlZmluZSBWTkRNUjJfQ0VTCQkoMSA8PCAyOCkKICNkZWZpbmUgVk5E
TVIyX0ZURVYJCSgxIDw8IDE3KQogI2RlZmluZSBWTkRNUjJfVkxWKG4pCQkoKG4gJiAweGYpIDw8
IDEyKQogCkBAIC02OTgsNiArNjk5LDEwIEBAIHN0YXRpYyBpbnQgcnZpbl9zZXR1cChzdHJ1Y3Qg
cnZpbl9kZXYgKnZpbikKIAkJLyogVnN5bmMgU2lnbmFsIFBvbGFyaXR5IFNlbGVjdCAqLwogCQlp
ZiAoISh2aW4tPnBhcmFsbGVsLT5tYnVzX2ZsYWdzICYgVjRMMl9NQlVTX1ZTWU5DX0FDVElWRV9M
T1cpKQogCQkJZG1yMiB8PSBWTkRNUjJfVlBTOworCisJCS8qIERhdGEgRW5hYmxlIFBvbGFyaXR5
IFNlbGVjdCAqLworCQlpZiAodmluLT5wYXJhbGxlbC0+bWJ1c19mbGFncyAmIFY0TDJfTUJVU19E
QVRBX0VOQUJMRV9MT1cpCisJCQlkbXIyIHw9IFZORE1SMl9DRVM7CiAJfQogCiAJLyoKLS0gCjIu
Ny40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXJtLWtlcm5lbAo=
