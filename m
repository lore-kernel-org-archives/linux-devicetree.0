From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V2 4/4] dt-bindings: watchdog: remove i.MX system controller
 watchdog
Date: Sun, 28 Apr 2019 03:27:17 +0000
Message-ID: <1556421727-7401-4-git-send-email-Anson.Huang@nxp.com>
References: <1556421727-7401-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556421727-7401-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm->
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

aS5NWCBzeXN0ZW0gY29udHJvbGxlciB3YXRjaGRvZyBub3cgZGVwZW5kcyBvbiBTQ1UgZHJpdmVy
LCBzbyBpdA0KbmVlZHMgdG8gYmUgc3Vibm9kZSBvZiBTQ1Ugbm9kZSBpbiBEVCwgYmluZGluZyBk
b2MgaXMgbW92ZWQgdG8NCmZzbCxzY3UudHh0IGFzIHdlbGwuDQoNClNpZ25lZC1vZmYtYnk6IEFu
c29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KLS0tDQpOZXcgcGF0Y2guDQotLS0NCiAu
Li4vYmluZGluZ3Mvd2F0Y2hkb2cvZnNsLWlteC1zYy13ZHQudHh0ICAgICAgICAgICB8IDI0IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMjQgZGVsZXRpb25zKC0pDQog
ZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRj
aGRvZy9mc2wtaW14LXNjLXdkdC50eHQNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9mc2wtaW14LXNjLXdkdC50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvZnNsLWlteC1zYy13ZHQudHh0DQpkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAyYjg3ZTkuLjAwMDAwMDANCi0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9mc2wtaW14LXNjLXdkdC50eHQN
CisrKyAvZGV2L251bGwNCkBAIC0xLDI0ICswLDAgQEANCi0qIEZyZWVzY2FsZSBpLk1YIFN5c3Rl
bSBDb250cm9sbGVyIFdhdGNoZG9nDQotDQotaS5NWCBzeXN0ZW0gY29udHJvbGxlciB3YXRjaGRv
ZyBpcyBmb3IgaS5NWCBTb0NzIHdpdGggc3lzdGVtIGNvbnRyb2xsZXIgaW5zaWRlLA0KLXRoZSB3
YXRjaGRvZyBpcyBtYW5hZ2VkIGJ5IHN5c3RlbSBjb250cm9sbGVyLCB1c2VycyBjYW4gT05MWSBj
b21tdW5pY2F0ZSB3aXRoDQotc3lzdGVtIGNvbnRyb2xsZXIgZnJvbSBzZWN1cmUgbW9kZSBmb3Ig
d2F0Y2hkb2cgb3BlcmF0aW9ucywgc28gTGludXggaS5NWCBzeXN0ZW0NCi1jb250cm9sbGVyIHdh
dGNoZG9nIGRyaXZlciB3aWxsIGNhbGwgQVJNIFNNQyBBUEkgYW5kIHRyYXAgaW50byBBUk0tVHJ1
c3RlZC1GaXJtd2FyZQ0KLWZvciB3YXRjaGRvZyBvcGVyYXRpb25zLCBBUk0tVHJ1c3RlZC1GaXJt
d2FyZSBpcyBydW5uaW5nIGF0IHNlY3VyZSBFTDMgbW9kZSBhbmQNCi1pdCB3aWxsIHJlcXVlc3Qg
c3lzdGVtIGNvbnRyb2xsZXIgdG8gZXhlY3V0ZSB0aGUgd2F0Y2hkb2cgb3BlcmF0aW9uIHBhc3Nl
ZCBmcm9tDQotTGludXgga2VybmVsLg0KLQ0KLVJlcXVpcmVkIHByb3BlcnRpZXM6DQotLSBjb21w
YXRpYmxlOglTaG91bGQgYmUgOg0KLQkJImZzbCxpbXg4cXhwLXNjLXdkdCINCi0JCWZvbGxvd2Vk
IGJ5ICJmc2wsaW14LXNjLXdkdCI7DQotDQotT3B0aW9uYWwgcHJvcGVydGllczoNCi0tIHRpbWVv
dXQtc2VjIDogQ29udGFpbnMgdGhlIHdhdGNoZG9nIHRpbWVvdXQgaW4gc2Vjb25kcy4NCi0NCi1F
eGFtcGxlczoNCi0NCi13YXRjaGRvZyB7DQotCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2Mt
d2R0IiwgImZzbCxpbXgtc2Mtd2R0IjsNCi0JdGltZW91dC1zZWMgPSA8NjA+Ow0KLX07DQotLSAN
CjIuNy40DQoNCg==
