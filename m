From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH 3/3] ARM: dts: bcm2835-rpi: Add "brcm,
 raspberrypi-pm-wdt" to wdt compatible
Date: Tue,  9 Jun 2015 12:21:45 +0200
Message-ID: <1433845305-17329-3-git-send-email-noralf@tronnes.org>
References: <1433845305-17329-1-git-send-email-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1433845305-17329-1-git-send-email-noralf@tronnes.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIFJhc3BiZXJyeSBQaSB1c2VzIGEgbmV3IHZhbHVlIGZvciBoYWx0IGluIHRoZSBQTV9SU1RT
IHdhdGNoZG9nCnJlZ2lzdGVyLiBFeHBhbmQgdGhlIGNvbXBhdGlibGUgc3RyaW5nIHRvIGNvdmVy
IHRoaXMuCgpTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9y
Zz4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9iY20yODM1LXJwaS5kdHNpIHwgNCArKysrCiBhcmNo
L2FybS9ib290L2R0cy9iY20yODM1LmR0c2kgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290
L2R0cy9iY20yODM1LXJwaS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvYmNtMjgzNS1ycGkuZHRz
aQppbmRleCA0Njc4MGJiLi5mZWIxMjgyIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9i
Y20yODM1LXJwaS5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2JjbTI4MzUtcnBpLmR0c2kK
QEAgLTE2LDYgKzE2LDEwIEBACiAJfTsKIH07CiAKKyZ3YXRjaGRvZyB7CisJY29tcGF0aWJsZSA9
ICJicmNtLHJhc3BiZXJyeXBpLXBtLXdkdCIsICJicmNtLGJjbTI4MzUtcG0td2R0IjsKK307CisK
ICZncGlvIHsKIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwogCmRpZmYgLS1naXQgYS9hcmNo
L2FybS9ib290L2R0cy9iY20yODM1LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9iY20yODM1LmR0
c2kKaW5kZXggMzAxYzczZi4uMzQ0NWJiMyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMv
YmNtMjgzNS5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2JjbTI4MzUuZHRzaQpAQCAtNTIs
NyArNTIsNyBAQAogCQkJI2ludGVycnVwdC1jZWxscyA9IDwyPjsKIAkJfTsKIAotCQl3YXRjaGRv
Z0A3ZTEwMDAwMCB7CisJCXdhdGNoZG9nOiB3YXRjaGRvZ0A3ZTEwMDAwMCB7CiAJCQljb21wYXRp
YmxlID0gImJyY20sYmNtMjgzNS1wbS13ZHQiOwogCQkJcmVnID0gPDB4N2UxMDAwMDAgMHgyOD47
CiAJCX07Ci0tIAoyLjIuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
