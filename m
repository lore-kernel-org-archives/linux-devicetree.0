From: Jan Tuerk <jan.tuerk@emtrion.com>
Subject: [PATCH v8 2/4] dt-bindings: arm: Document emtrion emCON-MX6 bindings
Date: Tue, 27 Nov 2018 16:04:02 +0100
Message-ID: <20181127150407.15098-2-jan.tuerk@emtrion.com>
References: <20180829100811.55836-1-jan.tuerk@emtrion.com>
 <20181127150407.15098-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181127150407.15098-1-jan.tuerk@emtrion.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Russell King <linux@armlinux.org.uk>, "GitAuthor: Jan Tuerk" <jan.tuerk@emtrion.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RG9jdW1lbnQgdGhlIGNvbXBhdGlibGUgc3RyaW5ncyBmb3IgZW10cmlvbiBlbUNPTi1NWDYgU29N
J3MuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gVHVlcmsgPGphbi50dWVya0BlbXRyaW9uLmNvbT4KUmV2
aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9lbXRyaW9uLnR4dCB8IDEyICsrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2VtdHJpb24udHh0CgpVbmNoYW5nZWQg
c2luY2UgdjYgKHJlYmFzZWQpCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9lbXRyaW9uLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vZW10cmlvbi50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MDAwLi44MzMyOWFlZmM0ODMKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL2VtdHJpb24udHh0CkBAIC0wLDAgKzEsMTIgQEAKK0VtdHJpb24g
RGV2aWNldHJlZSBCaW5kaW5ncworPT09PT09PT09PT09PT09PT09PT09PT09PT09CisKK2VtQ09O
IFNlcmllczoKKy0tLS0tLS0tLS0tLS0KKworUmVxdWlyZWQgcm9vdCBub2RlIHByb3BlcnRpZXMK
KwktIGNvbXBhdGlibGU6CisJLSAiZW10cmlvbixlbWNvbi1teDYiLCAiZnNsLGlteDZxIjsgCQk6
IGVtQ09OLU1YNkQgb3IgZW1DT04tTVg2USBTb00KKwktICJlbXRyaW9uLGVtY29uLW14Ni1hdmFy
aSIsICJmc2wsaW14NnEiOwk6IGVtQ09OLU1YNkQgb3IgZW1DT04tTVg2USBTb00gb24gQXZhcmkg
QmFzZQorCS0gImVtdHJpb24sZW1jb24tbXg2IiwgImZzbCxpbXg2ZGwiOyAJCTogZW1DT04tTVg2
UyBvciBlbUNPTi1NWDZETCBTb00KKwktICJlbXRyaW9uLGVtY29uLW14Ni1hdmFyaSIsICJmc2ws
aW14NmRsIjsJOiBlbUNPTi1NWDZTIG9yIGVtQ09OLU1YNkRMIFNvTSBvbiBBdmFyaSBCYXNlCi0t
IAplbXRyaW9uIEdtYkgKQWx0ZXIgU2NobGFjaHRob2YgNDUKNzYxMzEgS2FybHNydWhlCkdFUk1B
TlkKaHR0cHM6Ly93d3cuZW10cmlvbi5kZQoKQW10c2dlcmljaHQgTWFubmhlaW0KSFJCIDExMCAz
MDAKR2VzY2jDpGZ0c2bDvGhyZXI6IERpZXRlciBCYXVyLCBSYW1vbmEgTWF1cmVyCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5l
bCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
