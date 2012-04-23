From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] of: add const to struct of_device_id.data
Date: Mon, 23 Apr 2012 10:56:21 +0200
Message-ID: <1335171381-24869-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

RHJpdmVycyBzaG91bGQgbmV2ZXIgbmVlZCB0byBtb2RpZnkgdGhlIGRhdGEgb2YgYSBkZXZpY2Ug
aWQuIFNvIGl0IGNhbgpiZSBjb25zdCB3aGljaCBpbiB0dXJuIGFsbG93cyBtb3JlIGNvbnN0cyBp
biB0aGUgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCkhlbGxvLAoKdGhpcyBtaWdodCBpbnRyb2R1Y2Ug
d2FybmluZ3MgaW4gZHJpdmVycyB0aGF0IGFjY2VzcyB0aGUgZGF0YSBtZW1iZXIKd2l0aG91dCB1
c2luZyBjb25zdCwgc28gdGhpcyBpcyBkZWZpbml0bHkgbWVyZ2Ugd2luZG93IG1hdGVyaWFsIGlm
IGl0IGlzCmNvbnNpZGVyZWQgYXQgYWxsLgoKQmVzdCByZWdhcmRzClV3ZQoKIGluY2x1ZGUvbGlu
dXgvbW9kX2RldmljZXRhYmxlLmggfCAgICAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21vZF9kZXZp
Y2V0YWJsZS5oIGIvaW5jbHVkZS9saW51eC9tb2RfZGV2aWNldGFibGUuaAppbmRleCA1MDFkYTRj
Li4xODNmNDExIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oCisr
KyBiL2luY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmgKQEAgLTIyMiw3ICsyMjIsNyBAQCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkCiAJY2hhcgl0eXBlWzMyXTsKIAljaGFyCWNvbXBhdGlibGVbMTI4
XTsKICNpZmRlZiBfX0tFUk5FTF9fCi0Jdm9pZAkqZGF0YTsKKwljb25zdCB2b2lkICpkYXRhOwog
I2Vsc2UKIAlrZXJuZWxfdWxvbmdfdCBkYXRhOwogI2VuZGlmCi0tIAoxLjcuMTAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRldmljZXRyZWUtZGlzY3Vz
cyBtYWlsaW5nIGxpc3QKZGV2aWNldHJlZS1kaXNjdXNzQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6
Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2RldmljZXRyZWUtZGlzY3Vzcwo=
