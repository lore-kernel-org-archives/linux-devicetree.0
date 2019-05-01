From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH v2 1/6] soc/fsl/qe: qe.c: drop useless static qualifier
Date: Wed, 1 May 2019 09:29:03 +0000
Message-ID: <20190501092841.9026-2-rasmus.villemoes@prevas.dk>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Scott Wood <oss@buserror.net>, Christophe Leroy <christophe.leroy@c-s.fr>, Mark Rutland <mark.rutland@arm.com>, Rasmus Villemoes <Rasmus.Villemoes@prevas.se>
List-Id: devicetree@vger.kernel.org

VGhlIGxvY2FsIHZhcmlhYmxlIHNudW1faW5pdCBoYXMgbm8gcmVhc29uIHRvIGhhdmUgc3RhdGlj
IHN0b3JhZ2UgZHVyYXRpb24uDQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGMtcy5mcj4NClNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxsZW1vZXMgPHJh
c211cy52aWxsZW1vZXNAcHJldmFzLmRrPg0KLS0tDQogZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMg
fCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9mc2wvcWUvcWUuYyBiL2RyaXZlcnMvc29jL2ZzbC9x
ZS9xZS5jDQppbmRleCA2MTJkOWM1NTFiZTUuLjg1NTM3M2RlYjc0NiAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvc29jL2ZzbC9xZS9xZS5jDQorKysgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcWUuYw0KQEAg
LTMwNiw3ICszMDYsNyBAQCBzdGF0aWMgdm9pZCBxZV9zbnVtc19pbml0KHZvaWQpDQogCQkweDI4
LCAweDI5LCAweDM4LCAweDM5LCAweDQ4LCAweDQ5LCAweDU4LCAweDU5LA0KIAkJMHg2OCwgMHg2
OSwgMHg3OCwgMHg3OSwgMHg4MCwgMHg4MSwNCiAJfTsNCi0Jc3RhdGljIGNvbnN0IHU4ICpzbnVt
X2luaXQ7DQorCWNvbnN0IHU4ICpzbnVtX2luaXQ7DQogDQogCXFlX251bV9vZl9zbnVtID0gcWVf
Z2V0X251bV9vZl9zbnVtcygpOw0KIA0KLS0gDQoyLjIwLjENCg0K
