From: Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH v3 3/7] QE: Add uqe_serial document to bindings
Date: Tue, 1 Mar 2016 15:09:39 +0800
Message-ID: <1456816183-22340-3-git-send-email-qiang.zhao@nxp.com>
References: <1456816183-22340-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1456816183-22340-1-git-send-email-qiang.zhao@nxp.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xiaobo.xie@nxp.com, oss@buserror.net, leoyang.li@nxp.com, linuxppc-dev@lists.ozlabs.org, Zhao Qiang <qiang.zhao@nxp.com>
List-Id: devicetree@vger.kernel.org

QWRkIHVxZV9zZXJpYWwgZG9jdW1lbnQgdG8KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Bvd2VycGMvZnNsL2NwbV9xZS91cWVfc2VyaWFsLnR4dAoKU2lnbmVkLW9mZi1ieTogWmhh
byBRaWFuZyA8cWlhbmcuemhhb0BueHAuY29tPgotLS0KQ2hhbmdlcyBmb3IgdjIKCS0gbW9kaWZ5
IHR4L3J4LWNsb2NrLW5hbWUgc3BlY2lmaWNhdGlvbgpDaGFuZ2VzIGZvciB2MgoJLSBOQSAKCiAu
Li4vYmluZGluZ3MvcG93ZXJwYy9mc2wvY3BtX3FlL3VxZV9zZXJpYWwudHh0ICAgICAgICB8IDE5
ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCiBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2Vy
cGMvZnNsL2NwbV9xZS91cWVfc2VyaWFsLnR4dAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlcnBjL2ZzbC9jcG1fcWUvdXFlX3NlcmlhbC50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXJwYy9mc2wvY3BtX3FlL3VxZV9z
ZXJpYWwudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjQzNmM3MWMKLS0t
IC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXJw
Yy9mc2wvY3BtX3FlL3VxZV9zZXJpYWwudHh0CkBAIC0wLDAgKzEsMTkgQEAKKyogU2VyaWFsCisK
K0N1cnJlbnRseSBkZWZpbmVkIGNvbXBhdGlibGVzOgorLSB1Y2NfdWFydAorCitQcm9wZXJ0aWVz
IGZvciB1Y2NfdWFydDoKK3BvcnQtbnVtYmVyIDogcG9ydCBudW1iZXIgb2YgVUNDLVVBUlQKK3R4
L3J4LWNsb2NrLW5hbWUgOiBzaG91bGQgYmUgImJyZzEiLSJicmcxNiIgZm9yIGludGVybmFsIGNs
b2NrIHNvdXJjZSwKKwkJICAgc2hvdWxkIGJlICJjbGsxIi0iY2xrMjgiIGZvciBleHRlcm5hbCBj
bG9jayBzb3VyY2UuCisKK0V4YW1wbGU6CisKKwl1Y2Nfc2VyaWFsOiB1Y2NAMjIwMCB7CisJCWRl
dmljZV90eXBlID0gInNlcmlhbCI7CisJCWNvbXBhdGlibGUgPSAidWNjX3VhcnQiOworCQlwb3J0
LW51bWJlciA9IDwxPjsKKwkJcngtY2xvY2stbmFtZSA9ICJicmcyIjsKKwkJdHgtY2xvY2stbmFt
ZSA9ICJicmcyIjsKKwl9OwotLSAKMi4xLjAuMjcuZzk2ZGIzMjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4cHBjLWRldiBtYWlsaW5nIGxpc3QK
TGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xp
c3RpbmZvL2xpbnV4cHBjLWRldg==
