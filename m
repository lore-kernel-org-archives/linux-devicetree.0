From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 03/18] ARM64: dts: meson-gxbb-vega-s95: Fix Wifi node name
Date: Fri, 20 Jan 2017 23:21:03 +0100
Message-ID: <20170120222118.21476-4-afaerber@suse.de>
References: <20170120222118.21476-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170120222118.21476-1-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-amlogic@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Carlo Caione <carlo@caione.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

YmNybWYgLT4gYnJjbWYKCkZpeGVzOiBhYjViMjRmZGQyZDUgKCJBUk02NDogZHRzOiBtZXNvbi1n
eGJiLXZlZ2Etczk1OiBBZGQgU0QvU0RJTy9NTUMgYW5kIFBXTSBub2RlcyIpCkNjOiBNYXJ0aW4g
Qmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Ci0tLQogYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4YmItdmVnYS1zOTUuZHRzaSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGJiLXZlZ2Etczk1LmR0c2kgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hiYi12ZWdhLXM5NS5kdHNpCmluZGV4IDg2
NzA5OTI5ZmQyMC4uZTY4OGU4OTcxYTk1IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvbWVzb24tZ3hiYi12ZWdhLXM5NS5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1neGJiLXZlZ2Etczk1LmR0c2kKQEAgLTE2Nyw3ICsxNjcsNyBAQAog
CXZtbWMtc3VwcGx5ID0gPCZ2Y2NfM3YzPjsKIAl2cW1tYy1zdXBwbHkgPSA8JnZjY18xdjg+Owog
Ci0JYnJjbWY6IGJjcm1mQDEgeworCWJyY21mOiBicmNtZkAxIHsKIAkJcmVnID0gPDE+OwogCQlj
b21wYXRpYmxlID0gImJyY20sYmNtNDMyOS1mbWFjIjsKIAl9OwotLSAKMi4xMC4yCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5l
bCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
