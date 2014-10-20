From: Neil Zhang <zhangwm@marvell.com>
Subject: RE: [PATCH v4] ARM: perf: save/restore pmu registers in pm notifier
Date: Mon, 20 Oct 2014 02:26:19 -0700
Message-ID: <9034CBD80F070943B59700D7F8149ED9024EB81CDD@SC-VEXCH4.marvell.com>
References: <6106CAF835F351419ADA79E4836E6EC71B6A53C826@SC-VEXCH4.marvell.com>
 <9034CBD80F070943B59700D7F8149ED9A0875730@SC-VEXCH4.marvell.com>
 <20140513184503.GF16388@arm.com>
 <9034CBD80F070943B59700D7F8149ED9A087573F@SC-VEXCH4.marvell.com>
 <537337F3.4080300@arm.com>
 <9034CBD80F070943B59700D7F8149ED9A0875776@SC-VEXCH4.marvell.com>
 <9034CBD80F070943B59700D7F8149ED90182308172@SC-VEXCH4.marvell.com>
 <20140703175706.GI17372@arm.com>
 <9034CBD80F070943B59700D7F8149ED9024EB81CD8@SC-VEXCH4.marvell.com>
 <5444D2E0.9070205@arm.com> <20141020092005.GD4370@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141020092005.GD4370@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>, Sudeep Holla <Sudeep.Holla@arm.com>
Cc: "'linux@arm.linux.org.uk'" <linux@arm.linux.org.uk>, "'linux-arm-kernel@lists.infradead.org'" <linux-arm-kernel@lists.infradead.org>, "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>, "'devicetree@vger.kernel.org'" <devicetree@vger.kernel.org>, "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
List-Id: devicetree@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFdpbGwgRGVhY29uIFttYWls
dG86d2lsbC5kZWFjb25AYXJtLmNvbV0NCj4gU2VudDogMjAxNMTqMTDUwjIwyNUgMTc6MjANCj4g
VG86IFN1ZGVlcCBIb2xsYQ0KPiBDYzogTmVpbCBaaGFuZzsgJ2xpbnV4QGFybS5saW51eC5vcmcu
dWsnOyAnbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyc7ICdsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnJzsNCj4gJ2RldmljZXRyZWVAdmdlci5rZXJuZWwub3JnJzsg
bWF0aGlldS5wb2lyaWVyQGxpbmFyby5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NF0gQVJN
OiBwZXJmOiBzYXZlL3Jlc3RvcmUgcG11IHJlZ2lzdGVycyBpbiBwbQ0KPiBub3RpZmllcg0KPiAN
Cj4gT24gTW9uLCBPY3QgMjAsIDIwMTQgYXQgMTA6MTY6MTZBTSArMDEwMCwgU3VkZWVwIEhvbGxh
IHdyb3RlOg0KPiA+IE9uIDIwLzEwLzE0IDA5OjQ2LCBOZWlsIFpoYW5nIHdyb3RlOg0KPiA+ID4g
V2lsbCwgSSBwcmVmZXIgdG8gY2hlY2sgYWx3YXlzLW9uIGZpZWxkIHVuZGVyIFBNVSBub2RlIHRv
IGNoZWNrDQo+ID4gPiB3aGV0aGVyIHdlIG5lZWQgU2F2ZS9yZXN0b3JlIHRoZW0uDQo+ID4gPg0K
PiA+IEJ1dCBob3cgZG8geW91IGhhbmRsZSBpdCBmb3IgZGlmZmVyZW50IGlkbGUgc3RhdGVzLiBl
LmcuIGlmIENQVSBpcyBpbg0KPiA+IHJldGVudGlvbiwgUE1VJ3MgKm1pZ2h0IGJlKiByZXRhaW5l
ZC4gQWxzbyBJIGRvbid0IHRoaW5rIFBNVXMgd2lsbCBiZQ0KPiA+IHBsYWNlZCBpbiAiYWx3YXlz
LW9uIiBwb3dlciBkb21haW4gbGlrZSB0aW1lcnMuIFNvIHVzaW5nICJhbHdheXMtb24iDQo+ID4g
c291bmRzIGluY29ycmVjdCB0byBtZS4NCj4gDQo+IEFkZGluZyBNYXRoaWV1IHRvIENDLCBzaW5j
ZSBJIHNwb2tlIHRvIGhpbSBhdCBMUEMgYWJvdXQgdGhpcyBhbmQgaGUgd2FzDQo+IHRhbGtpbmcg
YWJvdXQgaW1wbGVtZW50aW5nIHByb3BlciBQTSBkb21haW4gZGVzY3JpcHRpb25zIGZvciBjb3Jl
c2lnaHQNCj4gY29tcG9uZW50cy4NCj4gDQoNCkdvb2QgdG8ga25vdyB0aGF0IQ0KSG9wZSB3ZSBj
YW4gZmlndXJlIG91dCBpdCB3aXRoIGEgcHJvcGVyIHdheS4NCg0KPiBXaWxsDQoNCkJlc3QgUmVn
YXJkcywNCk5laWwgWmhhbmcNCg==
