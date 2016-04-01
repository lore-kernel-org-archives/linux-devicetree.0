From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH 1/2] ARM: dts: imx6: Fix PCIe reset gpio polarity on Toradex
 Apalis Ixora
Date: Fri,  1 Apr 2016 14:41:47 +0200
Message-ID: <1459514508-8557-2-git-send-email-ynezz@true.cz>
References: <1459514508-8557-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1459514508-8557-1-git-send-email-ynezz@true.cz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Fabio Estevam <festevam@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pci@vger.kernel.org, Tim Harvey <tharvey@gateworks.com>, Richard Zhu <Richard.Zhu@freescale.com>, stefan@agner.ch, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

QWRkaW5nIHJlc2V0LWdwaW8tYWN0aXZlLWhpZ2ggYm9vbGVhbiBEVCBiaW5kaW5nIHByb3BlcnR5
LCB3aGljaCB3ZSBuZWVkCnRvIG1ha2UgUENJZSB3b3JraW5nIG9uIEFwYWxpcyBTb01zIGFuZCBu
b3QgYnJlYWsgb2xkIERUQnMuIFdoaWxlIGF0IGl0LApJJ3ZlIGZpeGVkIGNvbW1lbnQgYW5kIEdQ
SU8gcG9sYXJpdHkuCgpPbiBBcGFsaXMgU29NcyB0aGUgR1BJTzFfSU8yOCB1c2VkIHRvIFBDSWUg
cmVzZXQgaXMgbm90IGNvbm5lY3RlZApkaXJlY3RseSB0byBQRVJTVCMgUENJZSBzaWduYWwsIGJ1
dCBpdCdzIE9SZWQgd2l0aCBSRVNFVEJNQ1UgY29taW5nIG9mZgp0aGUgUE1JQywgYW5kIHRodXMg
aXMgaW52ZXJ0ZWQsIGFjdGl2ZS1oaWdoLgoKU2lnbmVkLW9mZi1ieTogUGV0ciDFoHRldGlhciA8
eW5lenpAdHJ1ZS5jej4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9pbXg2cS1hcGFsaXMtaXhvcmEu
ZHRzIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg2cS1hcGFsaXMtaXhvcmEu
ZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnEtYXBhbGlzLWl4b3JhLmR0cwppbmRleCAyY2Jh
ODJkLi40YjUzM2NiIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg2cS1hcGFsaXMt
aXhvcmEuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxLWFwYWxpcy1peG9yYS5kdHMK
QEAgLTE3NCw4ICsxNzQsOSBAQAogfTsKIAogJnBjaWUgewotCS8qIGFjdGl2ZS1sb3cgbWVhbmlu
ZyBvcHBvc2l0ZSBvZiByZWd1bGFyIFBFUlNUIyBhY3RpdmUtbG93IHBvbGFyaXR5ICovCi0JcmVz
ZXQtZ3BpbyA9IDwmZ3BpbzEgMjggR1BJT19BQ1RJVkVfTE9XPjsKKwkvKiBhY3RpdmUtaGlnaCBt
ZWFuaW5nIG9wcG9zaXRlIG9mIHJlZ3VsYXIgUEVSU1QjIGFjdGl2ZS1sb3cgcG9sYXJpdHkgKi8K
KwlyZXNldC1ncGlvID0gPCZncGlvMSAyOCBHUElPX0FDVElWRV9ISUdIPjsKKwlyZXNldC1ncGlv
LWFjdGl2ZS1oaWdoOwogCXN0YXR1cyA9ICJva2F5IjsKIH07CiAKLS0gCjEuOS4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5l
bCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
