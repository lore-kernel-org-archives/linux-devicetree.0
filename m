From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v5 1/2] ARM: dts: imx6: Add support for Toradex Apalis
 iMX6Q/D SoM
Date: Fri, 16 Sep 2016 13:28:42 +0000
Message-ID: <1474032521.3103.17.camel@toradex.com>
References: <1454688741-4238-1-git-send-email-marcel.ziswiler@toradex.com>
 <1454688741-4238-2-git-send-email-marcel.ziswiler@toradex.com>
 <97a3d506-35a0-2a15-18ef-2719c0596cc1@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <97a3d506-35a0-2a15-18ef-2719c0596cc1@mentor.com>
Content-Language: en-US
Content-ID: <5B821910886712449054B0EAE428CBF5@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "vladimir_zapolskiy@mentor.com" <vladimir_zapolskiy@mentor.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "stillcompiling@gmail.com" <stillcompiling@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "galak@codeaurora.org" <galak@codeaurora.org>, "ynezz@true.cz" <ynezz@true.cz>, "festevam@gmail.com" <festevam@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

SGkgVmxhZGltaXINCg0KT24gTW9uLCAyMDE2LTA4LTI5IGF0IDE2OjI4ICswMzAwLCBWbGFkaW1p
ciBaYXBvbHNraXkgd3JvdGU6DQo+IEhpIE1hcmNlbCwNCj4gDQo+IE9uIDAyLzA1LzIwMTYgMDY6
MTIgUE0sIE1hcmNlbCBaaXN3aWxlciB3cm90ZToNCj4gPiANCj4gPiBGcm9tOiBQZXRyIMWgdGV0
aWFyIDx5bmV6ekB0cnVlLmN6Pg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmNlbCBaaXN3
aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBl
dHIgxaB0ZXRpYXIgPHluZXp6QHRydWUuY3o+DQo+ID4gUmV2aWV3ZWQtYnk6IFN0ZWZhbiBBZ25l
ciA8c3RlZmFuQGFnbmVyLmNoPg0KPiA+IC0tLQ0KPiA+IA0KPiBiZWNhdXNlIHRoZSBjaGFuZ2Ug
aXMgaW4gbWFpbmxpbmUgbm93IGJlbG93IGlzIGtpbmQgb2Ygb3V0IG9mIGRhdGUNCj4gaW5mb3Jt
YXRpb24sIGJ1dCB5b3UgbWF5IGZpbmQgaXQgaGVscGZ1bC4NCj4gDQo+IFtzbmlwXQ0KPiANCj4g
PiANCj4gPiAtIGZpeGVkIEhETUkgRERDIChyZXF1aXJlcyBHUElPLWJhc2VkIGJpdGJhbmdpbmcg
STJDIHRvIGJlIGVuYWJsZWQpDQo+IFRoaXMgaXMgbm90IG5lZWRlZC4NCj4gDQo+IFtzbmlwXQ0K
PiANCj4gPiANCj4gPiArCS8qIEREQ19JMkM6IEkyQzJfU0RBL1NDTCBvbiBNWE0zIDIwNS8yMDcg
Ki8NCj4gPiArCWkyY2RkYzogaTJjQDAgew0KPiA+ICsJCWNvbXBhdGlibGUgPSAiaTJjLWdwaW8i
Ow0KPiA+ICsJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4gKwkJcGluY3RybC0wID0g
PCZwaW5jdHJsX2kyY19kZGM+Ow0KPiA+ICsJCWdwaW9zID0gPCZncGlvMyAxNiBHUElPX0FDVElW
RV9ISUdIIC8qIHNkYSAqLw0KPiA+ICsJCQnCoCZncGlvMiAzMCBHUElPX0FDVElWRV9ISUdIIC8q
IHNjbCAqLw0KPiA+ICsJCQk+Ow0KPiA+ICsJCWkyYy1ncGlvLGRlbGF5LXVzID0gPDI+OwkvKiB+
MTAwIGtIeiAqLw0KPiA+ICsJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gKwl9Ow0KPiA+ICsN
Cj4gVGhpcyBpcyBub3QgbmVlZGVkLg0KPiANCj4gW3NuaXBdDQo+IA0KPiA+IA0KPiA+ICsJcGlu
Y3RybF9pMmNfZGRjOiBncGlvaTJjZGRjZ3JwIHsNCj4gPiArCQlmc2wscGlucyA9IDwNCj4gPiAr
CQkJLyogRERDIGJpdGJhbmcgKi8NCj4gPiArCQkJTVg2UURMX1BBRF9FSU1fRUIyX19HUElPMl9J
TzMwIDB4MWIwYjANCj4gPiArCQkJTVg2UURMX1BBRF9FSU1fRDE2X19HUElPM19JTzE2IDB4MWIw
YjANCj4gPiArCQk+Ow0KPiA+ICsJfTsNCj4gPiArDQo+IFByYWN0aWNhbGx5IHlvdSBkb24ndCBu
ZWVkIHRoaXMgb3ZlcmNvbXBsaWNhdGVkIEdQSU8tYmFzZWQgYml0YmFuZ2luZw0KPiB0byBlbXVs
YXRlIEkyQywgYmVjYXVzZSB0aGUgRFcgSERNSSBjb250cm9sbGVyIGhhcyBhIHJlZHVjZWQgSTJD
DQo+IGNvbnRyb2xsZXIgb24gYm9hcmQsIHlvdSBtYXkgdGFrZSBhIGxvb2sgYXQgaXRzIHN1cHBv
cnQgcHVibGlzaGVkDQo+IGhlcmU6DQo+IA0KPiDCoMKgwqDCoGh0dHA6Ly93d3cuc3Bpbmljcy5u
ZXQvbGlzdHMvZHJpLWRldmVsL21zZzExNjMwOC5odG1sDQo+IA0KPiBUbyB1dGlsaXplIGl0IHRo
ZSBwYWRzIHNob3VsZCBiZSBzZXQgdG8gSERNSSBmdW5jdGlvbiBpbnN0ZWFkIG9mDQo+IEkyQyBv
ciBHUElPLg0KDQpXb3JrcyBuaWNlbHkgaW5kZWVkLCB0aGFua3MgZm9yIGxldHRpbmcgdXMga25v
dy4NCg0KPiAtLQ0KPiBXaXRoIGJlc3Qgd2lzaGVzLA0KPiBWbGFkaW1pcg0KDQpCZXN0IHdpc2hl
cyB0byB5b3UgdG9vIQ0KDQpDaGVlcnMNCg0KTWFyY2VsDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAps
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
