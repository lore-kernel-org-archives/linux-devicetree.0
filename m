From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: imx6: Add support for Toradex Apalis
 iMX6Q/D SoM
Date: Fri, 8 Jan 2016 10:59:20 +0000
Message-ID: <1452250758.3357.25.camel@toradex.com>
References: <1452011942-11940-1-git-send-email-marcel.ziswiler@toradex.com>
 <1452011942-11940-2-git-send-email-marcel.ziswiler@toradex.com>
 <20160106080358.GD9030@ibawizard.net>
 <1452071716.30372.61.camel@toradex.com>
 <20160108084247.GB27359@ibawizard.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160108084247.GB27359@ibawizard.net>
Content-Language: en-US
Content-ID: <9D0F830FB012EE4AA130749F190B69E0@eurprd05.prod.outlook.com>
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

T24gRnJpLCAyMDE2LTAxLTA4IGF0IDA5OjQyICswMTAwLCBQZXRyIMWgdGV0aWFyIHdyb3RlOg0K
PiBNYXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNvbT4gWzIwMTYtMDEt
MDYgMDk6MTU6MThdOg0KPiANCj4gPiA+ID4gPCZwaW5jdHJsX3JlZ3VsYXRvcl91c2JvdGdfcHdy
PjsNCj4gPiA+ID4gKwkJCXJlZ3VsYXRvci1uYW1lID0gInVzYl9vdGdfdmJ1cyI7DQo+ID4gPiA+
ICsJCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDw1MDAwMDAwPjsNCj4gPiA+ID4gKwkJCXJl
Z3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDUwMDAwMDA+Ow0KPiA+ID4gPiArCQkJZ3BpbyA9IDwm
Z3BpbzMgMjIgR1BJT19BQ1RJVkVfSElHSD47DQo+ID4gPiA+ICsJCQllbmFibGUtYWN0aXZlLWhp
Z2g7DQo+ID4gPiA+ICsJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ID4gPiArCQl9Ow0KPiA+
ID4gDQo+ID4gPiBJJ20gbm90IHN1cmUsIGJ1dCBpdCBzZWVtcyB0byBtZSwgdGhhdCB3ZSBzaG91
bGQgbW92ZSB0aGlzDQo+ID4gPiByZWd1bGF0b3IgaW50bw0KPiA+ID4gdGhlIGNhcnJpZXIgYm9h
cmQgRFRTLiBPbiBvdXIgY3VzdG9tIGNhcnJpZXIgYm9hcmQgd2UndmUgdGhpcw0KPiA+ID4gcmVn
dWxhdG9yDQo+ID4gPiBhbHdheXMgb24gYW5kIHdlIHVzZSB0aGlzIEdQSU8gZm9yIGhlYXJ0YmVh
dCBMRUQsIHNvIEkndmUgdGhpcyBpbg0KPiA+ID4gb3VyDQo+ID4gPiBjYXJyaWVyIGJvYXJkIERU
U1syXToNCj4gPiANCj4gPiBZZXMsIHlvdSBhcmUgYWJzb2x1dGVseSByaWdodCBhbmQgZS5nLiBv
biBBcGFsaXMgVDMwIFsxXSB0aGF0IGlzDQo+ID4gZXhhY3RseSBob3cNCj4gPiB3ZSBkaWQgaXQu
DQo+IA0KPiBBbmQgd2hhdCBhYm91dCB1c2RoYz8gSXQgbGVhZHMgdG8gdGhlIHNhbWUgb3ZlcnJp
ZGVzIGluIHRoZSBjYXJyaWVyDQo+IGJvYXJkDQo+IGZpbGU6DQo+IA0KPiAmaW9tdXhjIHsNCj4g
CXVzZGhjIHsNCj4gCQkvKiBHUElPNF9JTzIwIGlzIExWRFMgKi8NCj4gCQlwaW5jdHJsX21tY19j
ZDogZ3Bpb19tbWNfY2Qgew0KPiAJCX07DQo+IA0KPiAJCS8qIFVzZWQgYXMgbWlzYyBHUElPcyAq
Lw0KPiAJCXBpbmN0cmxfdXNkaGMxOiB1c2RoYzFncnAgew0KPiAJCX07DQo+IAl9Ow0KPiB9Ow0K
DQpZZXMsIHRoZSBzYW1lIGFwcGxpZXMgaGVyZS4NCg0KPiA+ID4gPiArLyogUEFEIEN0cmwgdmFs
dWVzIGZvciBjb21tb24gc2V0dGluZ3MgKi8NCj4gPiA+ID4gKy8qDQo+ID4gPiA+ICsgKiAoUEFE
X0NUTF9IWVMgfCBQQURfQ1RMX1BVU18xMDBLX1VQIHwgUEFEX0NUTF9QVUUgfA0KPiA+ID4gPiBQ
QURfQ1RMX1BLRQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiArICrCoMKgUEFEX0NUTF9TUEVFRF9NRUQg
fCBQQURfQ1RMX0RTRV80MG9obSkNCj4gPiA+ID4gKyAqLw0KPiA+ID4gPiArI2RlZmluZSBQQURf
Q1RSTF9IWVNfUFUgMHgxYjBiMA0KPiA+ID4gDQo+ID4gPiBUaGlzIHdhcyByZXF1ZXN0ZWQgdG8g
YmUgcmV3b3JrZWQuIEkndmUgc2ltcGx5IHJlcGxhY2VkIGFsbCB0aGUNCj4gPiA+IG1hY3JvcyB3
aXRoDQo+ID4gPiBoZXggdmFsdWVzLg0KPiA+IA0KPiA+IEkgZG9uJ3QgdGhpbmsgdGhlIHJldmll
d2VycyByZWFsbHkgY29uY2x1ZGVkIG9uIHRoZSBhY3Rpb24gdG8gYmUNCj4gPiB0YWtlbg0KPiA+
IG9uIGhlcmUgYW5kIGp1c3QgdXNpbmcgaGV4IHZhbHVlcyBpcyBwcm9iYWJseSB0aGUgbW9zdCBz
dHVwaWQNCj4gPiBzb2x1dGlvbi4NCj4gDQo+IEl0J3Mgc2ltcGxlLCBpZiB5b3UganVzdCBsZWF2
ZSBpdCBhcyBpdCBpcywgdGhlbiBpdCB3aWxsIG5ldmVyIGdldA0KPiBtZXJnZWQuDQo+IFRoYXQn
cyBob3cga2VybmVsIGRldmVsb3BtZW50IHdvcmtzIDopDQoNClRoYW5rcyBidXQgSSBkb24ndCB0
aGluayB5b3UgbmVlZCB0byBleHBsYWluIHVzIGhvdyBhbnkgb2YgdGhpcyB3b3Jrcw0KKDstcCku
DQoNCj4gIFdlJ3ZlIGF0IGxlYXN0IHR3byBvcHRpb25zIGhlcmU6DQo+IA0KPiAxLiBGb2xsb3cg
dGhlIG9sZCBwYXRoIGFuZCBqdXN0IGNvbnZlcnQgdGhvc2UgbWFjcm9zIHRvIGhleCB2YWx1ZXMN
Cg0KWWVzLCBzdHVwaWQuDQoNCj4gMi4gUmV3b3JrIGl0IC0gbW92ZSB0aG9zZSBtYWNyb3MgdG8g
c29tZSBoZWFkZXIgZmlsZSBldGMuDQoNCkFzIG1lbnRpb25lZCBiZWZvcmUgSSBkb24ndCB0aGlu
ayBhbnkgYWdyZWVtZW50IGhhcyBiZWVuIHJlYWNoZWQuDQoNCj4gLS0geW5lenoNCg0KDQpDaGVl
cnMNCg0KTWFyY2VsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==
