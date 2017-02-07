From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 1/3] dt-bindings: Document the dmas and dma-names properties
 for VC4 HDMI
Date: Tue,  7 Feb 2017 13:07:01 -0800
Message-ID: <20170207210703.7082-1-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AZnJlZS1lbGVjdHJvbnMuY29t
PgoKVGhlc2UgYXJlIG9wdGlvbmFsLCBidXQgbmVjZXNzYXJ5IGZvciBIRE1JIGF1ZGlvIHN1cHBv
cnQuCgpTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBmcmVl
LWVsZWN0cm9ucy5jb20+ClNpZ25lZC1vZmYtYnk6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5u
ZXQ+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJjbSxi
Y20tdmM0LnR4dCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJjbSxi
Y20tdmM0LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
Y20sYmNtLXZjNC50eHQKaW5kZXggMzRjN2ZkZGNlYTM5Li5jYTAyZDNlNGRiOTEgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyY20sYmNtLXZj
NC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJj
bSxiY20tdmM0LnR4dApAQCAtMzQsNiArMzQsOSBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzIGZvciBI
RE1JOgogLSBocGQtZ3Bpb3M6CVRoZSBHUElPIHBpbiBmb3IgSERNSSBob3RwbHVnIGRldGVjdCAo
aWYgaXQgZG9lc24ndCBhcHBlYXIKIAkJICBhcyBhbiBpbnRlcnJ1cHQvc3RhdHVzIGJpdCBpbiB0
aGUgSERNSSBjb250cm9sbGVyCiAJCSAgaXRzZWxmKS4gIFNlZSBiaW5kaW5ncy9waW5jdHJsL2Jy
Y20sYmNtMjgzNS1ncGlvLnR4dAorLSBkbWFzOgkJU2hvdWxkIGNvbnRhaW4gb25lIGVudHJ5IHBv
aW50aW5nIHRvIHRoZSBETUEgY2hhbm5lbCB1c2VkIHRvCisJCXRyYW5zZmVyIGF1ZGlvIGRhdGEK
Ky0gZG1hLW5hbWVzOglTaG91bGQgY29udGFpbiAiYXVkaW8tcngiCiAKIFJlcXVpcmVkIHByb3Bl
cnRpZXMgZm9yIERQSToKIC0gY29tcGF0aWJsZToJU2hvdWxkIGJlICJicmNtLGJjbTI4MzUtZHBp
IgotLSAKMi4xMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
