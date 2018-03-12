From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v5 1/4] dt-bindings: firmware: Add bindings for ZynqMP
 firmware
Date: Mon, 12 Mar 2018 23:07:56 +0000
Message-ID: <DM2PR0201MB07678A47B5380DC14E6F6126B8D30@DM2PR0201MB0767.namprd02.prod.outlook.com>
References: <1519154467-2896-1-git-send-email-jollys@xilinx.com>
 <1519154467-2896-2-git-send-email-jollys@xilinx.com>
 <778329dd-76a7-0151-26d9-30e87e0c888d@arm.com>
 <CY1PR0201MB0764FB23021F5DC694C7F56DB8D80@CY1PR0201MB0764.namprd02.prod.outlook.com>
 <f6a416b7-542f-a3c3-538f-8549cf4e96c3@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f6a416b7-542f-a3c3-538f-8549cf4e96c3@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "mingo@kernel.org" <mingo@kernel.org>, "keescook@chromium.org" <keescook@chromium.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, Rajan Vaja <RAJANV@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgU3VkZWVwLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN1ZGVl
cCBIb2xsYSBbbWFpbHRvOnN1ZGVlcC5ob2xsYUBhcm0uY29tXQ0KPiBTZW50OiBUaHVyc2RheSwg
TWFyY2ggMDgsIDIwMTggMzo0OCBBTQ0KPiBUbzogSm9sbHkgU2hhaCA8Sk9MTFlTQHhpbGlueC5j
b20+DQo+IENjOiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgbWF0dEBjb2RlYmx1ZXByaW50
LmNvLnVrOw0KPiBoa2FsbHdlaXQxQGdtYWlsLmNvbTsgbWljaGFsLnNpbWVrQHhpbGlueC5jb207
IHJvYmgrZHRAa2VybmVsLm9yZzsNCj4gbWFyay5ydXRsYW5kQGFybS5jb207IFN1ZGVlcCBIb2xs
YSA8c3VkZWVwLmhvbGxhQGFybS5jb20+Ow0KPiBhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnOyBt
aW5nb0BrZXJuZWwub3JnOyBrZWVzY29va0BjaHJvbWl1bS5vcmc7DQo+IGRtaXRyeS50b3Jva2hv
dkBnbWFpbC5jb207IFJhamFuIFZhamEgPFJBSkFOVkB4aWxpbnguY29tPjsgbGludXgtYXJtLQ0K
PiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
NSAxLzRdIGR0LWJpbmRpbmdzOiBmaXJtd2FyZTogQWRkIGJpbmRpbmdzIGZvciBaeW5xTVANCj4g
ZmlybXdhcmUNCj4gDQo+IA0KPiANCj4gT24gMDcvMDMvMTggMjI6MjUsIEpvbGx5IFNoYWggd3Jv
dGU6DQo+ID4gSGkgU3VkZWVwLA0KPiA+DQo+IA0KPiBbLi4uXQ0KPiANCj4gPj4+ICtFeGFtcGxl
czoNCj4gPj4+ICsJZmlybXdhcmUgew0KPiA+Pj4gKwkJenlucW1wX2Zpcm13YXJlOiB6eW5xbXAt
ZmlybXdhcmUgew0KPiA+Pj4gKwkJCWNvbXBhdGlibGUgPSAieGxueCx6eW5xbXAtZmlybXdhcmUi
Ow0KPiA+Pj4gKwkJCW1ldGhvZCA9ICJzbWMiOw0KPiA+Pj4gKwkJfTsNCj4gPj4+ICsJfTsNCj4g
Pj4+DQo+ID4+DQo+ID4+IERvIHlvdSBmb3Jlc2VlIHVzaW5nIFNNQy9IVkMgZm9yIHRoaXMgZmly
bXdhcmUgZXZlbiBvbiBmdXR1cmUgcGxhdGZvcm1zPw0KPiA+PiBJZiBub3QsIEkgc3VnZ2VzdCB0
byBrZWVwIHRoZSBwcm90b2NvbCBwYXJ0IHNlcGFyYXRlIGZyb20gdGhlIHRyYW5zcG9ydCBpLmUu
DQo+ID4+IHNtYy9odmMgdmlhIEFURi4gSXQgY291bGQgYmUgcmVwbGFjZWQgd2l0aCBtYWlsYm94
IG9yIHNvbWUgaC93DQo+ID4+IG1lY2hhbmlzbSBpbiBmdXR1cmUgPw0KPiA+Pg0KPiA+DQo+ID4g
V2UgaGF2ZSBQU0NJIGFuZCBFRU1JIGludGVyZmFjZXMgZXhwb3NlZCB0byBsaW51eCBmcm9tIEFU
Ri4gUFNDSSBpcyBhbg0KPiA+IEVFTUkgY2xpZW50LiBXZSBkbyBub3QgaGF2ZSBjdXJyZW50IHBs
YW5zIHRvIHN3aXRjaCB0byBtYWlsYm94IGFzIGl0DQo+ID4gd2lsbCByZXF1aXJlIDIgY29tbXVu
aWNhdGlvbiBjaGFubmVscyB0byBQTVUgYXMgUFNDSSBpcyB0aHJvdWdoIEFURi4NCj4gPg0KPiAN
Cj4gT0ssIGJ1dCBJIGp1c3Qgc2F3IHNvbWUgYmluZGluZ3MgdGhhdCBoYXMgbWFpbGJveCBpbnRl
cmZhY2UsIGhvbmVzdGx5IGl0J3MgZ2V0dGluZw0KPiB0b28gY29uZnVzaW5nIHdpdGggbXVsdGlw
bGUgc2VyaWVzIG9uIHRoZSBzYW1lIHRoaW5nIGZsb2F0aW5nIGFuZCBoZW5jZSBJDQo+IHJlcXVl
c3RlZCB0byBwdXQgaXQgdG9nZXRoZXIgYXMgb25lIHNlcmllcy4NCg0KTWFpbGJveCBiaW5kaW5n
IGlzIHVzZWQgZm9yIHBvd2VyIG1hbmFnZW1lbnQgZHJpdmVyLiBNYWlsYm94IGlzIG9ubHkgdXNl
ZCBmb3IgUE1VLT5BUFUgY29tbXVuaWNhdGlvbi4NCkFQVS0+UE1VIGNvbW11bmljYXRpb24gaXMg
YWx3YXlzIHRocm91Z2ggRUVNSSBmaXJtd2FyZSBpbnRlcmZhY2Ugd2hpY2ggaXMgdXNpbmcgU01D
L0hWQy4NCg0KDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IFN1ZGVlcA0K
