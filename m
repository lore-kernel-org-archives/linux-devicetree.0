From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v5 4/5] ARM: multi_v7: enable VGA bridge
Date: Fri, 30 Sep 2016 16:37:08 +0200
Message-ID: <20160930143709.1388-5-maxime.ripard@free-electrons.com>
References: <20160930143709.1388-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160930143709.1388-1-maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Archit Taneja <architt@codeaurora.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RW5hYmxlIHRoZSBSR0IgdG8gVkdBIGJyaWRnZSBkcml2ZXIgaW4gdGhlIGRlZmNvbmZpZwoKU2ln
bmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5j
b20+Ci0tLQogYXJjaC9hcm0vY29uZmlncy9tdWx0aV92N19kZWZjb25maWcgfCAxICsKIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3Mv
bXVsdGlfdjdfZGVmY29uZmlnIGIvYXJjaC9hcm0vY29uZmlncy9tdWx0aV92N19kZWZjb25maWcK
aW5kZXggMmM4NjY1Y2Q5ZGM1Li4yMmVmNDFhZmM2NTggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Nv
bmZpZ3MvbXVsdGlfdjdfZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdf
ZGVmY29uZmlnCkBAIC01NjcsNiArNTY3LDcgQEAgQ09ORklHX0RSTT15CiBDT05GSUdfRFJNX0ky
Q19BRFY3NTExPW0KICMgQ09ORklHX0RSTV9JMkNfQ0g3MDA2IGlzIG5vdCBzZXQKICMgQ09ORklH
X0RSTV9JMkNfU0lMMTY0IGlzIG5vdCBzZXQKK0NPTkZJR19EUk1fUkdCX1RPX1ZHQT1tCiBDT05G
SUdfRFJNX05YUF9QVE4zNDYwPW0KIENPTkZJR19EUk1fUEFSQURFX1BTODYyMj1tCiBDT05GSUdf
RFJNX05PVVZFQVU9bQotLSAKMi45LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
