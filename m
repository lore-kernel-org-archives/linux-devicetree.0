From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 09/18] arm64: dts: meson-gxbb-wetek-hub: Reference CVBS
 node by label
Date: Sat, 13 May 2017 16:33:28 +0200
Message-ID: <20170513143337.14278-10-afaerber@suse.de>
References: <20170513143337.14278-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170513143337.14278-1-afaerber@suse.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Carlo Caione <carlo@caione.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

TWFrZXMgdGhlIG92ZXJyaWRlIHNhZmVyLgoKQWNrZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJt
c3Ryb25nQGJheWxpYnJlLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBGw6RyYmVyIDxhZmFl
cmJlckBzdXNlLmRlPgotLS0KIHYxIC0+IHYyOgogKiBFeHRlbmRlZCBjb21taXQgbWVzc2FnZQog
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hiYi1wMjB4LmR0c2kgICAgIHwg
MiArLQogYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4YmItd2V0ZWstaHViLmR0
cyB8IDYgKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hi
Yi1wMjB4LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hiYi1wMjB4
LmR0c2kKaW5kZXggYTViZTQzOGE1YzAzLi4wZWMxZDE5NTIyZGQgMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGJiLXAyMHguZHRzaQorKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hiYi1wMjB4LmR0c2kKQEAgLTEyNiw3ICsxMjYs
NyBAQAogCQljbG9jay1uYW1lcyA9ICJleHRfY2xvY2siOwogCX07CiAKLQljdmJzLWNvbm5lY3Rv
ciB7CisJY3Zic19jb25uZWN0b3I6IGN2YnMtY29ubmVjdG9yIHsKIAkJY29tcGF0aWJsZSA9ICJj
b21wb3NpdGUtdmlkZW8tY29ubmVjdG9yIjsKIAogCQlwb3J0IHsKZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGJiLXdldGVrLWh1Yi5kdHMgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hiYi13ZXRlay1odWIuZHRzCmluZGV4IGYwNTdm
YjQ4ZmVlNS4uMTg3OGFjMmIyYjgzIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvbWVzb24tZ3hiYi13ZXRlay1odWIuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1neGJiLXdldGVrLWh1Yi5kdHMKQEAgLTU5LDEwICs1OSwxMCBAQAogCQkJ
cGFuaWMtaW5kaWNhdG9yOwogCQl9OwogCX07Cit9OwogCi0JY3Zicy1jb25uZWN0b3IgewotCQlz
dGF0dXMgPSAiZGlzYWJsZWQiOwotCX07CismY3Zic19jb25uZWN0b3IgeworCXN0YXR1cyA9ICJk
aXNhYmxlZCI7CiB9OwogCiAmZXRobWFjIHsKLS0gCjIuMTIuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBs
aXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
