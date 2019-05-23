From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v5 1/4] dt-bindings: watchdog: add Allwinner H6 watchdog
Date: Thu, 23 May 2019 17:10:47 +0200
Message-ID: <20190523151050.27302-2-peron.clem@gmail.com>
References: <20190523151050.27302-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190523151050.27302-1-peron.clem@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

QWxsd2lubmVyIEg2IGhhcyBhIHNpbWlsYXIgd2F0Y2hkb2cgYXMgdGhlIEE2NCB3aGljaCBpcyBh
bHJlYWR5CmEgY29tcGF0aWJsZSBvZiB0aGUgQTMxLgoKVGhpcyBjb21taXQgYWRkIHRoZSBINiBj
b21wYXRpYmxlLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdt
YWlsLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cv
c3VueGktd2R0LnR4dCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL3N1bnhp
LXdkdC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvc3Vu
eGktd2R0LnR4dAppbmRleCA0NjA1NTI1NGU4ZGQuLmU2NTE5OGQ4MmEyYiAxMDA2NDQKLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL3N1bnhpLXdkdC50eHQK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL3N1bnhpLXdk
dC50eHQKQEAgLTYsNiArNiw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAJImFsbHdpbm5lcixz
dW40aS1hMTAtd2R0IgogCSJhbGx3aW5uZXIsc3VuNmktYTMxLXdkdCIKIAkiYWxsd2lubmVyLHN1
bjUwaS1hNjQtd2R0IiwiYWxsd2lubmVyLHN1bjZpLWEzMS13ZHQiCisJImFsbHdpbm5lcixzdW41
MGktaDYtd2R0IiwiYWxsd2lubmVyLHN1bjZpLWEzMS13ZHQiCiAJImFsbHdpbm5lcixzdW5pdi1m
MWMxMDBzLXdkdCIsICJhbGx3aW5uZXIsc3VuNGktYTEwLXdkdCIKIC0gcmVnIDogU3BlY2lmaWVz
IGJhc2UgcGh5c2ljYWwgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUgcmVnaXN0ZXJzLgogCi0tIAoy
LjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hcm0ta2VybmVsCg==
