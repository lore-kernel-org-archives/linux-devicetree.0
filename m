From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 01/10] mtd: mxc_nand: set owner field to prevent module
 unloading when in use
Date: Mon, 23 Apr 2012 11:23:33 +0200
Message-ID: <1335173022-22371-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20120423092240.GA18013@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120423092240.GA18013-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRy
b25peC5kZT4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL214Y19uYW5kLmMgfCAgICAxICsKIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
bXhjX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvbXhjX25hbmQuYwppbmRleCBjYzA2NzhhLi43
ZDgyY2M0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL214Y19uYW5kLmMKKysrIGIvZHJp
dmVycy9tdGQvbmFuZC9teGNfbmFuZC5jCkBAIC0xMjc1LDYgKzEyNzUsNyBAQCBzdGF0aWMgaW50
IF9fZGV2ZXhpdCBteGNuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHN0
YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG14Y25kX2RyaXZlciA9IHsKIAkuZHJpdmVyID0g
ewogCQkgICAubmFtZSA9IERSSVZFUl9OQU1FLAorCQkgICAub3duZXIgPSBUSElTX01PRFVMRSwK
IAl9LAogCS5yZW1vdmUgPSBfX2RldmV4aXRfcChteGNuZF9yZW1vdmUpLAogfTsKLS0gCjEuNy4x
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZGV2aWNl
dHJlZS1kaXNjdXNzIG1haWxpbmcgbGlzdApkZXZpY2V0cmVlLWRpc2N1c3NAbGlzdHMub3psYWJz
Lm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vZGV2aWNldHJlZS1kaXNjdXNz
Cg==
