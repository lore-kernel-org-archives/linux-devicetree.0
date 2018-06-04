From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v5 1/4] ARM: imx: remove inexistant EPIT timer init
Date: Mon,  4 Jun 2018 12:00:32 +0200
Message-ID: <20180604100035.19558-2-peron.clem@gmail.com>
References: <20180604100035.19558-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180604100035.19558-1-peron.clem@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Colin Didier <colin.didier@devialet.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, =?UTF-8?q?Cl=C3=A9ment=20Peron?= <clement.peron@devialet.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Thomas Gleixner <tglx@linutronix.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: devicetree@vger.kernel.org

RnJvbTogQ2zDqW1lbnQgUGVyb24gPGNsZW1lbnQucGVyb25AZGV2aWFsZXQuY29tPgoKaS5NWCBF
UElUIHRpbWVyIGhhcyBiZWVuIHJlbW92ZWQgYnV0IG5vdCB0aGUgaW5pdCBmdW5jdGlvbiBkZWNs
YXJhdGlvbi4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFBlcm9uIDxjbGVtZW50LnBlcm9uQGRl
dmlhbGV0LmNvbT4KUmV2aWV3ZWQtYnk6IEZhYmlvIEVzdGV2YW0gPGZhYmlvLmVzdGV2YW1Abnhw
LmNvbT4KLS0tCiBhcmNoL2FybS9tYWNoLWlteC9jb21tb24uaCB8IDEgLQogMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLWlteC9jb21tb24u
aCBiL2FyY2gvYXJtL21hY2gtaW14L2NvbW1vbi5oCmluZGV4IGM4ZDY4ZTkxOGIyZi4uMThhYWU3
NmZhMmRhIDEwMDY0NAotLS0gYS9hcmNoL2FybS9tYWNoLWlteC9jb21tb24uaAorKysgYi9hcmNo
L2FybS9tYWNoLWlteC9jb21tb24uaApAQCAtMzgsNyArMzgsNiBAQCB2b2lkIGlteDIxX3NvY19p
bml0KHZvaWQpOwogdm9pZCBpbXgyN19zb2NfaW5pdCh2b2lkKTsKIHZvaWQgaW14MzFfc29jX2lu
aXQodm9pZCk7CiB2b2lkIGlteDM1X3NvY19pbml0KHZvaWQpOwotdm9pZCBlcGl0X3RpbWVyX2lu
aXQodm9pZCBfX2lvbWVtICpiYXNlLCBpbnQgaXJxKTsKIGludCBteDIxX2Nsb2Nrc19pbml0KHVu
c2lnbmVkIGxvbmcgbHJlZiwgdW5zaWduZWQgbG9uZyBmcmVmKTsKIGludCBteDI3X2Nsb2Nrc19p
bml0KHVuc2lnbmVkIGxvbmcgZnJlZik7CiBpbnQgbXgzMV9jbG9ja3NfaW5pdCh1bnNpZ25lZCBs
b25nIGZyZWYpOwotLSAKMi4xNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
