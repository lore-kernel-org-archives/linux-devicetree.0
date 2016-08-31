From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/3] ARM: aspeed: add support for the BT IPMI host device
Date: Wed, 31 Aug 2016 19:24:16 +0200
Message-ID: <1472664259-23933-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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

SGVsbG8sCgpUaGlzIHNlcmllIGFkZHMgc3VwcG9ydCBmb3IgdGhlIEJUIElQTUkgaG9zdCBkZXZp
Y2Ugb24gQXNwZWVkIFNvQ3MKYXN0MjQwMCBhbmQgYXN0MjUwMC4gCgpDaGVlcnMsCgpDLgoKQWxp
c3RhaXIgUG9wcGxlICgxKToKICBtaXNjOiBBZGQgQXNwZWVkIEJUIElQTUkgaG9zdCBkcml2ZXIK
CkPDqWRyaWMgTGUgR29hdGVyICgyKToKICBBUk06IGFzcGVlZDogQWRkIGRlZmNvbmZpZ3MgZm9y
IENPTkZJR19BU1BFRURfQlRfSVBNSV9IT1NUCiAgQVJNOiBkdHM6IGFzcGVlZDogRW5hYmxlIEJU
IElQTUkgaG9zdCBkZXZpY2UKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9taXNjL2FzcGVlZCxi
dC1ob3N0LnR4dCAgICB8ICAxOSArCiBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaSAg
ICAgICAgICAgICAgICAgICB8ICAgNiArCiBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRz
aSAgICAgICAgICAgICAgICAgICB8ICAgNiArCiBhcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNF9k
ZWZjb25maWcgICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL2FybS9jb25maWdzL2FzcGVlZF9n
NV9kZWZjb25maWcgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL21pc2MvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNSArCiBkcml2ZXJzL21pc2MvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL21pc2MvYnQt
aG9zdC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQzMyArKysrKysrKysrKysrKysr
KysrKysKIGluY2x1ZGUvdWFwaS9saW51eC9LYnVpbGQgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAxICsKIGluY2x1ZGUvdWFwaS9saW51eC9idC1ob3N0LmggICAgICAgICAgICAgICAgICAg
ICAgIHwgIDE4ICsKIDEwIGZpbGVzIGNoYW5nZWQsIDQ5MSBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21pc2MvYXNwZWVk
LGJ0LWhvc3QudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9taXNjL2J0LWhvc3QuYwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvdWFwaS9saW51eC9idC1ob3N0LmgKCi0tIAoyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFy
bS1rZXJuZWwK
