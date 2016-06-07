From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v6 2/2] drm/bridge: Add sii902x DT bindings doc
Date: Tue,  7 Jun 2016 13:59:23 +0200
Message-ID: <1465300763-19386-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1465300763-19386-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1465300763-19386-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, Meng Yi <meng.yi@nxp.com>, Xiubo Li <lixiubo@cmss.chinamobile.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Emil Velikov <emil.l.velikov@gmail.com>, Alison Wang <alison.wang@nxp.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jianwei Wang <jianwei.wang.chn@gmail.com>
List-Id: devicetree@vger.kernel.org

QWRkIFNpaTkwMjIgRFQgYmluZGluZ3MgZGVzY3JpcHRpb24uCgpTaWduZWQtb2ZmLWJ5OiBCb3Jp
cyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBmcmVlLWVsZWN0cm9ucy5jb20+CkFja2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KQ2hhbmdlcyBzaW5jZSB2MToKLSBy
ZW5hbWUgZG9jIGZpbGUKLSBzL3NpbDkwMi9zaWk5MDIvCi0tLQogLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2Uvc2lpOTAyeC50eHQgfCAzNSArKysrKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4
LnR4dAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9zaWk5MDJ4LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4LnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwLi5lOGQwZmZhCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0CkBAIC0wLDAgKzEsMzUgQEAK
K3NpaTkwMnggSERNSSBicmlkZ2UgYmluZGluZ3MKKworUmVxdWlyZWQgcHJvcGVydGllczoKKwkt
IGNvbXBhdGlibGU6ICJzaWwsc2lpOTAyMiIKKwktIHJlZzogaTJjIGFkZHJlc3Mgb2YgdGhlIGJy
aWRnZQorCS0gcmVzZXQtZ3Bpb3M6IE9GIGRldmljZS10cmVlIGdwaW8gc3BlY2lmaWNhdGlvbiBm
b3IgUlNUX04gcGluLgorCitPcHRpb25hbCBwcm9wZXJ0aWVzOgorCS0gaW50ZXJydXB0cy1leHRl
bmRlZCBvciBpbnRlcnJ1cHQtcGFyZW50ICsgaW50ZXJydXB0czogZGVzY3JpYmUKKwkgIHRoZSBp
bnRlcnJ1cHQgbGluZSB1c2VkIHRvIGluZm9ybSB0aGUgaG9zdCBhYm91dCBob3RwbHVnIGV2ZW50
cy4KKworT3B0aW9uYWwgc3Vibm9kZXM6CisJLSB2aWRlbyBpbnB1dDogdGhpcyBzdWJub2RlIGNh
biBjb250YWluIGEgdmlkZW8gaW5wdXQgcG9ydCBub2RlCisJICB0byBjb25uZWN0IHRoZSBicmlk
Z2UgdG8gYSBkaXNwbGF5IGNvbnRyb2xsZXIgb3V0cHV0IChTZWUgdGhpcworCSAgZG9jdW1lbnRh
dGlvbiBbMV0pLgorCitbMV06IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS92aWRlby1pbnRlcmZhY2VzLnR4dAorCitFeGFtcGxlOgorCWhkbWktYnJpZGdlQDM5IHsKKwkJ
Y29tcGF0aWJsZSA9ICJzaWwsc2lpOTAyMiI7CisJCXJlZyA9IDwweDM5PjsKKwkJcmVzZXQtZ3Bp
b3MgPSA8JnBpb0EgMSAwPjsKKwkJcG9ydHMgeworCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJ
CQkjc2l6ZS1jZWxscyA9IDwwPjsKKworCQkJcG9ydEAwIHsKKwkJCQlyZWcgPSA8MD47CisJCQkJ
YnJpZGdlX2luOiBlbmRwb2ludCB7CisJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZGNfb3V0PjsK
KwkJCQl9OworCQkJfTsKKwkJfTsKKwl9OwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
