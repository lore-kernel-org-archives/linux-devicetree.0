From: Manish Narani <MNARANI@xilinx.com>
Subject: RE: [PATCH v7 2/7] edac: synps: Add platform specific structures for
 ddrc controller
Date: Mon, 24 Sep 2018 10:16:26 +0000
Message-ID: <DM6PR02MB5227592B66080409835C6CBDC1170@DM6PR02MB5227.namprd02.prod.outlook.com>
References: <1537194305-9243-1-git-send-email-manish.narani@xilinx.com>
 <1537194305-9243-3-git-send-email-manish.narani@xilinx.com>
 <20180918075522.GC22202@nazgul.tnic>
 <DM6PR02MB5227F5B1B329C903BA64A27CC11C0@DM6PR02MB5227.namprd02.prod.outlook.com>
 <20180919111553.GA9140@nazgul.tnic>
 <DM6PR02MB52279753E7FD04587393DC08C11C0@DM6PR02MB5227.namprd02.prod.outlook.com>
 <20180921090721.GB30439@nazgul.tnic> <20180921091532.GC30439@nazgul.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921091532.GC30439@nazgul.tnic>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, Michal Simek <michals@xilinx.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgQm9yaXMsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3YgW21haWx0bzpicEBhbGllbjguZGVd
DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDIxLCAyMDE4IDI6NDYgUE0NCj4gVG86IE1hbmlz
aCBOYXJhbmkgPE1OQVJBTklAeGlsaW54LmNvbT4NCj4gQ2M6IHJvYmgrZHRAa2VybmVsLm9yZzsg
bWFyay5ydXRsYW5kQGFybS5jb207IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4gTWljaGFsIFNpbWVr
IDxtaWNoYWxzQHhpbGlueC5jb20+OyBsZW95YW5nLmxpQG54cC5jb207DQo+IHN1ZGVlcC5ob2xs
YUBhcm0uY29tOyBhbWl0Lmt1Y2hlcmlhQGxpbmFyby5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gZWRhY0B2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY3IDIvN10gZWRhYzogc3lucHM6IEFkZCBwbGF0Zm9ybSBzcGVj
aWZpYyBzdHJ1Y3R1cmVzIGZvcg0KPiBkZHJjIGNvbnRyb2xsZXINCj4gDQo+IFRoZXJlJ3MgbW9y
ZToNCj4gDQo+IEkgc2FpZDoNCj4gDQo+ID4gPiBAQCAtMzcwLDEyICszOTgsMTIgQEAgc3RhdGlj
IGludCBzeW5wc19lZGFjX2luaXRfY3Nyb3dzKHN0cnVjdA0KPiA+ID4gbWVtX2N0bF9pbmZvICpt
Y2kpDQo+IA0KPiA+IFRoYXQgZnVuY3Rpb24gcmV0dXJucyAwIHVuY29uZGl0aW9uYWxseS4gTWFr
ZSBpdCBhIHZvaWQgaW4gYSBwcmVwYXRjaC4NCj4gDQo+IEJ1dCB5b3UndmUgbHVtcGVkIHRoaXMg
Y2hhbmdlIHRvZ2V0aGVyIHdpdGggYSBidW5jaCBtb3JlLiBNYXliZSBteSByZXF1ZXN0DQo+IHdh
c24ndCBjbGVhciBzbyBsZXQgbWUgcmVwaHJhc2UgaXQ6DQo+IA0KPiBUaGF0IGZ1bmN0aW9uIHJl
dHVybnMgMCB1bmNvbmRpdGlvbmFsbHkuIE1ha2UgaXQgYSB2b2lkIGluIGEgKnNlcGFyYXRlKg0K
PiBwcmVwYXRjaC4NCj4gDQo+IE9rPw0KWWVzLCBva2F5LiDwn5iKIEkgd2lsbCBrZWVwIGl0IGlu
IGEgc2VwYXJhdGUgcHJlcGF0Y2ggaW4gdjguIA0KDQpUaGFua3MsDQpNYW5pc2gNCg==
