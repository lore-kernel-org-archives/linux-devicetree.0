From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/3] ARM: aspeed: Add defconfigs for CONFIG_ASPEED_BT_IPMI_HOST
Date: Wed, 31 Aug 2016 19:24:18 +0200
Message-ID: <1472664259-23933-3-git-send-email-clg@kaod.org>
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
L2FybS9jb25maWdzL2FzcGVlZF9nNF9kZWZjb25maWcgfCAxICsKIGFyY2gvYXJtL2NvbmZpZ3Mv
YXNwZWVkX2c1X2RlZmNvbmZpZyB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNF9kZWZjb25maWcgYi9h
cmNoL2FybS9jb25maWdzL2FzcGVlZF9nNF9kZWZjb25maWcKaW5kZXggY2EzOWMwNGZlYzZiLi43
ZjM5ZDY0MzU3ZmEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2NvbmZpZ3MvYXNwZWVkX2c0X2RlZmNv
bmZpZworKysgYi9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNF9kZWZjb25maWcKQEAgLTQwLDYg
KzQwLDcgQEAgQ09ORklHX1VFVkVOVF9IRUxQRVJfUEFUSD0iL3NiaW4vaG90cGx1ZyIKIENPTkZJ
R19ERVZUTVBGUz15CiBDT05GSUdfREVWVE1QRlNfTU9VTlQ9eQogIyBDT05GSUdfUFJFVkVOVF9G
SVJNV0FSRV9CVUlMRCBpcyBub3Qgc2V0CitDT05GSUdfQVNQRUVEX0JUX0lQTUlfSE9TVD15CiAj
IENPTkZJR19JTlBVVCBpcyBub3Qgc2V0CiAjIENPTkZJR19TRVJJTyBpcyBub3Qgc2V0CiAjIENP
TkZJR19WVCBpcyBub3Qgc2V0CmRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9n
NV9kZWZjb25maWcgYi9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNV9kZWZjb25maWcKaW5kZXgg
NGYzNjZiMDM3MGU5Li41M2Q3NGFmZDA1ZWEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2NvbmZpZ3Mv
YXNwZWVkX2c1X2RlZmNvbmZpZworKysgYi9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNV9kZWZj
b25maWcKQEAgLTQxLDYgKzQxLDcgQEAgQ09ORklHX1VFVkVOVF9IRUxQRVJfUEFUSD0iL3NiaW4v
aG90cGx1ZyIKIENPTkZJR19ERVZUTVBGUz15CiBDT05GSUdfREVWVE1QRlNfTU9VTlQ9eQogIyBD
T05GSUdfUFJFVkVOVF9GSVJNV0FSRV9CVUlMRCBpcyBub3Qgc2V0CitDT05GSUdfQVNQRUVEX0JU
X0lQTUlfSE9TVD15CiAjIENPTkZJR19JTlBVVCBpcyBub3Qgc2V0CiAjIENPTkZJR19TRVJJTyBp
cyBub3Qgc2V0CiAjIENPTkZJR19WVCBpcyBub3Qgc2V0Ci0tIAoyLjcuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFp
bGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
