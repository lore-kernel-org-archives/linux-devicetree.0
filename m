From: Akash Gajjar <akash@openedev.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: add mali gpu support on rock960
Date: Thu, 14 Mar 2019 12:48:42 +0530
Message-ID: <20190314071853.32176-3-akash@openedev.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?Andrius=20=C5=A0tikonas?= <andrius@stikonas.eu>, devicetree@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, linux-kernel@vger.kernel.org, Vicente Bergas <vicencb@gmail.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pragnesh Patel <Pragnesh_Patel@mentor.com>, Akash Gajjar <akash@openedev.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

YWRkIGdwdSBub2RlIHN1cHBvcnQgb24gYm9hcmQgYW5kIGFkZCB0aGUgc3VwcGx5aW5nIHJlZ3Vs
YXRvcgoKU2lnbmVkLW9mZi1ieTogQWthc2ggR2FqamFyIDxha2FzaEBvcGVuZWRldi5jb20+ClNp
Z25lZC1vZmYtYnk6IEFuZHJpdXMgxaB0aWtvbmFzIDxhbmRyaXVzQHN0aWtvbmFzLmV1PgotLS0K
IGFyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzk5LXJvY2s5NjAuZHRzIHwgNSArKysr
KwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzk5LXJvY2s5NjAuZHRzIGIvYXJjaC9hcm02NC9ib290
L2R0cy9yb2NrY2hpcC9yazMzOTktcm9jazk2MC5kdHMKaW5kZXggMTIyODVjNTFjY2ViLi5iYzhj
MDQxOTBkMWEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzk5
LXJvY2s5NjAuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzk5LXJv
Y2s5NjAuZHRzCkBAIC02Miw2ICs2MiwxMSBAQAogCiB9OwogCismZ3B1IHsKKwltYWxpLXN1cHBs
eSA9IDwmdmRkX2dwdT47CisJc3RhdHVzID0gIm9rYXkiOworfTsKKwogJnBjaWUwIHsKIAllcC1n
cGlvcyA9IDwmZ3BpbzIgUktfUEEyIEdQSU9fQUNUSVZFX0hJR0g+OwogfTsKLS0gCjIuMTcuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK
