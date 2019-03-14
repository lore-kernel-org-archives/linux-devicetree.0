From: Akash Gajjar <akash@openedev.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: add mali gpu support on rockpi4
Date: Thu, 14 Mar 2019 12:48:41 +0530
Message-ID: <20190314071853.32176-2-akash@openedev.com>
References: <20190314071853.32176-1-akash@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190314071853.32176-1-akash@openedev.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: heiko@sntech.de
Cc: Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?Andrius=20=C5=A0tikonas?= <andrius@stikonas.eu>, devicetree@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, linux-kernel@vger.kernel.org, Vicente Bergas <vicencb@gmail.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Klaus Goger <klaus.goger@theobroma-systems.com>, Akash Gajjar <akash@openedev.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

YWRkIGdwdSBub2RlIHN1cHBvcnQgb24gYm9hcmQgYW5kIGFkZCB0aGUgc3VwcGx5aW5nIHJlZ3Vs
YXRvcgoKU2lnbmVkLW9mZi1ieTogQWthc2ggR2FqamFyIDxha2FzaEBvcGVuZWRldi5jb20+ClNp
Z25lZC1vZmYtYnk6IEFuZHJpdXMgxaB0aWtvbmFzIDxhbmRyaXVzQHN0aWtvbmFzLmV1PgotLS0K
IGFyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzk5LXJvY2stcGktNC5kdHMgfCA1ICsr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMzOTktcm9jay1waS00LmR0cyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcm9ja2NoaXAvcmszMzk5LXJvY2stcGktNC5kdHMKaW5kZXggNGE1NDNmMjExN2Q0
Li4xZTQ3OWQwNmU2N2UgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAv
cmszMzk5LXJvY2stcGktNC5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9y
azMzOTktcm9jay1waS00LmR0cwpAQCAtMTU3LDYgKzE1NywxMSBAQAogCXN0YXR1cyA9ICJva2F5
IjsKIH07CiAKKyZncHUgeworCW1hbGktc3VwcGx5ID0gPCZ2ZGRfZ3B1PjsKKwlzdGF0dXMgPSAi
b2theSI7Cit9OworCiAmaGRtaSB7CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKIAlwaW5j
dHJsLTAgPSA8JmhkbWlfY2VjPjsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cmxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
