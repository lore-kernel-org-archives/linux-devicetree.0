From: Manish Narani <MNARANI@xilinx.com>
Subject: RE: [PATCH v7 1/7] edac: synopsys: Fix code comments and naming
 convention
Date: Wed, 19 Sep 2018 05:08:50 +0000
Message-ID: <DM6PR02MB52271CFF653377B4810CD305C11C0@DM6PR02MB5227.namprd02.prod.outlook.com>
References: <1537194305-9243-1-git-send-email-manish.narani@xilinx.com>
 <1537194305-9243-2-git-send-email-manish.narani@xilinx.com>
 <20180918075311.GB22202@nazgul.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180918075311.GB22202@nazgul.tnic>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, Michal Simek <michals@xilinx.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgQm9yaXMsDQoNClRoYW5rcyBhIGxvdCBmb3IgdGhlIHJldmlldy4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3YgW21haWx0bzpicEBhbGll
bjguZGVdDQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAxOCwgMjAxOCAxOjIzIFBNDQo+IFRv
OiBNYW5pc2ggTmFyYW5pIDxNTkFSQU5JQHhpbGlueC5jb20+DQo+IENjOiByb2JoK2R0QGtlcm5l
bC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOyBtY2hlaGFiQGtlcm5lbC5vcmc7DQo+IE1pY2hh
bCBTaW1layA8bWljaGFsc0B4aWxpbnguY29tPjsgbGVveWFuZy5saUBueHAuY29tOw0KPiBzdWRl
ZXAuaG9sbGFAYXJtLmNvbTsgYW1pdC5rdWNoZXJpYUBsaW5hcm8ub3JnOw0KPiBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+
IGVkYWNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NyAxLzddIGVkYWM6IHN5bm9wc3lzOiBGaXggY29k
ZSBjb21tZW50cyBhbmQgbmFtaW5nDQo+IGNvbnZlbnRpb24NCj4gDQo+IE9uIE1vbiwgU2VwIDE3
LCAyMDE4IGF0IDA3OjU0OjU5UE0gKzA1MzAsIE1hbmlzaCBOYXJhbmkgd3JvdGU6DQo+ID4gVXBk
YXRlIHRoZSBjb21tZW50cyBpbiB0aGUgU3lub3BzeXMgRURBQyBkcml2ZXIuIE1pbm9yIGNoYW5n
ZXMgdG8NCj4gPiBmdW5jdGlvbiBuYW1lcyBhbmQgcmV0dXJuIHR5cGVzIGFyZSBhbHNvIGluY2x1
ZGVkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWFuaXNoIE5hcmFuaSA8bWFuaXNoLm5hcmFu
aUB4aWxpbnguY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2VkYWMvc3lub3BzeXNfZWRhYy5j
IHwgMTc2DQo+ID4gKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKSwgOTYgZGVsZXRpb25zKC0pDQo+
IA0KPiBTbyB0aGlzIHBhdGNoIGRvZXMgYSBidW5jaCBvZiB0aGluZ3MgdG9nZXRoZXIgYW5kIHNo
b3VsZCBiZSBzcGxpdCBpbnRvOg0KPiANCj4gKiBmdW5jdGlvbmFsIGNoYW5nZXMgbGlrZSBjb2Rl
IGNsZWFudXANCj4gKiBmdW5jdGlvbnMgcmVuYW1pbmcNCj4gKiBjb21tZW50cyBjbGVhbnVwDQo+
IA0KPiBNYXliZSBpbiB0aGF0IG9yZGVyLg0KPiANCj4gVGhpcyB3YXkgeW91J2xsIGhhdmUgb25l
IGxvZ2ljYWwgc2V0IG9mIGNoYW5nZXMgcGVyIHBhdGNoIGFuZCByZXZpZXcgd2lsbCBiZQ0KPiBh
bG1vc3QgdHJpdmlhbC4NCj4gDQpPa2F5LCBJIHdpbGwgZG8gdGhhdCBpbiB2OC4NCg0KVGhhbmtz
LA0KTWFuaXNoDQo=
