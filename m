From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [RESEND PATCH v3 0/2] Enable wm8524 codec on i.MX8MM EVK
Date: Wed, 8 May 2019 07:10:54 +0000
Message-ID: <20190508071032.31808-1-daniel.baluta@nxp.com>
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
ZXMgc2luY2UgdjI6DQogICAgICAgLSBwbGFjZSBjb21wYXRpYmxlIHN0cmluZ3Mgb25lIGEgc2lu
Z2xlIGxpbmVzDQogICAgICAgLSBtb3ZlIEdQSU8gcGluY3RybCBpbiBhIG5vZGUgb2YgaXRzIG93
bg0KICAgICAgIC0gcmVtb3ZlIGNvZGVjIHBoYW5kbGUNCg0KQ2hhbmdlcyBzaW5jZSB2MToNCiAg
ICAgICAgLSB1c2UgImZzbCxpbXg4bW0tc2FpIiwgImZzbCxpbXg4bXEtc2FpIiBjb21wYXRiaWxl
IHN0cmluZ3MgYW5kDQogICAgICAgICAgcmVtb3ZlICJmc2wsaW14NnN4LXNhaSIgYmVjYXVzZSBT
QUkgbW9kdWxlIG9uIGkuTVg4TSBpcyBub3QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQog
ICAgICAgICAgY29tcGF0YmlsZSB3aXRoIFNBSSBtb2R1bGVzIGZvcm0gaS5NWDYNCg0KRGFuaWVs
IEJhbHV0YSAoMik6DQogIGFybTY0OiBkdHM6IGlteDhtbTogQWRkIFNBSSBub2Rlcw0KICBhcm02
NDogZHRzOiBpbXg4bW0tZXZrOiBFbmFibGUgYXVkaW8gY29kZWMgd204NTI0DQoNCiBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tZXZrLmR0cyB8IDU1ICsrKysrKysrKysrKysr
KysNCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0uZHRzaSAgICB8IDY2ICsr
KysrKysrKysrKysrKysrKysrDQogMiBmaWxlcyBjaGFuZ2VkLCAxMjEgaW5zZXJ0aW9ucygrKQ0K
DQotLSANCjIuMTcuMQ0KDQo=
