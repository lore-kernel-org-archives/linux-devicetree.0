From: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Missing 'assigned-clocks' in usdhc node of i.MX8MQ/MM/MN dtsi?
Date: Thu, 19 Sep 2019 09:56:51 +0000
Message-ID: <e6ce599e-597a-6f67-d5d1-5487f50c7d0d@kontron.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <000AF8B8BF44EA4F81E89ED1E2CF7D13@snt-world.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "leonard.crestez@nxp.com" <leonard.crestez@nxp.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "ping.bai@nxp.com" <ping.bai@nxp.com>, "daniel.baluta@nxp.com" <daniel.baluta@nxp.com>, "jun.li@nxp.com" <jun.li@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "abel.vesa@nxp.com" <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "angus@akkea.ca" <angus@akkea.ca>, "ccaione@baylibre.com" <ccaione@baylibre.com>, agx@sigx
List-Id: devicetree@vger.kernel.org

SGksDQoNCkkgd29uZGVyIHdoeSBpbXg4bXEuZHRzaSwgaW14OG1tLmR0c2kgYW5kIGlteDhtbi5k
dHNpIGhhdmUgDQonYXNzaWduZWQtY2xvY2tzJyBhbmQgJ2Fzc2lnbmVkLWNsb2NrLXJhdGVzJyBz
ZXQgZm9yIGFsbCB1c2RoYyBub2RlcywgDQpleGNlcHQgZm9yIHVzZGhjMi4NCg0KSXMgdGhpcyBv
biBwdXJwb3NlPyBJcyBpdCBhIGZsYXc/DQoNClRoYW5rcywNCkZyaWVkZXINCg0KRXh0cmFjdCBm
cm9tIGlteDhtbS5kdHNpOg0KDQp1c2RoYzE6IG1tY0AzMGI0MDAwMCB7DQoJWy4uLl0NCglhc3Np
Z25lZC1jbG9ja3MgPSA8JmNsayBJTVg4TU1fQ0xLX1VTREhDMT47DQoJYXNzaWduZWQtY2xvY2st
cmF0ZXMgPSA8NDAwMDAwMDAwPjsNCglbLi4uXQ0KfTsNCg0KdXNkaGMyOiBtbWNAMzBiNTAwMDAg
ew0KCWNvbXBhdGlibGUgPSAiZnNsLGlteDhtbS11c2RoYyIsICJmc2wsaW14N2QtdXNkaGMiOw0K
CXJlZyA9IDwweDMwYjUwMDAwIDB4MTAwMDA+Ow0KCWludGVycnVwdHMgPSA8R0lDX1NQSSAyMyBJ
UlFfVFlQRV9MRVZFTF9ISUdIPjsNCgljbG9ja3MgPSA8JmNsayBJTVg4TU1fQ0xLX0RVTU1ZPiwN
CgkJIDwmY2xrIElNWDhNTV9DTEtfTkFORF9VU0RIQ19CVVM+LA0KCQkgPCZjbGsgSU1YOE1NX0NM
S19VU0RIQzJfUk9PVD47DQoJY2xvY2stbmFtZXMgPSAiaXBnIiwgImFoYiIsICJwZXIiOw0KCWZz
bCx0dW5pbmctc3RhcnQtdGFwID0gPDIwPjsNCglmc2wsdHVuaW5nLXN0ZXA9IDwyPjsNCglidXMt
d2lkdGggPSA8ND47DQoJc3RhdHVzID0gImRpc2FibGVkIjsNCn07DQoNCnVzZGhjMzogbW1jQDMw
YjYwMDAwIHsNCglbLi4uXQ0KCWFzc2lnbmVkLWNsb2NrcyA9IDwmY2xrIElNWDhNTV9DTEtfVVNE
SEMzX1JPT1Q+Ow0KCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDQwMDAwMDAwMD47DQoJWy4uLl0N
Cn07DQo=
