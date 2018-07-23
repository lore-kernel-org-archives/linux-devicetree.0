From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: imx6ull: keep IMX6UL_ prefix for signals on
 both i.MX6UL and i.MX6ULL
Date: Sun, 22 Jul 2018 22:40:00 -0300
Message-ID: <CAOMZO5BMCD8EYFMSuWFyzEOO5L7hgHLfaZ2Hi41Q4X30w21whA@mail.gmail.com>
References: <20180720102321.23291-1-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180720102321.23291-1-sebastien.szymanski@armadeus.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBKdWwgMjAsIDIwMTggYXQgNzoyMyBBTSwgU8OpYmFzdGllbiBTenltYW5za2kKPHNl
YmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPiB3cm90ZToKPiBTaWduYWxzIGF2YWlsYWJs
ZSBvbiBib3RoIGkuTVg2VUwgYW5kIGkuTVg2VUxMIHNob3VsZCBoYXZlIHRoZSBzYW1lIG5hbWUK
PiBiZWNhdXNlIGl0IGlzIHRoZSBjYXNlIG9mIGFsbCBvdGhlcnMgY29tbW9uIHNpZ25hbHMsIGl0
IGF2b2lkcyB0byBtYWtlCj4gbWlzdGFrZXMgKHVzZSB0aGUgd3Jvbmcgb25lcykgYW5kIGl0IG1h
a2VzIHdyaXRpbmcgZGV2aWNlIHRyZWUgZmlsZXMKPiBsZXNzIGNvbXBsaWNhdGVkLiBGb3IgZXhh
bXBsZToKPgo+IGlteDZ1bC1pbXg2dWxsLWJvYXJkLmR0c2k6Cj4gIC4uLgo+ICBwaW5jdHJsX3Vh
cnQ1OiB1YXJ0NWdycCB7Cj4gICAgICAgICBmc2wscGlucyA9IDwKPiAgICAgICAgICAgICAgICAg
TVg2VUxfUEFEX1VBUlQ1X1RYX0RBVEFfX1VBUlQ1X0RDRV9UWCAgIDB4MWIwYjEKPiAgICAgICAg
ICAgICAgICAgTVg2VUxfUEFEX1VBUlQ1X1JYX0RBVEFfX1VBUlQ1X0RDRV9SWCAgIDB4MWIwYjEK
PiAgICAgICAgICA+Owo+ICB9Owo+Cj4gaW14NnVsLWJvYXJkLmR0czoKPiAgI2luY2x1ZGUgPGlt
eDZ1bC5kdHNpPgo+ICAjaW5jbHVkZSA8aW14NnVsLWlteDZ1bGwtYm9hcmQuZHRzaT4KPiAgLi4u
Cj4KPiBpbXg2dWxsLWJvYXJkLmR0czoKPiAgI2luY2x1ZGUgPGlteDZ1bGwuZHRzaT4KPiAgI2lu
Y2x1ZGUgPGlteDZ1bC1pbXg2dWxsLWJvYXJkLmR0c2k+Cj4gIC4uLgo+Cj4gV2l0aG91dCB0aGlz
IHBhdGNoLCB0aGUgaW14NnVsbC1ib2FyZC5kdGIgd2lsbCB1c2UKPiBNWDZVTF9QQURfVUFSVDVf
UlhfREFUQV9fVUFSVDVfRENFX1JYIGluc3RlYWQgb2YKPiBNWDZVTExfUEFEX1VBUlQ1X1JYX0RB
VEFfX1VBUlQ1X0RDRV9SWCBhbmQgdGhlIHVhcnQ1IHdpbGwgYmUKPiBtaXNjb25maWd1cmVkLgo+
Cj4gU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5z
a2lAYXJtYWRldXMuY29tPgoKUmV2aWV3ZWQtYnk6IEZhYmlvIEVzdGV2YW0gPGZhYmlvLmVzdGV2
YW1AbnhwLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFybS1rZXJuZWwK
