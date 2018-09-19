From: Manish Narani <MNARANI@xilinx.com>
Subject: RE: [PATCH v7 2/7] edac: synps: Add platform specific structures for
 ddrc controller
Date: Wed, 19 Sep 2018 13:33:58 +0000
Message-ID: <DM6PR02MB52279753E7FD04587393DC08C11C0@DM6PR02MB5227.namprd02.prod.outlook.com>
References: <1537194305-9243-1-git-send-email-manish.narani@xilinx.com>
 <1537194305-9243-3-git-send-email-manish.narani@xilinx.com>
 <20180918075522.GC22202@nazgul.tnic>
 <DM6PR02MB5227F5B1B329C903BA64A27CC11C0@DM6PR02MB5227.namprd02.prod.outlook.com>
 <20180919111553.GA9140@nazgul.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180919111553.GA9140@nazgul.tnic>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, Michal Simek <michals@xilinx.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgQm9yaXMsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9yaXNs
YXYgUGV0a292IFttYWlsdG86YnBAYWxpZW44LmRlXQ0KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRl
bWJlciAxOSwgMjAxOCA0OjQ2IFBNDQo+IFRvOiBNYW5pc2ggTmFyYW5pIDxNTkFSQU5JQHhpbGlu
eC5jb20+DQo+IENjOiByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOyBt
Y2hlaGFiQGtlcm5lbC5vcmc7DQo+IE1pY2hhbCBTaW1layA8bWljaGFsc0B4aWxpbnguY29tPjsg
bGVveWFuZy5saUBueHAuY29tOw0KPiBzdWRlZXAuaG9sbGFAYXJtLmNvbTsgYW1pdC5rdWNoZXJp
YUBsaW5hcm8ub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGVkYWNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NyAy
LzddIGVkYWM6IHN5bnBzOiBBZGQgcGxhdGZvcm0gc3BlY2lmaWMgc3RydWN0dXJlcyBmb3INCj4g
ZGRyYyBjb250cm9sbGVyDQo+IA0KPiBPbiBXZWQsIFNlcCAxOSwgMjAxOCBhdCAwNToxNDo1MUFN
ICswMDAwLCBNYW5pc2ggTmFyYW5pIHdyb3RlOg0KPiA+ID4gU28gSSdtIGdvaW5nIHRvIHN0b3Ag
cmV2aWV3aW5nIHRoaXMgcGF0Y2hzZXQgdW50aWwgeW91IGdvIHRocm91Z2gNCj4gPiA+IHRoZSBv
bGQgcmV2aWV3IHJvdW5kIGFnYWluIGFuZCBtYWtlIHN1cmUgeW91J3ZlIGluY29ycG9yYXRlZCAq
YWxsKg0KPiA+ID4gcmV2aWV3IGZlZWRiYWNrIGFuZCBoYXZlbid0IGZvcmdvdHRlbiBzb21lLCBs
aWtlIHRoZSBvbmUgYWJvdmUuDQo+ID4gPg0KPiA+IE9rYXksIEkgd2lsbCBkb3VibGUgY2hlY2sg
YWdhaW4gZm9yIHRoZSBjb21tZW50cyBmcm9tIHByZXZpb3VzIHJldmlldw0KPiA+IGFuZCByZWN0
aWZ5IHRoZSBzYW1lIGluIHY4LiBDYW4geW91IHBsZWFzZSByZXZpZXcgdGhlIHJlbWFpbmluZw0K
PiA+IHBhdGNoZXMgc28gdGhhdCBJIGNhbiBhY2NvbW1vZGF0ZSBhbnkgY2hhbmdlcyBmb3IgdGhl
bSBpbiB2OD8NCj4gDQo+IFJlYWQgYWdhaW4gd2hhdCBJIHNhaWQ6ICJJJ20gZ29pbmcgdG8gc3Rv
cCByZXZpZXdpbmcgdGhpcyBwYXRjaHNldCB1bnRpbCB5b3UgZ28NCj4gdGhyb3VnaCB0aGUgb2xk
IHJldmlldy4uLiIgWW91IGNhbiBnbyB0aHJvdWdoIHRoZSBvbGQgcmV2aWV3IGFuZCBjaGVjayB5
b3VyIHY3Lg0KPiBJZiB5b3UgaGF2ZW4ndCBtaXNzZWQgYW55dGhpbmcsIGxlbW1lIGtub3cgYW5k
IEknbGwgbG9vayBhdCB0aGUgcmVzdC4NCg0KQXBhcnQgZnJvbSB0aGlzIG9uZSwgSSBoYXZlIGNv
dmVyZWQgYWxsIHRoZSBjb21tZW50cyBmcm9tIHRoZSBwcmV2aW91cyByZXZpZXcuDQoNClRoYW5r
cywNCk1hbmlzaA0K
