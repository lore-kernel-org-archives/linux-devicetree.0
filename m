From: y@pengutronix.de
Subject: [PATCH 10/11] of: add const to struct of_device_id.data
Date: Fri, 13 Jul 2012 14:32:13 +0200
Message-ID: <35368.2079040029$1342184066@news.gmane.org>
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
Cc: devicetree-discuss@lists.ozlabs.org, Greg Kroah-Hartman <gregkh@suse.de>, Rob Herring <rob.herring@calxeda.com>, kernel@pengutronix.de, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
CkRyaXZlcnMgc2hvdWxkIG5ldmVyIG5lZWQgdG8gbW9kaWZ5IHRoZSBkYXRhIG9mIGEgZGV2aWNl
IGlkLiBTbyBpdCBjYW4KYmUgY29uc3Qgd2hpY2ggaW4gdHVybiBhbGxvd3MgbW9yZSBjb25zdHMg
aW4gdGhlIGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBz
dXNlLmRlPgotLS0KIGluY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmggfCAgICAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oIGIvaW5jbHVkZS9saW51eC9tb2RfZGV2
aWNldGFibGUuaAppbmRleCA1ZGI5MzgyLi45OGZiM2ZlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xp
bnV4L21vZF9kZXZpY2V0YWJsZS5oCisrKyBiL2luY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxl
LmgKQEAgLTIyNCw3ICsyMjQsNyBAQCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkCiAJY2hhcgl0eXBlWzMy
XTsKIAljaGFyCWNvbXBhdGlibGVbMTI4XTsKICNpZmRlZiBfX0tFUk5FTF9fCi0Jdm9pZAkqZGF0
YTsKKwljb25zdCB2b2lkICpkYXRhOwogI2Vsc2UKIAlrZXJuZWxfdWxvbmdfdCBkYXRhOwogI2Vu
ZGlmCi0tIAoxLjcuMTAuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
