From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v4 13/13] ARM: dts: rockchip: add support mipi panel
 tv080wum-nl0 for rk3288-evb
Date: Fri, 20 Nov 2015 16:15:39 +0800
Message-ID: <1448007339-10966-14-git-send-email-zyw@rock-chips.com>
References: <1448007339-10966-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1448007339-10966-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: heiko@sntech.de, linux-rockchip@lists.infradead.org, mark.yao@rock-chips.com, treding@nvidia.com, emil.l.velikov@gmail.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Chris Zhong <zyw@rock-chips.com>, rmk+kernel@arm.linux.org.uk, ajaykumar.rs@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhpcyB0djA4MHd1bS1ubDAgcGFuZWwgaXMgYSBtaXBpIHBhbmVsLCBpdCBjYW4gdXNlIGluIE1J
UElfVFggc29ja2V0Cm9mIHJrMzI4OCBldmIgYm9hcmQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBa
aG9uZyA8enl3QHJvY2stY2hpcHMuY29tPgoKLS0tCgpDaGFuZ2VzIGluIHY0OiBOb25lCkNoYW5n
ZXMgaW4gdjM6IE5vbmUKQ2hhbmdlcyBpbiB2MjogTm9uZQoKIGFyY2gvYXJtL2Jvb3QvZHRzL3Jr
MzI4OC1ldmIuZHRzaSB8IDIwICsrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
MTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3JrMzI4OC1ldmIuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC1ldmIuZHRz
aQppbmRleCBmNmQyZTc4Li5kMDQ4NzhmIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9y
azMyODgtZXZiLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LWV2Yi5kdHNpCkBA
IC00Nyw3ICs0Nyw3IEBACiAJCXJlZyA9IDwweDAgMHg4MDAwMDAwMD47CiAJfTsKIAotCWJhY2ts
aWdodCB7CisJYmFja2xpZ2h0OiBiYWNrbGlnaHQgewogCQljb21wYXRpYmxlID0gInB3bS1iYWNr
bGlnaHQiOwogCQlicmlnaHRuZXNzLWxldmVscyA9IDwKIAkJCSAgMCAgIDEgICAyICAgMyAgIDQg
ICA1ICAgNiAgIDcKQEAgLTE3Nyw2ICsxNzcsMjEgQEAKIAlzdGF0dXMgPSAib2theSI7CiB9Owog
CismbWlwaV9kc2kgeworCXN0YXR1cyA9ICJva2F5IjsKKworCXBhbmVsIHsKKwkJY29tcGF0aWJs
ZSA9ImJvZSx0djA4MHd1bS1ubDAiOworCQlyZWcgPSA8MD47CisKKwkJZW5hYmxlLWdwaW9zID0g
PCZncGlvNyAzIEdQSU9fQUNUSVZFX0hJR0g+OworCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
OworCQlwaW5jdHJsLTAgPSA8JmxjZF9lbj47CisJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsK
KwkJc3RhdHVzID0gIm9rYXkiOworCX07Cit9OworCiAmc2RtbWMgewogCWJ1cy13aWR0aCA9IDw0
PjsKIAljYXAtbW1jLWhpZ2hzcGVlZDsKQEAgLTI0Nyw2ICsyNjIsOSBAQAogCQlibF9lbjogYmwt
ZW4gewogCQkJcm9ja2NoaXAscGlucyA9IDw3IDIgUktfRlVOQ19HUElPICZwY2ZnX3B1bGxfbm9u
ZT47CiAJCX07CisJCWxjZF9lbjogbGNkLWVuIHsKKwkJCXJvY2tjaGlwLHBpbnMgPSA8NyAzIFJL
X0ZVTkNfR1BJTyAmcGNmZ19wdWxsX25vbmU+OworCQl9OwogCX07CiAKIAlidXR0b25zIHsKLS0g
CjIuNi4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
