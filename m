From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v5 1/4] dt-bindings: firmware: Add bindings for ZynqMP
 firmware
Date: Tue, 13 Mar 2018 18:56:38 +0000
Message-ID: <DM2PR0201MB07676A546340135791F9F25EB8D20@DM2PR0201MB0767.namprd02.prod.outlook.com>
References: <1519154467-2896-1-git-send-email-jollys@xilinx.com>
 <1519154467-2896-2-git-send-email-jollys@xilinx.com>
 <778329dd-76a7-0151-26d9-30e87e0c888d@arm.com>
 <CY1PR0201MB0764FB23021F5DC694C7F56DB8D80@CY1PR0201MB0764.namprd02.prod.outlook.com>
 <f6a416b7-542f-a3c3-538f-8549cf4e96c3@arm.com>
 <DM2PR0201MB07678A47B5380DC14E6F6126B8D30@DM2PR0201MB0767.namprd02.prod.outlook.com>
 <755770ba-d110-8b2e-3c1f-9b65686dc51f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <755770ba-d110-8b2e-3c1f-9b65686dc51f@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "mingo@kernel.org" <mingo@kernel.org>, "keescook@chromium.org" <keescook@chromium.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, Rajan Vaja <RAJANV@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3VkZWVwIEhvbGxhIFtt
YWlsdG86c3VkZWVwLmhvbGxhQGFybS5jb21dDQo+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDEzLCAy
MDE4IDM6MTYgQU0NCj4gVG86IEpvbGx5IFNoYWggPEpPTExZU0B4aWxpbnguY29tPg0KPiBDYzog
U3VkZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT47IGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnOw0KPiBtYXR0QGNvZGVibHVlcHJpbnQuY28udWs7IGhrYWxsd2VpdDFAZ21haWwuY29t
OyBtaWNoYWwuc2ltZWtAeGlsaW54LmNvbTsNCj4gcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1
dGxhbmRAYXJtLmNvbTsgYXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZzsNCj4gbWluZ29Aa2VybmVs
Lm9yZzsga2Vlc2Nvb2tAY2hyb21pdW0ub3JnOyBkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tOw0K
PiBSYWphbiBWYWphIDxSQUpBTlZAeGlsaW54LmNvbT47IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMS80XSBkdC1iaW5k
aW5nczogZmlybXdhcmU6IEFkZCBiaW5kaW5ncyBmb3IgWnlucU1QDQo+IGZpcm13YXJlDQo+IA0K
PiANCj4gDQo+IE9uIDEyLzAzLzE4IDIzOjA3LCBKb2xseSBTaGFoIHdyb3RlOg0KPiA+IEhpIFN1
ZGVlcCwNCj4gDQo+ID4+Pj4gRG8geW91IGZvcmVzZWUgdXNpbmcgU01DL0hWQyBmb3IgdGhpcyBm
aXJtd2FyZSBldmVuIG9uIGZ1dHVyZQ0KPiBwbGF0Zm9ybXM/DQo+ID4+Pj4gSWYgbm90LCBJIHN1
Z2dlc3QgdG8ga2VlcCB0aGUgcHJvdG9jb2wgcGFydCBzZXBhcmF0ZSBmcm9tIHRoZSB0cmFuc3Bv
cnQgaS5lLg0KPiA+Pj4+IHNtYy9odmMgdmlhIEFURi4gSXQgY291bGQgYmUgcmVwbGFjZWQgd2l0
aCBtYWlsYm94IG9yIHNvbWUgaC93DQo+ID4+Pj4gbWVjaGFuaXNtIGluIGZ1dHVyZSA/DQo+ID4+
Pj4NCj4gPj4+DQo+ID4+PiBXZSBoYXZlIFBTQ0kgYW5kIEVFTUkgaW50ZXJmYWNlcyBleHBvc2Vk
IHRvIGxpbnV4IGZyb20gQVRGLiBQU0NJIGlzDQo+ID4+PiBhbiBFRU1JIGNsaWVudC4gV2UgZG8g
bm90IGhhdmUgY3VycmVudCBwbGFucyB0byBzd2l0Y2ggdG8gbWFpbGJveCBhcw0KPiA+Pj4gaXQg
d2lsbCByZXF1aXJlIDIgY29tbXVuaWNhdGlvbiBjaGFubmVscyB0byBQTVUgYXMgUFNDSSBpcyB0
aHJvdWdoIEFURi4NCj4gPj4+DQo+ID4+DQo+ID4+IE9LLCBidXQgSSBqdXN0IHNhdyBzb21lIGJp
bmRpbmdzIHRoYXQgaGFzIG1haWxib3ggaW50ZXJmYWNlLCBob25lc3RseQ0KPiA+PiBpdCdzIGdl
dHRpbmcgdG9vIGNvbmZ1c2luZyB3aXRoIG11bHRpcGxlIHNlcmllcyBvbiB0aGUgc2FtZSB0aGlu
Zw0KPiA+PiBmbG9hdGluZyBhbmQgaGVuY2UgSSByZXF1ZXN0ZWQgdG8gcHV0IGl0IHRvZ2V0aGVy
IGFzIG9uZSBzZXJpZXMuDQo+ID4NCj4gPiBNYWlsYm94IGJpbmRpbmcgaXMgdXNlZCBmb3IgcG93
ZXIgbWFuYWdlbWVudCBkcml2ZXIuIE1haWxib3ggaXMgb25seQ0KPiA+IHVzZWQgZm9yIFBNVS0+
QVBVIGNvbW11bmljYXRpb24uIEFQVS0+UE1VIGNvbW11bmljYXRpb24gaXMgYWx3YXlzDQo+ID4g
dGhyb3VnaCBFRU1JIGZpcm13YXJlIGludGVyZmFjZSB3aGljaCBpcyB1c2luZyBTTUMvSFZDLg0K
PiA+DQo+IA0KPiBBaCBPSywgaXMgaXQgYmVjYXVzZSB0aGVyZSdzIG5vIG5vbi1zZWN1cmUgbWFp
bGJveCBvciB0byBhdm9pZCByYWNlcywgYWxsIG5vbi0NCj4gc2VjdXJlIEVFTUkgaXMgY2hhbm5l
bGVkIHRocm91Z2ggU01DID8NCj4gDQoNCjIgcmVhc29uczoNCjE+IEF2b2lkIG11bHRpcGxlIEVF
TUkgY29tbXVuaWNhdGlvbiBjaGFubmVscyBhcyBQU0NJIGlzIHRocm91Z2ggQVRGLg0KMj4gV2Ug
aGF2ZSBzb21lIHNlY3VyZSBvcGVyYXRpb25zIGhhbmRsZWQgaW4gQVRGIGJlY2F1c2Ugb2YgbWVt
b3J5IGNvbnN0cmFpbnRzIG9uIFBNVQ0KDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IFN1ZGVlcA0K
