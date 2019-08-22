From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH 1/1] arm64: dts: imx8mq: Add mux controller to iomuxc_gpr
Date: Thu, 22 Aug 2019 13:10:23 +0200
Message-ID: <fa3b1df7fc5e74f375df5de53061d1a93d154b51.1566471985.git.agx@sigxcpu.org>
References: <cover.1566471985.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1566471985.git.agx@sigxcpu.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

VGhlIG9ubHkgbXV4IGNvbnRyb2xzIHRoZSBNSVBJIERTSSBpbnB1dCBzZWxlY3Rpb24uCgpTaWdu
ZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgotLS0KIGFyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpIHwgOSArKysrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpCmluZGV4IDRmZGQ2MGYyYzUxZS4uM2YzNTk0ZDk0ODVj
IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXEuZHRzaQor
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXEuZHRzaQpAQCAtNDQwLDgg
KzQ0MCwxNSBAQAogCQkJfTsKIAogCQkJaW9tdXhjX2dwcjogc3lzY29uQDMwMzQwMDAwIHsKLQkJ
CQljb21wYXRpYmxlID0gImZzbCxpbXg4bXEtaW9tdXhjLWdwciIsICJmc2wsaW14NnEtaW9tdXhj
LWdwciIsICJzeXNjb24iOworCQkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhtcS1pb211eGMtZ3By
IiwgImZzbCxpbXg2cS1pb211eGMtZ3ByIiwKKwkJCQkJICAgICAic3lzY29uIiwgInNpbXBsZS1t
ZmQiOwogCQkJCXJlZyA9IDwweDMwMzQwMDAwIDB4MTAwMDA+OworCisJCQkJbXV4OiBtdXgtY29u
dHJvbGxlciB7CisJCQkJCWNvbXBhdGlibGUgPSAibW1pby1tdXgiOworCQkJCQkjbXV4LWNvbnRy
b2wtY2VsbHMgPSA8MT47CisJCQkJCW11eC1yZWctbWFza3MgPSA8MHgzNCAweDAwMDAwMDA0Pjsg
LyogTUlQSV9NVVhfU0VMICovCisJCQkJfTsKIAkJCX07CiAKIAkJCW9jb3RwOiBvY290cC1jdHJs
QDMwMzUwMDAwIHsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
