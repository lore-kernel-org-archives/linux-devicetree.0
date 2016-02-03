From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v4 1/2] ARM: dts: imx6: Add support for Toradex Apalis
 iMX6Q/D SoM
Date: Wed, 3 Feb 2016 22:46:18 +0000
Message-ID: <1454539575.11389.5.camel@toradex.com>
References: <1453675703-31594-1-git-send-email-marcel.ziswiler@toradex.com>
 <1453675703-31594-2-git-send-email-marcel.ziswiler@toradex.com>
 <20160125094628.GH27359@ibawizard.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160125094628.GH27359@ibawizard.net>
Content-Language: en-US
Content-ID: <8E084F5DB6DA2149852B48D7FB2C1A50@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "ynezz@true.cz" <ynezz@true.cz>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "stillcompiling@gmail.com" <stillcompiling@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "galak@codeaurora.org" <galak@codeaurora.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

SGkgUGV0cg0KDQpPbiBNb24sIDIwMTYtMDEtMjUgYXQgMTA6NDYgKzAxMDAsIFBldHIgxaB0ZXRp
YXIgd3JvdGU6DQoNCltzbmlwXQ0KDQo+IFdoYXQgcHJvYmxlbXMgYXJlIHlvdSBoYXZpbmcgaWYg
eW91IHJlbW92ZSB0aGF0IHBhcmVudCByZWd1bGF0b3JzDQo+IG5vZGU/DQoNClRvIGJlIGhvbmVz
dCBJIGRvbid0IHJlbWVtYmVyIHRoZSBleGFjdCBpc3N1ZXMgaXQgY2F1c2VkLiBJIGp1c3QgdHJp
ZWQNCmFnYWluIG5vdyB3aXRoIGxhdGVzdMKgbmV4dC0yMDE2MDIwMyBhbmQgYmVzaWRlcyBzbGFi
IGJlaW5nIGJyb2tlbiBpdA0Kd29ya2VkIGxpa2UgYSBjaGFybS4gU28gZmluYWxseSByaWQgb2Yg
aXQgSSBnb3QgKDstcCkuDQoNCj4gMS4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJt
YWlsL2xpbnV4LWFybS1rZXJuZWwvMjAxNS1Ob3ZlbWJlDQo+IHIvMzg2NDU2Lmh0bWwNCj4gMi4g
aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3luZXp6L2xpbnV4LTIuNi81YTIxMTc4
NDU0NGEzYTQ2DQo+IDBkZjdlN2U0NTQ3OTAxMGFlM2ZlYWY3Ni9hcmNoL2FybS9ib290L2R0cy9p
bXg2cWRsLWFwYWxpcy5kdHNpDQo+IDMuIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9hcm0vYXJtLXNvYw0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHdvcmshDQoN
CllvdSBhcmUgdmVyeSB3ZWxjb21lLg0KDQo+IC0tIHluZXp6DQoNCkNoZWVycw0KDQpNYXJjZWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtl
cm5lbAo=
