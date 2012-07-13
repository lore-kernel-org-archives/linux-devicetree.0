From: y@pengutronix.de
Subject: [PATCH 03/11] ARM: cache-l2x0: add a const qualifier
Date: Fri, 13 Jul 2012 14:32:06 +0200
Message-ID: <18650.5943922841$1342183443@news.gmane.org>
References: <1342182734-321-1-git-send-email-y>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1342182734-321-1-git-send-email-y>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>, Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@arm.linux.org.uk>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, kernel@pengutronix.de, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
ClRoaXMgcHJlcGFyZXMgb2ZfZGV2aWNlX2lkLmRhdGEgYmVjb21pbmcgY29uc3QuIFdpdGhvdXQg
dGhpcyBjaGFuZ2UgdGhlCmZvbGxvd2luZyB3YXJuaW5nIHdvdWxkIG9jY3VyOgoKCWFyY2gvYXJt
L21tL2NhY2hlLWwyeDAuYzogSW4gZnVuY3Rpb24gJ2wyeDBfb2ZfaW5pdCc6CglhcmNoL2FybS9t
bS9jYWNoZS1sMngwLmM6NTczOjc6IHdhcm5pbmc6IGFzc2lnbm1lbnQgZGlzY2FyZHMgJ2NvbnN0
JyBxdWFsaWZpZXIgZnJvbSBwb2ludGVyIHRhcmdldCB0eXBlIFtlbmFibGVkIGJ5IGRlZmF1bHRd
Cgp0aG91Z2guCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29l
bmlnQHBlbmd1dHJvbml4LmRlPgpDYzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm0ubGludXgub3Jn
LnVrPgotLS0KIGFyY2gvYXJtL21tL2NhY2hlLWwyeDAuYyB8ICAgIDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L21tL2NhY2hlLWwyeDAuYyBiL2FyY2gvYXJtL21tL2NhY2hlLWwyeDAuYwppbmRleCAyYThlMzgw
Li41NzdiYWY3IDEwMDY0NAotLS0gYS9hcmNoL2FybS9tbS9jYWNoZS1sMngwLmMKKysrIGIvYXJj
aC9hcm0vbW0vY2FjaGUtbDJ4MC5jCkBAIC01NTQsNyArNTU0LDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgbDJ4MF9pZHNbXSBfX2luaXRjb25zdCA9IHsKIGludCBfX2luaXQg
bDJ4MF9vZl9pbml0KHUzMiBhdXhfdmFsLCB1MzIgYXV4X21hc2spCiB7CiAJc3RydWN0IGRldmlj
ZV9ub2RlICpucDsKLQlzdHJ1Y3QgbDJ4MF9vZl9kYXRhICpkYXRhOworCWNvbnN0IHN0cnVjdCBs
MngwX29mX2RhdGEgKmRhdGE7CiAJc3RydWN0IHJlc291cmNlIHJlczsKIAogCW5wID0gb2ZfZmlu
ZF9tYXRjaGluZ19ub2RlKE5VTEwsIGwyeDBfaWRzKTsKLS0gCjEuNy4xMC40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBt
YWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
