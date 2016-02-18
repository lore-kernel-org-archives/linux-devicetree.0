From: Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH v2 3/7] QE: Add uqe_serial document to bindings
Date: Thu, 18 Feb 2016 09:06:08 +0800
Message-ID: <1455757572-44955-3-git-send-email-qiang.zhao@nxp.com>
References: <1455757572-44955-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1455757572-44955-1-git-send-email-qiang.zhao@nxp.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, oss@buserror.net, linuxppc-dev@lists.ozlabs.org, Zhao Qiang <qiang.zhao@nxp.com>
List-Id: devicetree@vger.kernel.org

QWRkIHVxZV9zZXJpYWwgZG9jdW1lbnQgdG8KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Bvd2VycGMvZnNsL2NwbV9xZS91cWVfc2VyaWFsLnR4dAoKU2lnbmVkLW9mZi1ieTogWmhh
byBRaWFuZyA8cWlhbmcuemhhb0BueHAuY29tPgotLS0KQ2hhbmdlcyBmb3IgdjIKCS0gbW9kaWZ5
IHR4L3J4LWNsb2NrLW5hbWUgc3BlY2lmaWNhdGlvbgoKIC4uLi9iaW5kaW5ncy9wb3dlcnBjL2Zz
bC9jcG1fcWUvdXFlX3NlcmlhbC50eHQgICAgICAgIHwgMTkgKysrKysrKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXJwYy9mc2wvY3BtX3FlL3VxZV9zZXJp
YWwudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bv
d2VycGMvZnNsL2NwbV9xZS91cWVfc2VyaWFsLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wb3dlcnBjL2ZzbC9jcG1fcWUvdXFlX3NlcmlhbC50eHQKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uNDM2YzcxYwotLS0gL2Rldi9udWxsCisrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlcnBjL2ZzbC9jcG1fcWUvdXFlX3Nlcmlh
bC50eHQKQEAgLTAsMCArMSwxOSBAQAorKiBTZXJpYWwKKworQ3VycmVudGx5IGRlZmluZWQgY29t
cGF0aWJsZXM6CistIHVjY191YXJ0CisKK1Byb3BlcnRpZXMgZm9yIHVjY191YXJ0OgorcG9ydC1u
dW1iZXIgOiBwb3J0IG51bWJlciBvZiBVQ0MtVUFSVAordHgvcngtY2xvY2stbmFtZSA6IHNob3Vs
ZCBiZSAiYnJnMSItImJyZzE2IiBmb3IgaW50ZXJuYWwgY2xvY2sgc291cmNlLAorCQkgICBzaG91
bGQgYmUgImNsazEiLSJjbGsyOCIgZm9yIGV4dGVybmFsIGNsb2NrIHNvdXJjZS4KKworRXhhbXBs
ZToKKworCXVjY19zZXJpYWw6IHVjY0AyMjAwIHsKKwkJZGV2aWNlX3R5cGUgPSAic2VyaWFsIjsK
KwkJY29tcGF0aWJsZSA9ICJ1Y2NfdWFydCI7CisJCXBvcnQtbnVtYmVyID0gPDE+OworCQlyeC1j
bG9jay1uYW1lID0gImJyZzIiOworCQl0eC1jbG9jay1uYW1lID0gImJyZzIiOworCX07Ci0tIAoy
LjEuMC4yNy5nOTZkYjMyNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXhwcGMtZGV2IG1haWxpbmcgbGlzdApMaW51eHBwYy1kZXZAbGlzdHMub3ps
YWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vbGludXhwcGMtZGV2
