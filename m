From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 3/3] ARM: dts: imx6ull: address some more incompatibilites
 between i.MX6UL and i.MX6ULL
Date: Fri, 26 Jan 2018 09:23:52 +0100
Message-ID: <1516955032-21167-4-git-send-email-LW@KARO-electronics.de>
References: <1516955032-21167-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1516955032-21167-1-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

VGhlIGkuTVg2VUxMIGRvZXNuJ3QgaGF2ZSB0aGUgQ0FBTSBlbmdpbmUgbm9yIGFueSBTSU0gaW50
ZXJmYWNlLgpUaGVzZSBhcmUgY3VycmVudGx5IG5vdCBpbXBsZW1lbnRlZCBmb3IgaS5NWDZVTCBi
dXQgaXQgY2Fubm90IGh1cnQgdG8KZGVsZXRlIHRoZSBjb3JyZXNwb25kaW5nIG5vZGVzIGZyb20g
dGhlIGkuTVg2VUxMIERUQiBhbnl3YXkuCgpTaWduZWQtb2ZmLWJ5OiBMb3RoYXIgV2HDn21hbm4g
PExXQEtBUk8tZWxlY3Ryb25pY3MuZGU+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsbC5k
dHNpIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg2dWxsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9p
bXg2dWxsLmR0c2kKaW5kZXggODcyNGZkYjIuLmRhMzI1Y2QgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2lteDZ1bGwuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2dWxsLmR0
c2kKQEAgLTY3LDYgKzY3LDEyIEBACiAJCQl9OwogCQl9OwogCisJCWFpcHMtYnVzQDIxMDAwMDAg
eworCQkJL2RlbGV0ZS1ub2RlLyBjYWFtQDIxNDAwMDAwOworCQkJL2RlbGV0ZS1ub2RlLyBzaW1A
MjE4YzAwMDA7CisJCQkvZGVsZXRlLW5vZGUvIHNpbUAyMWI0MDAwMDsKKwkJfTsKKwogCQlhaXBz
MzogYWlwcy1idXNAMjIwMDAwMCB7CiAJCQljb21wYXRpYmxlID0gImZzbCxhaXBzLWJ1cyIsICJz
aW1wbGUtYnVzIjsKIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwotLSAKMi4xLjQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVs
IG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
