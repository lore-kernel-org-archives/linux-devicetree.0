From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 1/7] dt-bindings: arm64: allwinner: h6: Add binding for DMA
 controller
Date: Sat, 25 May 2019 18:38:13 +0200
Message-ID: <20190525163819.21055-2-peron.clem@gmail.com>
References: <20190525163819.21055-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190525163819.21055-1-peron.clem@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Dan Williams <dan.j.williams@intel.com>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0PgoKRE1BIGluIEg2
IGlzIHNpbWlsYXIgdG8gb3RoZXIgRE1BIGNvbnRyb2xsZXIsIGV4Y2VwdCBpdCBpcyBmaXJzdCB3
aGljaApzdXBwb3J0cyBtb3JlIHRoYW4gMzIgcmVxdWVzdCBzb3VyY2VzIGFuZCBoYXMgMTYgY2hh
bm5lbHMuIEl0IGFsc28gbmVlZHMKYWRkaXRpb25hbCBjbG9jayB0byBiZSBlbmFibGVkLgoKU2ln
bmVkLW9mZi1ieTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0PgpSZXZp
ZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZG1hL3N1bjZpLWRtYS50eHQgfCA5ICsrKysrKystLQogMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL3N1bjZpLWRtYS50eHQgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL3N1bjZpLWRtYS50eHQKaW5kZXggN2Zj
Y2MyMGQ4MzMxLi5jYWUzMWY0ZTc3YmEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kbWEvc3VuNmktZG1hLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZG1hL3N1bjZpLWRtYS50eHQKQEAgLTI4LDEyICsyOCwxNyBAQCBFeGFt
cGxlOgogCX07CiAKIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQotRm9yIEE2NCBETUEgY29udHJvbGxl
cjoKK0ZvciBBNjQgYW5kIEg2IERNQSBjb250cm9sbGVyOgogCiBSZXF1aXJlZCBwcm9wZXJ0aWVz
OgotLSBjb21wYXRpYmxlOgkiYWxsd2lubmVyLHN1bjUwaS1hNjQtZG1hIgorLSBjb21wYXRpYmxl
OglNdXN0IGJlIG9uZSBvZgorCQkgICJhbGx3aW5uZXIsc3VuNTBpLWE2NC1kbWEiCisJCSAgImFs
bHdpbm5lcixzdW41MGktaDYtZG1hIgogLSBkbWEtY2hhbm5lbHM6IE51bWJlciBvZiBETUEgY2hh
bm5lbHMgc3VwcG9ydGVkIGJ5IHRoZSBjb250cm9sbGVyLgogCQlSZWZlciB0byBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2RtYS50eHQKKy0gY2xvY2tzOglJbiBhZGRpdGlv
biB0byBwYXJlbnQgQUhCIGNsb2NrLCBpdCBzaG91bGQgYWxzbyBjb250YWluIG1idXMKKwkJY2xv
Y2sgKEg2IG9ubHkpCistIGNsb2NrLW5hbWVzOglTaG91bGQgY29udGFpbiAiYnVzIiBhbmQgIm1i
dXMiIChINiBvbmx5KQogLSBhbGwgcHJvcGVydGllcyBhYm92ZSwgaS5lLiByZWcsIGludGVycnVw
dHMsIGNsb2NrcywgcmVzZXRzIGFuZCAjZG1hLWNlbGxzCiAKIE9wdGlvbmFsIHByb3BlcnRpZXM6
Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==
