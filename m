From: Peng Ma <peng.ma@nxp.com>
Subject: RE: [PATCH 7/7] dt-bindings: fsl-qdma: Add NXP Layerscpae qDMA
 controller bindings
Date: Fri, 12 Oct 2018 02:25:25 +0000
Message-ID: <VI1PR04MB44310889ACCA73AFB29CAEEFEDE20@VI1PR04MB4431.eurprd04.prod.outlook.com>
References: <20181011094655.45707-1-peng.ma@nxp.com>
 <20181011094655.45707-7-peng.ma@nxp.com> <20181011220845.GA20860@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181011220845.GA20860@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "vkoul@kernel.org" <vkoul@kernel.org>, Leo Li <leoyang.li@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "zw@zh-kernel.org" <zw@zh-kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Jiafei Pan <jiafei.pan@nxp.com>
List-Id: devicetree@vger.kernel.org

SGkgUm9iLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYiBIZXJy
aW5nIFttYWlsdG86cm9iaEBrZXJuZWwub3JnXQ0KPiBTZW50OiAyMDE4xOoxMNTCMTLI1SA2OjA5
DQo+IFRvOiBQZW5nIE1hIDxwZW5nLm1hQG54cC5jb20+DQo+IENjOiB2a291bEBrZXJuZWwub3Jn
OyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IG1hcmsucnV0bGFuZEBhcm0uY29tOw0KPiBz
aGF3bmd1b0BrZXJuZWwub3JnOyBkYW4uai53aWxsaWFtc0BpbnRlbC5jb207IHp3QHpoLWtlcm5l
bC5vcmc7DQo+IGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNy83XSBkdC1iaW5kaW5nczogZnNsLXFkbWE6IEFkZCBOWFAg
TGF5ZXJzY3BhZSBxRE1BDQo+IGNvbnRyb2xsZXIgYmluZGluZ3MNCj4gDQo+IE9uIFRodSwgT2N0
IDExLCAyMDE4IGF0IDA1OjQ2OjU1UE0gKzA4MDAsIFBlbmcgTWEgd3JvdGU6DQo+ID4gRG9jdW1l
bnQgdGhlIGRldmljZXRyZWUgYmluZGluZ3MgZm9yIE5YUCBMYXllcnNjYXBlIHFETUEgY29udHJv
bGxlcg0KPiA+IHdoaWNoIGNvdWxkIGJlIGZvdW5kIG9uIE5YUCBRb3JJUSBMYXllcnNjYXBlIFNv
Q3MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIE1hIDxwZW5nLm1hQG54cC5jb20+DQo+
IA0KPiBXaGF0IGhhcHBlbmVkIHRvIHRoZSB2ZXJzaW9uIGZyb20gV2VuIEhlIHRoYXQgd2FzIG9u
IHY3IGFuZCB0aGF0IEkgYWxyZWFkeQ0KPiBnYXZlIG15IFJldmlld2VkLWJ5IG9uPw0KDQpbUGVu
ZyBNYV0gdGhlIGRtYSBvd25lciBpcyBjaGFuZ2VkIGFuZCBxZG1hIGRyaXZlciBtYWRlIHNvbWUg
Y2hhbmdlcywgc28gSSBuZWVkIHNlbmQgdGhvc2UgcGF0Y2ggYWdhaW4gdG8gcmV2aWV3IQ0KDQpC
ZXN0IHJlZ2FyZHMNCglQZW5nIE1hDQo+IA0KPiA+IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZG1hL2ZzbC1xZG1hLnR4dCB8ICAgNTMNCj4gKysrKysrKysrKysr
KysrKysrKysNCj4gPiAgMSBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAwIGRlbGV0
aW9ucygtKSAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2RtYS9mc2wtcWRtYS50eHQNCg0K
