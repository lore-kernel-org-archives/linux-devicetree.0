From: matthias.bgg@kernel.org
Subject: [PATCH v5 07/12] dt-bindings: clock: mediatek: delete mmsys clocks
Date: Fri, 16 Nov 2018 13:54:44 +0100
Message-ID: <20181116125449.23581-8-matthias.bgg@kernel.org>
References: <20181116125449.23581-1-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181116125449.23581-1-matthias.bgg@kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com, sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, rdunlap@infradead.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sean.wang@kernel.org, wens@csie.org, Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+CgpTb21lIFNvQ3Mgd2ls
bCBub3cgbG9hZCB0aGUgY2xvY2sgcGFydCBvZiBtbXN5cyB2aWEKYSBwbGF0Zm9ybSBkZXZpY2Ug
ZnJvbSB0aGUgZHNpcGxheSBkcml2ZXIuClJlbW92ZSB0aGUgY29tcGF0aWJsZSBmcm9tIHRoZSBj
bG9jayBiaW5kaW5ncyBkZXNjcmlwdGlvbi4KClNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEJydWdn
ZXIgPG1icnVnZ2VyQHN1c2UuY29tPgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9t
ZWRpYXRlay9tZWRpYXRlayxtbXN5cy50eHQgICAgICAgIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy50eHQKaW5kZXgg
MTVkOTc3YWZhZDMxLi40NDY4MzQ1ZjhiMWEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMudHh0CisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1z
eXMudHh0CkBAIC02LDExICs2LDggQEAgVGhlIE1lZGlhdGVrIG1tc3lzIGNvbnRyb2xsZXIgcHJv
dmlkZXMgdmFyaW91cyBjbG9ja3MgdG8gdGhlIHN5c3RlbS4KIFJlcXVpcmVkIFByb3BlcnRpZXM6
CiAKIC0gY29tcGF0aWJsZTogU2hvdWxkIGJlIG9uZSBvZjoKLQktICJtZWRpYXRlayxtdDI3MDEt
bW1zeXMiLCAic3lzY29uIgogCS0gIm1lZGlhdGVrLG10MjcxMi1tbXN5cyIsICJzeXNjb24iCiAJ
LSAibWVkaWF0ZWssbXQ2Nzk3LW1tc3lzIiwgInN5c2NvbiIKLQktICJtZWRpYXRlayxtdDc2MjMt
bW1zeXMiLCAibWVkaWF0ZWssbXQyNzAxLW1tc3lzIiwgInN5c2NvbiIKLQktICJtZWRpYXRlayxt
dDgxNzMtbW1zeXMiLCAic3lzY29uIgogLSAjY2xvY2stY2VsbHM6IE11c3QgYmUgMQogCiBUaGUg
bW1zeXMgY29udHJvbGxlciB1c2VzIHRoZSBjb21tb24gY2xrIGJpbmRpbmcgZnJvbQotLSAKMi4x
OS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
