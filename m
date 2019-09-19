From: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 2/3] arm64: dts: imx8mm: Use correct clock for usdhc's ipg
 clk
Date: Thu, 19 Sep 2019 10:04:40 +0000
Message-ID: <c1c08d49-3473-b4b1-4ed1-f30276ffbbf1@kontron.de>
References: <1568869559-28611-1-git-send-email-Anson.Huang@nxp.com>
 <1568869559-28611-2-git-send-email-Anson.Huang@nxp.com>
 <c680d114-1c14-6bf8-226c-2fdd98350158@kontron.de>
 <DB3PR0402MB3916B0DE9EBC0B0F6664CE34F5890@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB3916B0DE9EBC0B0F6664CE34F5890@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-ID: <2798A0465DE2B140910482FC94ED1272@snt-world.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Jacky Bai <ping.bai@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Jun Li <jun.li@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "angus@akkea.ca" <angus@akkea.ca>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

SGkgQW5zb24sDQoNCk9uIDE5LjA5LjE5IDExOjMxLCBBbnNvbiBIdWFuZyB3cm90ZToNCj4gSGks
IFNjaHJlbXBmDQo+IA0KPj4gSGkgQW5zb24sDQo+Pg0KPj4gSSBoYXZlIGEgcXVlc3Rpb24sIHRo
YXQgaXMgbm90IGRpcmVjdGx5IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaC4NCj4+IEkgc2VlIHRoYXQg
Zm9yIHRoZSB1c2RoYzEgYW5kIHVzZGhjMyBub2RlcywgdGhlcmUgaXMgYW4gJ2Fzc2lnbmVkLWNs
b2NrJw0KPj4gYW5kICdhc3NpZ25lZC1jbG9jay1yYXRlcycgcHJvcGVydHkgYnV0IG5vdCBmb3Ig
dXNkaGMyLiBUaGUgc2FtZSBhcHBsaWVzIHRvDQo+PiB0aGUgbXg4bXEgYW5kIG14OG1uIGR0c2kg
ZmlsZS4NCj4+DQo+PiBJcyB0aGVyZSBhbnkgcmVhc29uIGZvciB0aGlzPyBJZiBub3QgY2FuIHlv
dSBmaXggaXQ/DQo+IA0KPiBUaGlzIHBhdGNoIHNlcmllcyBpcyBOT1QgcmVsYXRlZCB0byAnYXNz
aWduZWQtY2xvY2snIG9yICdhc3NpZ25lZC1jbG9jay1yYXRlcycNCj4gcHJvcGVydHksDQoNClRo
YXQncyBleGFjdGx5IHdoYXQgSSdtIHNheWluZy4gVG8gbm90IGNhdXNlIG1vcmUgY29uZnVzaW9u
LCBJIGhhdmUgc2VudCANCmEgbWVzc2FnZSBpbiBhIG5ldyB0aHJlYWQ6IA0KaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LWFybS1rZXJuZWwvMjAxOS1TZXB0ZW1iZXIv
NjgxNDI2Lmh0bWwNCg0KPiBpdCBpcyBqdXN0IGZvciBjb3JyZWN0aW5nIGNsb2NrIHNvdXJjZSBh
Y2NvcmRpbmcgdG8gcmVmZXJlbmNlIG1hbnVhbCwNCj4gdGhlICdpcGcnIGNsb2NrIGlzIGZyb20g
c3lzdGVtJ3MgSVBHX1JPT1QgY2xvY2sgYWNjb3JkaW5nIHRvIHJlZmVyZW5jZSBtYW51YWwgQ0NN
DQo+IGNoYXB0ZXIsIHVzaW5nIERVTU1ZIGNsb2NrIGlzIE5PVCBhIGdvb2Qgb3B0aW9uLCB0aGUg
J2lwZycgY2xvY2sgaXMgc3VwcG9zZWQNCj4gdG8gYmUgdGhlIGNsb2NrIGZvciBhY2Nlc3Npbmcg
cmVnaXN0ZXIsIGFuZCBpdCBzaG91bGQgTk9UIGJlIERVTU1ZIGlmIHdlIGtub3cNCj4gd2hhdCBl
eGFjdGx5IHRoZSBjbG9jayBzb3VyY2UgaXMgdXNlZC4NCg0KVGhhdCdzIHByb2JhYmx5IHJpZ2h0
IGFuZCBJIGRpZG4ndCBtZWFuIHRvIHF1ZXN0aW9uIHRoZSBwYXRjaCBhdCBhbGwuDQoNClRoYW5r
cywNCkZyaWVkZXI=
