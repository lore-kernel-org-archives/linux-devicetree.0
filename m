From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv2 1/2] ARM: dts: imx53: add another pingroup for NAND pads
Date: Thu, 16 Jan 2014 09:15:22 +0100
Message-ID: <1389860123-14874-2-git-send-email-LW@KARO-electronics.de>
References: <1389860123-14874-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1389860123-14874-1-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

ClNpZ25lZC1vZmYtYnk6IExvdGhhciBXYcOfbWFubiA8TFdAS0FSTy1lbGVjdHJvbmljcy5kZT4K
LS0tCiBhcmNoL2FybS9ib290L2R0cy9pbXg1My1waW5ncnAuaCB8ICAgMTcgKysrKysrKysrKysr
KysrKysKIDEgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg1My1waW5ncnAuaCBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2lteDUzLXBpbmdycC5oCmluZGV4IGFjOGU3M2QuLmY4ZDdkOWMgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDUzLXBpbmdycC5oCisrKyBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2lteDUzLXBpbmdycC5oCkBAIC0zMDAsNiArMzAwLDIzIEBACiAJTVg1M19QQURfUEFUQV9E
QVRBNl9fRU1JX05BTkRGX0RfNgkJMHhhNCBcCiAJTVg1M19QQURfUEFUQV9EQVRBN19fRU1JX05B
TkRGX0RfNwkJMHhhNAogCisjZGVmaW5lIE1YNTNfTkFORF9QSU5HUlAyIFwKKwlNWDUzX1BBRF9O
QU5ERl9XRV9CX19FTUlfTkFOREZfV0VfQgkJMHg0IFwKKwlNWDUzX1BBRF9OQU5ERl9SRV9CX19F
TUlfTkFOREZfUkVfQgkJMHg0IFwKKwlNWDUzX1BBRF9OQU5ERl9DTEVfX0VNSV9OQU5ERl9DTEUJ
CTB4NCBcCisJTVg1M19QQURfTkFOREZfQUxFX19FTUlfTkFOREZfQUxFCQkweDQgXAorCU1YNTNf
UEFEX05BTkRGX1dQX0JfX0VNSV9OQU5ERl9XUF9CCQkweGUwIFwKKwlNWDUzX1BBRF9OQU5ERl9S
QjBfX0VNSV9OQU5ERl9SQl8wCQkweGUwIFwKKwlNWDUzX1BBRF9OQU5ERl9DUzBfX0VNSV9OQU5E
Rl9DU18wCQkweDQgXAorCU1YNTNfUEFEX0VJTV9EQTBfX0VNSV9OQU5EX1dFSU1fREFfMAkJMHhh
NCBcCisJTVg1M19QQURfRUlNX0RBMV9fRU1JX05BTkRfV0VJTV9EQV8xCQkweGE0IFwKKwlNWDUz
X1BBRF9FSU1fREEyX19FTUlfTkFORF9XRUlNX0RBXzIJCTB4YTQgXAorCU1YNTNfUEFEX0VJTV9E
QTNfX0VNSV9OQU5EX1dFSU1fREFfMwkJMHhhNCBcCisJTVg1M19QQURfRUlNX0RBNF9fRU1JX05B
TkRfV0VJTV9EQV80CQkweGE0IFwKKwlNWDUzX1BBRF9FSU1fREE1X19FTUlfTkFORF9XRUlNX0RB
XzUJCTB4YTQgXAorCU1YNTNfUEFEX0VJTV9EQTZfX0VNSV9OQU5EX1dFSU1fREFfNgkJMHhhNCBc
CisJTVg1M19QQURfRUlNX0RBN19fRU1JX05BTkRfV0VJTV9EQV83CQkweGE0CisKICNkZWZpbmUg
TVg1M19PV0lSRV9QSU5HUlAxIFwKIAlNWDUzX1BBRF9HUElPXzE4X19PV0lSRV9MSU5FCQkJMHg4
MDAwMDAwMAogCi0tIAoxLjcuMi41CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
