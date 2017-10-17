From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 06/12] ARM: dts: imx6-tx6: specify ethernet phy reset
 post-delay
Date: Tue, 17 Oct 2017 10:53:28 +0200
Message-ID: <1508230414-8090-7-git-send-email-LW@KARO-electronics.de>
References: <1508230414-8090-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1508230414-8090-1-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

VW5kZXIgY2VydGFpbiBjaXJjdW1zdGFuY2VzIHRoZSBldGhlcm5ldCBQSFkgY2Fubm90IGJlIGRl
dGVjdGVkIG9uCkthLVJvIGVsZWN0cm9uaWNzIFRYNiBtb2R1bGVzLiBVc2luZyBhIHBoeS1yZXNl
dC1wb3N0LWRlbGF5IG9mIGF0IGxlYXN0CjJtcyBhbGxldmlhdGVzIHRoaXMgcHJvYmxlbS4gRGVm
aW5lIGl0IHRvIDEwbXMgdG8gYmUgb24gdGhlIHNhZmUgc2lkZS4KClNpZ25lZC1vZmYtYnk6IExv
dGhhciBXYcOfbWFubiA8TFdAS0FSTy1lbGVjdHJvbmljcy5kZT4KLS0tCiBhcmNoL2FybS9ib290
L2R0cy9pbXg2cWRsLXR4Ni5kdHNpIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLXR4Ni5kdHNpIGIvYXJj
aC9hcm0vYm9vdC9kdHMvaW14NnFkbC10eDYuZHRzaQppbmRleCBhYTMyOTU2Li5jNmIyZDYzIDEw
MDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLXR4Ni5kdHNpCisrKyBiL2FyY2gv
YXJtL2Jvb3QvZHRzL2lteDZxZGwtdHg2LmR0c2kKQEAgLTI0OSw2ICsyNDksNyBAQAogCWNsb2Nr
LW5hbWVzID0gImlwZyIsICJhaGIiLCAicHRwIiwgImVuZXRfb3V0IjsKIAlwaHktbW9kZSA9ICJy
bWlpIjsKIAlwaHktcmVzZXQtZ3Bpb3MgPSA8JmdwaW83IDYgR1BJT19BQ1RJVkVfTE9XPjsKKwlw
aHktcmVzZXQtcG9zdC1kZWxheSA9IDwxMD47CiAJcGh5LWhhbmRsZSA9IDwmZXRucGh5PjsKIAlw
aHktc3VwcGx5ID0gPCZyZWdfM3YzX2V0bj47CiAJc3RhdHVzID0gIm9rYXkiOwotLSAKMi4xLjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCg==
