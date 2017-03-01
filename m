From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/2] ARM: aspeed: Add CONFIG_SPI_ASPEED_SMC
Date: Wed,  1 Mar 2017 15:26:43 +0100
Message-ID: <1488378403-24640-3-git-send-email-clg@kaod.org>
References: <1488378403-24640-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488378403-24640-1-git-send-email-clg@kaod.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KLS0tCiBhcmNo
L2FybS9jb25maWdzL2FzcGVlZF9nNF9kZWZjb25maWcgfCAzICsrKwogYXJjaC9hcm0vY29uZmln
cy9hc3BlZWRfZzVfZGVmY29uZmlnIHwgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9hc3BlZWRfZzRfZGVmY29uZmln
IGIvYXJjaC9hcm0vY29uZmlncy9hc3BlZWRfZzRfZGVmY29uZmlnCmluZGV4IGQyNTAxMGUzYTBi
Yy4uOGJkOWU2YTkxZDQxIDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNF9k
ZWZjb25maWcKKysrIGIvYXJjaC9hcm0vY29uZmlncy9hc3BlZWRfZzRfZGVmY29uZmlnCkBAIC00
MCw2ICs0MCw5IEBAIENPTkZJR19VRVZFTlRfSEVMUEVSX1BBVEg9Ii9zYmluL2hvdHBsdWciCiBD
T05GSUdfREVWVE1QRlM9eQogQ09ORklHX0RFVlRNUEZTX01PVU5UPXkKICMgQ09ORklHX1BSRVZF
TlRfRklSTVdBUkVfQlVJTEQgaXMgbm90IHNldAorQ09ORklHX01URD15CitDT05GSUdfTVREX1NQ
SV9OT1I9eQorQ09ORklHX1NQSV9BU1BFRURfU01DPXkKIENPTkZJR19ORVRERVZJQ0VTPXkKICMg
Q09ORklHX05FVF9WRU5ET1JfQUxBQ1JJVEVDSCBpcyBub3Qgc2V0CiAjIENPTkZJR19ORVRfVkVO
RE9SX0FNQVpPTiBpcyBub3Qgc2V0CmRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL2FzcGVl
ZF9nNV9kZWZjb25maWcgYi9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNV9kZWZjb25maWcKaW5k
ZXggNWY2NjBiMDJhYmQ5Li4wZWZmNGE1M2ZkNDYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2NvbmZp
Z3MvYXNwZWVkX2c1X2RlZmNvbmZpZworKysgYi9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNV9k
ZWZjb25maWcKQEAgLTQ2LDYgKzQ2LDkgQEAgQ09ORklHX1VFVkVOVF9IRUxQRVJfUEFUSD0iL3Ni
aW4vaG90cGx1ZyIKIENPTkZJR19ERVZUTVBGUz15CiBDT05GSUdfREVWVE1QRlNfTU9VTlQ9eQog
IyBDT05GSUdfUFJFVkVOVF9GSVJNV0FSRV9CVUlMRCBpcyBub3Qgc2V0CitDT05GSUdfTVREPXkK
K0NPTkZJR19NVERfU1BJX05PUj15CitDT05GSUdfU1BJX0FTUEVFRF9TTUM9eQogQ09ORklHX05F
VERFVklDRVM9eQogIyBDT05GSUdfTkVUX1ZFTkRPUl9BTEFDUklURUNIIGlzIG5vdCBzZXQKICMg
Q09ORklHX05FVF9WRU5ET1JfQU1BWk9OIGlzIG5vdCBzZXQKLS0gCjIuNy40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBt
YWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
