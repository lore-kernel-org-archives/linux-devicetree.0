From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 3/3] ARM: dts: aspeed: Enable BT IPMI host device
Date: Wed, 31 Aug 2016 19:24:19 +0200
Message-ID: <1472664259-23933-4-git-send-email-clg@kaod.org>
References: <1472664259-23933-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1472664259-23933-1-git-send-email-clg@kaod.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Alistair Popple <alistair@popple.id.au>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KLS0tCiBhcmNo
L2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaSB8IDYgKysrKysrCiBhcmNoL2FybS9ib290L2R0
cy9hc3BlZWQtZzUuZHRzaSB8IDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaSBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNC5kdHNpCmluZGV4IDIyZGVlNTkzN2Q1Yy4uMWNmNTdh
MmIwOGQzIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaQorKysg
Yi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaQpAQCAtODIsNiArODIsMTIgQEAKIAkJ
CQljbG9ja3MgPSA8JmNsa19hcGI+OwogCQkJfTsKIAorCQkJaWJ0OiBpYnRAMWU3ODkxNDAgewor
CQkJCWNvbXBhdGlibGUgPSAiYXNwZWVkLGJ0LWhvc3QiOworCQkJCXJlZyA9IDwweDFlNzg5MTQw
IDB4MTg+OworCQkJCWludGVycnVwdHMgPSA8OD47CisJCQl9OworCiAJCQl3ZHQxOiB3ZHRAMWU3
ODUwMDAgewogCQkJCWNvbXBhdGlibGUgPSAiYXNwZWVkLHdkdCI7CiAJCQkJcmVnID0gPDB4MWU3
ODUwMDAgMHgxYz47CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRz
aSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpCmluZGV4IGRkOTRkOTM2MWZkYS4u
OWYyOWM0MDlkNjA2IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRz
aQorKysgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRzaQpAQCAtODYsNiArODYsMTIg
QEAKIAkJCQljbG9ja3MgPSA8JmNsa19hcGI+OwogCQkJfTsKIAorCQkJaWJ0OiBpYnRAMWU3ODkx
NDAgeworCQkJCWNvbXBhdGlibGUgPSAiYXNwZWVkLGJ0LWhvc3QiOworCQkJCXJlZyA9IDwweDFl
Nzg5MTQwIDB4MTg+OworCQkJCWludGVycnVwdHMgPSA8OD47CisJCQl9OworCiAJCQl3ZHQxOiB3
ZHRAMWU3ODUwMDAgewogCQkJCWNvbXBhdGlibGUgPSAiYXNwZWVkLHdkdCI7CiAJCQkJcmVnID0g
PDB4MWU3ODUwMDAgMHgxYz47Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
