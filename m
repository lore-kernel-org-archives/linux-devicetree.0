From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH] ARM: dts: imx7d-sdb: add rev-a board support
Date: Fri, 9 Nov 2018 01:27:54 +0000
Message-ID: <DB3PR0402MB3916021FA80AE9C236537281F5C60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1541567625-11812-1-git-send-email-Anson.Huang@nxp.com>
 <CAOMZO5AL03yy6Vj_eC=h7scSDnuja1G8rsWER+r7w3FEVaceDg@mail.gmail.com>
 <DB3PR0402MB3916B318947B803BC5ADF4A6F5C50@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAOMZO5DiTbEsVXTCfE8fJ=4+yU4oXR1gex7Bj-k=FowKHWJaxw@mail.gmail.com>
 <DB3PR0402MB3916B027A9C724D349C7969EF5C50@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAOMZO5CPZKqJdTPzZDw=19HW_YCg_JGvLpw9i3iKsi+EJF-yNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5CPZKqJdTPzZDw=19HW_YCg_JGvLpw9i3iKsi+EJF-yNg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGksIEZhYmlvDQoNCkJlc3QgUmVnYXJkcyENCkFuc29uIEh1YW5nDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRmFiaW8gRXN0ZXZhbSBbbWFpbHRvOmZlc3RldmFtQGdt
YWlsLmNvbV0NCj4gU2VudDogMjAxOOW5tDEx5pyIOOaXpSAyMzozOA0KPiBUbzogQW5zb24gSHVh
bmcgPGFuc29uLmh1YW5nQG54cC5jb20+DQo+IENjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJu
ZWwub3JnPjsgTWFyayBSdXRsYW5kDQo+IDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT47IFNoYXduIEd1
byA8c2hhd25ndW9Aa2VybmVsLm9yZz47IFNhc2NoYQ0KPiBIYXVlciA8cy5oYXVlckBwZW5ndXRy
b25peC5kZT47IFNhc2NoYSBIYXVlciA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsNCj4gRmFiaW8g
RXN0ZXZhbSA8ZmFiaW8uZXN0ZXZhbUBueHAuY29tPjsgb3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUg
QU5EDQo+IEZMQVRURU5FRCBERVZJQ0UgVFJFRSBCSU5ESU5HUyA8ZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc+OyBsaW51eC1rZXJuZWwNCj4gPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+
OyBtb2RlcmF0ZWQgbGlzdDpBUk0vRlJFRVNDQUxFIElNWCAvIE1YQw0KPiBBUk0gQVJDSElURUNU
VVJFIDxsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+OyBkbC1saW51eC1pbXgN
Cj4gPGxpbnV4LWlteEBueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBBUk06IGR0czog
aW14N2Qtc2RiOiBhZGQgcmV2LWEgYm9hcmQgc3VwcG9ydA0KPiANCj4gSGkgQW5zb24sDQo+IA0K
PiBPbiBUaHUsIE5vdiA4LCAyMDE4IGF0IDEyOjMwIEFNIEFuc29uIEh1YW5nIDxhbnNvbi5odWFu
Z0BueHAuY29tPg0KPiB3cm90ZToNCj4gDQo+ID4gVGhhbmtzIGZvciBwb2ludGluZyBvdXQgdGhp
cyBpc3N1ZSwgSSBtYWRlIGEgbWlzdGFrZSB3aGVuIGRvaW5nIHRoZSBzZWFyY2ggaW4NCj4gZ2l0
IHJlcG8uLg0KPiA+IFNvLCBpZiB3ZSBoYXZlIHRvIGFzc2VydCBhIEdQSU8sIHRoZXJlIGlzIG5v
IGNvbW1vbiB3YXkgaW4gcGluY3RybA0KPiA+IGRyaXZlcj8gSGF2ZSB0byBkbyBpdCBpbiBkcml2
ZXIgaXRzZWxmPyBMaWtlIHRoaXMgY2FzZSwgd2UgaGF2ZSB0byBhc3NlcnQgdGhlDQo+IEdQSU8g
aW4gZmVjIGRyaXZlcj8NCj4gDQo+IFlvdSBjb3VsZCBwYXNzICJwaHktc3VwcGx5IiBwcm9wZXJ0
eSAgYW5kIG1vZGVsIGl0IGFzIGdwaW8gY29udHJvbGxlZA0KPiByZWd1bGF0b3IuDQoNClRoYW5r
cyBmb3IgdGhlIHN1Z2dlc3Rpb24sIEkgdHJpZWQgaXQgYW5kIGl0IHdvcmtzLCBwbGVhc2UgaGVs
cCByZXZpZXcgVjIgcGF0Y2guDQoNCkFuc29uLg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
