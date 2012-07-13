From: y@pengutronix.de
Subject: [PATCH 11/11] gpio/gpio-omap: make platformdata used as
 of_device_id.data const
Date: Fri, 13 Jul 2012 14:32:14 +0200
Message-ID: <34295.4216794626$1342183501@news.gmane.org>
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
Cc: Linus Walleij <linus.walleij@stericsson.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, kernel@pengutronix.de, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
ClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0
cm9uaXguZGU+CkNjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQHN0ZXJpY3Nzb24uY29t
PgotLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLW9tYXAuYyB8ICAgIDYgKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3Bpby9ncGlvLW9tYXAuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLW9tYXAuYwppbmRleCAwMTlj
YjdiLi4xMmFiNTQ3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1vbWFwLmMKKysrIGIv
ZHJpdmVycy9ncGlvL2dwaW8tb21hcC5jCkBAIC0xNDMwLDE5ICsxNDMwLDE5IEBAIHN0YXRpYyBz
dHJ1Y3Qgb21hcF9ncGlvX3JlZ19vZmZzIG9tYXA0X2dwaW9fcmVncyA9IHsKIAkuZmFsbGluZ2Rl
dGVjdCA9CU9NQVA0X0dQSU9fRkFMTElOR0RFVEVDVCwKIH07CiAKLXN0YXRpYyBzdHJ1Y3Qgb21h
cF9ncGlvX3BsYXRmb3JtX2RhdGEgb21hcDJfcGRhdGEgPSB7Citjb25zdCBzdGF0aWMgc3RydWN0
IG9tYXBfZ3Bpb19wbGF0Zm9ybV9kYXRhIG9tYXAyX3BkYXRhID0gewogCS5yZWdzID0gJm9tYXAy
X2dwaW9fcmVncywKIAkuYmFua193aWR0aCA9IDMyLAogCS5kYmNrX2ZsYWcgPSBmYWxzZSwKIH07
CiAKLXN0YXRpYyBzdHJ1Y3Qgb21hcF9ncGlvX3BsYXRmb3JtX2RhdGEgb21hcDNfcGRhdGEgPSB7
Citjb25zdCBzdGF0aWMgc3RydWN0IG9tYXBfZ3Bpb19wbGF0Zm9ybV9kYXRhIG9tYXAzX3BkYXRh
ID0gewogCS5yZWdzID0gJm9tYXAyX2dwaW9fcmVncywKIAkuYmFua193aWR0aCA9IDMyLAogCS5k
YmNrX2ZsYWcgPSB0cnVlLAogfTsKIAotc3RhdGljIHN0cnVjdCBvbWFwX2dwaW9fcGxhdGZvcm1f
ZGF0YSBvbWFwNF9wZGF0YSA9IHsKK2NvbnN0IHN0YXRpYyBzdHJ1Y3Qgb21hcF9ncGlvX3BsYXRm
b3JtX2RhdGEgb21hcDRfcGRhdGEgPSB7CiAJLnJlZ3MgPSAmb21hcDRfZ3Bpb19yZWdzLAogCS5i
YW5rX3dpZHRoID0gMzIsCiAJLmRiY2tfZmxhZyA9IHRydWUsCi0tIAoxLjcuMTAuNAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
