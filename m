From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 1/5] ARM: imx27: Use 'AITC' for the interrupt controller
 name
Date: Fri, 28 Jun 2013 16:50:33 +0200
Message-ID: <1372431037-13519-2-git-send-email-mpa@pengutronix.de>
References: <1372431037-13519-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1372431037-13519-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

RnJvbTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgoKT24gdGhlIE1YMjcgUmVm
ZXJlbmNlIE1hbnVhbCB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIgaXMgbmFtZWQgQUlUQzoKQVJN
OTI2RUotUyBJbnRlcnJ1cHQgQ29udHJvbGxlcgoKU28gdXNlIHRoZSBBSVRDIHRlcm0gaW5zdGVh
ZCBvZiBBVklDLgoKU2lnbmVkLW9mZi1ieTogRmFiaW8gRXN0ZXZhbSA8ZmFiaW8uZXN0ZXZhbUBm
cmVlc2NhbGUuY29tPgpPcmlnaW46IGlkOjEzMzQxOTMxMzItMTg5NDQtMi1naXQtc2VuZC1lbWFp
bC1mZXN0ZXZhbUBnbWFpbC5jb20KU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogTWFya3VzIFBhcmdt
YW5uIDxtcGFAcGVuZ3V0cm9uaXguZGU+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvaW14MjcuZHRz
aSB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDI3LmR0c2kgYi9hcmNoL2Fy
bS9ib290L2R0cy9pbXgyNy5kdHNpCmluZGV4IDA2OTUyNjQuLjg2MDM4ODYgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL2lteDI3LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14
MjcuZHRzaQpAQCAtMzAsOCArMzAsOCBAQAogCQlzcGkyID0gJmNzcGkzOwogCX07CiAKLQlhdmlj
OiBhdmljLWludGVycnVwdC1jb250cm9sbGVyQGUwMDAwMDAwIHsKLQkJY29tcGF0aWJsZSA9ICJm
c2wsaW14MjctYXZpYyIsICJmc2wsYXZpYyI7CisJYWl0YzogYWl0Yy1pbnRlcnJ1cHQtY29udHJv
bGxlckBlMDAwMDAwMCB7CisJCWNvbXBhdGlibGUgPSAiZnNsLGlteDI3LWFpdGMiLCAiZnNsLGF2
aWMiOwogCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKIAkJI2ludGVycnVwdC1jZWxscyA9IDwxPjsK
IAkJcmVnID0gPDB4MTAwNDAwMDAgMHgxMDAwPjsKQEAgLTUxLDcgKzUxLDcgQEAKIAkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47CiAJCSNzaXplLWNlbGxzID0gPDE+OwogCQljb21wYXRpYmxlID0gInNp
bXBsZS1idXMiOwotCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZhdmljPjsKKwkJaW50ZXJydXB0LXBh
cmVudCA9IDwmYWl0Yz47CiAJCXJhbmdlczsKIAogCQlhaXBpQDEwMDAwMDAwIHsgLyogQUlQSTEg
Ki8KLS0gCjEuOC4yLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRldmljZXRyZWUtZGlzY3VzcyBtYWlsaW5nIGxpc3QKZGV2aWNldHJlZS1kaXNjdXNz
QGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2Rldmlj
ZXRyZWUtZGlzY3Vzcwo=
