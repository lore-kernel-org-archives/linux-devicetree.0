From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH 0/2] mailbox: arm: introduce smc triggered mailbox
Date: Mon, 27 May 2019 02:06:44 +0000
Message-ID: <AM0PR04MB4481E92EFFD69301432C9D23881D0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190523060437.11059-1-peng.fan@nxp.com>
 <CABb+yY0r-njq2OGVP9xAh=-wgib5zk8XbS-vdY1jtz2R=rT4Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABb+yY0r-njq2OGVP9xAh=-wgib5zk8XbS-vdY1jtz2R=rT4Nw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "van.freenix@gmail.com" <van.freenix@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgSmFzc2ksDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzJdIG1haWxib3g6IGFybTogaW50
cm9kdWNlIHNtYyB0cmlnZ2VyZWQgbWFpbGJveA0KPiANCj4gT24gVGh1LCBNYXkgMjMsIDIwMTkg
YXQgMTI6NTAgQU0gUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+IHdyb3RlOg0KPiA+DQo+ID4g
VGhpcyBpcyBhIG1vZGlmaWVkIHZlcnNpb24gZnJvbSBBbmRyZSBQcnp5d2FyYSdzIHBhdGNoIHNl
cmllcw0KPiA+DQo+IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyUzQSUyRiUyRmxvcmUua2UNCj4gcm5lbC5vcmclMkZwYXRjaHdvcmslMkZj
b3ZlciUyRjgxMjk5NyUyRiZhbXA7ZGF0YT0wMiU3QzAxJTdDcGUNCj4gbmcuZmFuJTQwbnhwLmNv
bSU3QzQwYmIxNjMyZjk5MjQ4ZjI0ZTEzMDhkNmUyNDY3YzhiJTdDNjg2ZWExZDNiDQo+IGMyYjRj
NmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzElN0M2MzY5NDUxODk3MDU2MjA3OTYmYW1wO3NkYXQN
Cj4gYT12Nm1MeURLTE84TmFCTWxYNlhsT0N0T3MyQzQxVHVPRzl5RkRZJTJGN3E4blUlM0QmYW1w
O3Jlc2VyDQo+IHZlZD0wLg0KPiA+DQo+IENhbiB5b3UgcGxlYXNlIHNwZWNpZnkgZXhhY3QgbW9k
aWZpY2F0aW9ucyBvbiB0b3Agb2YgQW5kcmUncyBsYXN0IHN1Ym1pc3Npb24/DQo+IEFzIGluICJD
aGFuZ2VzIHNpbmNlIHYxOiAuLi4uIg0KDQpTaW5jZSBBbmRyZSdzIGxhc3QgdjIgdmVyc2lvbiB3
YXMgc2VudCBpbiAyMDE3LCBJIHRob3VnaHQgbm8gbmVlZCB0byBhZGQgdGhhdC4NClRoZSBjaGFu
Z2VzIGFyZSBtb3N0bHkuDQpJbnRyb2R1Y2UgYXJtLG51bS1jaGFucw0KSW50cm9kdWNlIGFybV9z
bWNjY19tYm94X2NtZA0KdHhkb25lX3BvbGwgYW5kIHR4ZG9uZV9pcnEgYXJlIGJvdGggc2V0IHRv
IGZhbHNlDQphcm0sZnVuYy1pZHMgYXJlIGtlcHQsIGJ1dCBhcyBhbiBvcHRpb25hbCBwcm9wZXJ0
eS4NClJld29yZHMgU0NQSSB0byBTQ01JLCBiZWNhdXNlIEkgYW0gdHJ5aW5nIFNDTUkgb3ZlciBT
TUMsIG5vdCBTQ1BJLg0KDQpJJ2xsIGFkZCB0aGUgY2hhbmdlcyBpbmZvcm1hdGlvbiBhZnRlciBJ
IGNvbGxlY3QgbW9yZSBjb21tZW50cyBpbiB0aGlzIHBhdGNoc2V0Lg0KDQpUaGFua3MsDQpQZW5n
Lg0KPiANCj4gVGhhbmtzLg0K
