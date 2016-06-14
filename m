From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v8 2/2] drm/bridge: Add sii902x DT bindings doc
Date: Tue, 14 Jun 2016 09:42:22 +0200
Message-ID: <1465890142-14464-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1465890142-14464-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1465890142-14464-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Meng Yi <meng.yi@nxp.com>, Xiubo Li <lixiubo@cmss.chinamobile.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Emil Velikov <emil.l.velikov@gmail.com>, Alison Wang <alison.wang@nxp.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jianwei Wang <jianwei.wang.chn@gmail.com>
List-Id: devicetree@vger.kernel.org

QWRkIFNpaTkwMjIgRFQgYmluZGluZ3MgZGVzY3JpcHRpb24uCgpTaWduZWQtb2ZmLWJ5OiBCb3Jp
cyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBmcmVlLWVsZWN0cm9ucy5jb20+CkFja2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KQ2hhbmdlcyBzaW5jZSB2NjoKLSBt
YWtlICdyZXNldC1ncGlvcycgb3B0aW9uYWwKCkNoYW5nZXMgc2luY2UgdjE6Ci0gcmVuYW1lIGRv
YyBmaWxlCi0gcy9zaWw5MDIvc2lpOTAyLwotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL3NpaTkwMngudHh0IHwgMzUgKysrKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uvc2lpOTAyeC50eHQKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2Uvc2lpOTAyeC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2Uvc2lpOTAyeC50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4u
NTZhM2U2OAotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4LnR4dApAQCAtMCwwICsxLDM1IEBACitzaWk5MDJ4
IEhETUkgYnJpZGdlIGJpbmRpbmdzCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CisJLSBjb21wYXRp
YmxlOiAic2lsLHNpaTkwMjIiCisJLSByZWc6IGkyYyBhZGRyZXNzIG9mIHRoZSBicmlkZ2UKKwor
T3B0aW9uYWwgcHJvcGVydGllczoKKwktIGludGVycnVwdHMtZXh0ZW5kZWQgb3IgaW50ZXJydXB0
LXBhcmVudCArIGludGVycnVwdHM6IGRlc2NyaWJlCisJICB0aGUgaW50ZXJydXB0IGxpbmUgdXNl
ZCB0byBpbmZvcm0gdGhlIGhvc3QgYWJvdXQgaG90cGx1ZyBldmVudHMuCisJLSByZXNldC1ncGlv
czogT0YgZGV2aWNlLXRyZWUgZ3BpbyBzcGVjaWZpY2F0aW9uIGZvciBSU1RfTiBwaW4uCisKK09w
dGlvbmFsIHN1Ym5vZGVzOgorCS0gdmlkZW8gaW5wdXQ6IHRoaXMgc3Vibm9kZSBjYW4gY29udGFp
biBhIHZpZGVvIGlucHV0IHBvcnQgbm9kZQorCSAgdG8gY29ubmVjdCB0aGUgYnJpZGdlIHRvIGEg
ZGlzcGxheSBjb250cm9sbGVyIG91dHB1dCAoU2VlIHRoaXMKKwkgIGRvY3VtZW50YXRpb24gWzFd
KS4KKworWzFdOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8t
aW50ZXJmYWNlcy50eHQKKworRXhhbXBsZToKKwloZG1pLWJyaWRnZUAzOSB7CisJCWNvbXBhdGli
bGUgPSAic2lsLHNpaTkwMjIiOworCQlyZWcgPSA8MHgzOT47CisJCXJlc2V0LWdwaW9zID0gPCZw
aW9BIDEgMD47CisJCXBvcnRzIHsKKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJI3NpemUt
Y2VsbHMgPSA8MD47CisKKwkJCXBvcnRAMCB7CisJCQkJcmVnID0gPDA+OworCQkJCWJyaWRnZV9p
bjogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRjX291dD47CisJCQkJfTsK
KwkJCX07CisJCX07CisJfTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
