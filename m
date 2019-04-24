From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 0/2] Enable wm8524 codec on i.MX8MM EVK
Date: Wed, 24 Apr 2019 15:04:12 +0000
Message-ID: <20190424150350.7963-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyB0aGUgU0FJIG5vZGVzIG9uIGkuTVg4TU0gRVZL
IHRoZW4NCmNyZWF0ZXMgdGhlIHdtODUyNCBjb2RlYyBub2RlIGFuZCBmaW5hbGx5IHVzZXMgc2lt
cGxlIGNhcmQgbWFjaGluZQ0KZHJpdmVyIHRvIGNyZWF0ZSBhIHNvdW5kIGNhcmQuDQoNCkNoYW5n
ZXMgc2luY2UgdjI6DQoJLSBwbGFjZSBjb21wYXRpYmxlIHN0cmluZ3Mgb25lIGEgc2luZ2xlIGxp
bmVzDQoJLSBtb3ZlIEdQSU8gcGluY3RybCBpbiBhIG5vZGUgb2YgaXRzIG93bg0KCS0gcmVtb3Zl
IGNvZGVjIHBoYW5kbGUNCg0KQ2hhbmdlcyBzaW5jZSB2MToNCiAgICAgICAgLSB1c2UgImZzbCxp
bXg4bW0tc2FpIiwgImZzbCxpbXg4bXEtc2FpIiBjb21wYXRiaWxlIHN0cmluZ3MgYW5kDQogICAg
ICAgICAgcmVtb3ZlICJmc2wsaW14NnN4LXNhaSIgYmVjYXVzZSBTQUkgbW9kdWxlIG9uIGkuTVg4
TSBpcyBub3QNCiAgICAgICAgICBjb21wYXRiaWxlIHdpdGggU0FJIG1vZHVsZXMgZm9ybSBpLk1Y
Ng0KDQpEYW5pZWwgQmFsdXRhICgyKToNCiAgYXJtNjQ6IGR0czogaW14OG1tOiBBZGQgU0FJIG5v
ZGVzDQogIGFybTY0OiBkdHM6IGlteDhtbS1ldms6IEVuYWJsZSBhdWRpbyBjb2RlYyB3bTg1MjQN
Cg0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1ldmsuZHRzIHwgNTUgKysr
KysrKysrKysrKysrKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS5kdHNp
ICAgIHwgNjYgKysrKysrKysrKysrKysrKysrKysNCiAyIGZpbGVzIGNoYW5nZWQsIDEyMSBpbnNl
cnRpb25zKCspDQoNCi0tIA0KMi4xNy4xDQoNCg==
