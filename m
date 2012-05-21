From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] ARM: cache-l2x0: add a const qualifier
Date: Mon, 21 May 2012 21:54:06 +0200
Message-ID: <1337630046-9279-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1335171381-24869-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1335171381-24869-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

VGhpcyBpcyBvbmx5IGNvc21ldGljIGZvciBub3cuIEluIGNhc2UgdGhhdAoKCWh0dHA6Ly9taWQu
Z21hbmUub3JnLzEzMzUxNzEzODEtMjQ4NjktMS1naXQtc2VuZC1lbWFpbC11LmtsZWluZS1rb2Vu
aWdAcGVuZ3V0cm9uaXguZGUKCndpbGwgYmUgYXBwbGllZCwgaXQgZml4ZXMgYSB3YXJuaW5nCgoJ
YXJjaC9hcm0vbW0vY2FjaGUtbDJ4MC5jOiBJbiBmdW5jdGlvbiAnbDJ4MF9vZl9pbml0JzoKCWFy
Y2gvYXJtL21tL2NhY2hlLWwyeDAuYzo1NzM6Nzogd2FybmluZzogYXNzaWdubWVudCBkaXNjYXJk
cyAnY29uc3QnIHF1YWxpZmllciBmcm9tIHBvaW50ZXIgdGFyZ2V0IHR5cGUgW2VuYWJsZWQgYnkg
ZGVmYXVsdF0KCnRob3VnaC4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogYXJjaC9hcm0vbW0vY2FjaGUtbDJ4MC5j
IHwgICAgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbW0vY2FjaGUtbDJ4MC5jIGIvYXJjaC9hcm0vbW0vY2Fj
aGUtbDJ4MC5jCmluZGV4IDJhOGUzODAuLjU3N2JhZjcgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL21t
L2NhY2hlLWwyeDAuYworKysgYi9hcmNoL2FybS9tbS9jYWNoZS1sMngwLmMKQEAgLTU1NCw3ICs1
NTQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBsMngwX2lkc1tdIF9faW5p
dGNvbnN0ID0gewogaW50IF9faW5pdCBsMngwX29mX2luaXQodTMyIGF1eF92YWwsIHUzMiBhdXhf
bWFzaykKIHsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wOwotCXN0cnVjdCBsMngwX29mX2RhdGEg
KmRhdGE7CisJY29uc3Qgc3RydWN0IGwyeDBfb2ZfZGF0YSAqZGF0YTsKIAlzdHJ1Y3QgcmVzb3Vy
Y2UgcmVzOwogCiAJbnAgPSBvZl9maW5kX21hdGNoaW5nX25vZGUoTlVMTCwgbDJ4MF9pZHMpOwot
LSAKMS43LjEwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkZXZpY2V0cmVlLWRpc2N1c3MgbWFpbGluZyBsaXN0CmRldmljZXRyZWUtZGlzY3Vzc0BsaXN0
cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9kZXZpY2V0cmVl
LWRpc2N1c3MK
