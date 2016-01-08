From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: imx6: Add support for Toradex Apalis
 iMX6Q/D SoM
Date: Fri, 8 Jan 2016 10:59:32 +0000
Message-ID: <1452250771.3357.26.camel@toradex.com>
References: <1452011942-11940-1-git-send-email-marcel.ziswiler@toradex.com>
 <1452011942-11940-2-git-send-email-marcel.ziswiler@toradex.com>
 <20160108085734.GC27359@ibawizard.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160108085734.GC27359@ibawizard.net>
Content-Language: en-US
Content-ID: <938F68AE1B49B344BA28793368A843DA@eurprd05.prod.outlook.com>
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

T24gRnJpLCAyMDE2LTAxLTA4IGF0IDA5OjU3ICswMTAwLCBQZXRyIMWgdGV0aWFyIHdyb3RlOg0K
PiA+ICsJaTJjZGRjOiBpMmNAMCB7DQo+ID4gKwkJZ3Bpb3MgPSA8JmdwaW8zIDE2IEdQSU9fQUNU
SVZFX0hJR0ggLyogc2RhICovDQo+ID4gKwkJCcKgJmdwaW8yIDMwIEdQSU9fQUNUSVZFX0hJR0gg
Lyogc2NsICovDQo+ID4gKwkJCT47DQo+IA0KPiBBY2NvcmRpbmcgdG8gb25lIG9mIHRoZSBjb21t
ZW50cywgaXQgc2hvdWxkIGJlIGNoYW5nZWQgdG8gdGhlDQo+IGZvbGxvd2luZzoNCj4gDQo+IAkJ
c2RhLWdwaW9zID0gPCZncGlvMyAxNiBHUElPX0FDVElWRV9ISUdIPjsNCj4gCQlzY2wtZ3Bpb3Mg
PSA8JmdwaW8yIDMwIEdQSU9fQUNUSVZFX0hJR0g+Ow0KDQpObywgSSBiZWxpZXZlIHlvdSBtaXhl
ZCB0aGUgaTJjLWlteCBiaW5kaW5nIHdpdGggdGhlIGkyYy1ncGlvIG9uZSBbMl0uDQoNCj4gLS0g
eW5lenoNCg0KDQpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9n
aXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2kyYy9pMmMtaW14LnR4dA0KWzJdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pMmMvaTJjLWdwaW8udHh0DQoNCkNoZWVycw0KDQpNYXJjZWwNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
