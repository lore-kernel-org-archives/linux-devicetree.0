From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 06/14] ARM: dts: imx6ul: disable PWMs by default
Date: Tue, 12 Jan 2016 18:21:23 +0100
Message-ID: <1452619291-13625-7-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-2-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-3-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-4-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-5-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-6-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1452619291-13625-6-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

U2luY2UgUFdNcyBhcmUgb25seSB1c2VmdWwgaWYgdGhleSBhcmUgYWN0dWFsbHkgY29ubmVjdGVk
IHRvIGFuIG91dHB1dCBwaW4sCmxldCB1c2VycyBlbmFibGUgdGhlbSBleHBsaWNpdGx5IGluIHRo
ZWlyIGRldmljZSB0cmVlcyB3aGVyZSB0aGV5IHNob3VsZAphbHNvIHNldCB1cCB0aGUgcGluIGNv
bmZpZ3VyYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBMb3RoYXIgV2HDn21hbm4gPExXQEtBUk8tZWxl
Y3Ryb25pY3MuZGU+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsLmR0c2kgfCA0ICsrKysK
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9pbXg2dWwuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bC5kdHNpCmluZGV4
IDNhYmEwYmIuLjg2Mzc3N2UgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bC5k
dHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bC5kdHNpCkBAIC01MTIsNiArNTEyLDcg
QEAKIAkJCQkJIDwmY2xrcyBJTVg2VUxfQ0xLX1BXTTU+OwogCQkJCWNsb2NrLW5hbWVzID0gImlw
ZyIsICJwZXIiOwogCQkJCSNwd20tY2VsbHMgPSA8Mj47CisJCQkJc3RhdHVzID0gImRpc2FibGVk
IjsKIAkJCX07CiAKIAkJCXB3bTY6IHB3bUAwMjBmNDAwMCB7CkBAIC01MjIsNiArNTIzLDcgQEAK
IAkJCQkJIDwmY2xrcyBJTVg2VUxfQ0xLX1BXTTY+OwogCQkJCWNsb2NrLW5hbWVzID0gImlwZyIs
ICJwZXIiOwogCQkJCSNwd20tY2VsbHMgPSA8Mj47CisJCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
IAkJCX07CiAKIAkJCXB3bTc6IHB3bUAwMjBmODAwMCB7CkBAIC01MzIsNiArNTM0LDcgQEAKIAkJ
CQkJIDwmY2xrcyBJTVg2VUxfQ0xLX1BXTTc+OwogCQkJCWNsb2NrLW5hbWVzID0gImlwZyIsICJw
ZXIiOwogCQkJCSNwd20tY2VsbHMgPSA8Mj47CisJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJ
CX07CiAKIAkJCXB3bTg6IHB3bUAwMjBmYzAwMCB7CkBAIC01NDIsNiArNTQ1LDcgQEAKIAkJCQkJ
IDwmY2xrcyBJTVg2VUxfQ0xLX1BXTTg+OwogCQkJCWNsb2NrLW5hbWVzID0gImlwZyIsICJwZXIi
OwogCQkJCSNwd20tY2VsbHMgPSA8Mj47CisJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07
CiAJCX07CiAKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
