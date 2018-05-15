From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v6 04/11] firmware: xilinx: Add query data API
Date: Tue, 15 May 2018 20:29:15 +0000
Message-ID: <SN1PR02MB375832594C7B5684888B213BB8930@SN1PR02MB3758.namprd02.prod.outlook.com>
References: <1523389127-14243-1-git-send-email-jollys@xilinx.com>
 <1523389127-14243-5-git-send-email-jollys@xilinx.com>
 <85f8f8c5-a177-dad8-e095-a9dd1c513e8d@arm.com>
 <SN1PR02MB37587E3AB2718E1DB510E35AB89C0@SN1PR02MB3758.namprd02.prod.outlook.com>
 <ab9632f5-882d-462d-d830-0316cad56baf@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ab9632f5-882d-462d-d830-0316cad56baf@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "mingo@kernel.org" <mingo@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Rajan Vaja <RAJANV@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgU3VkZWVwLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN1ZGVl
cCBIb2xsYSBbbWFpbHRvOnN1ZGVlcC5ob2xsYUBhcm0uY29tXQ0KPiBTZW50OiBUdWVzZGF5LCBN
YXkgMTUsIDIwMTggMjozNCBBTQ0KPiBUbzogSm9sbHkgU2hhaCA8Sk9MTFlTQHhpbGlueC5jb20+
OyBhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnOw0KPiBtaW5nb0BrZXJuZWwub3JnOyBncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZzsgbWF0dEBjb2RlYmx1ZXByaW50LmNvLnVrOw0KPiBoa2FsbHdl
aXQxQGdtYWlsLmNvbTsga2Vlc2Nvb2tAY2hyb21pdW0ub3JnOw0KPiBkbWl0cnkudG9yb2tob3ZA
Z21haWwuY29tOyBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsNCj4gc2JveWRAY29kZWF1cm9yYS5v
cmc7IG1pY2hhbC5zaW1la0B4aWxpbnguY29tOyByb2JoK2R0QGtlcm5lbC5vcmc7DQo+IG1hcmsu
cnV0bGFuZEBhcm0uY29tOyBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnDQo+IENjOiBTdWRlZXAg
SG9sbGEgPHN1ZGVlcC5ob2xsYUBhcm0uY29tPjsgUmFqYW4gVmFqYSA8UkFKQU5WQHhpbGlueC5j
b20+Ow0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjYgMDQvMTFdIGZpcm13YXJlOiB4aWxpbng6IEFkZCBxdWVyeSBkYXRh
IEFQSQ0KPiANCj4gDQo+IA0KPiBPbiAxNC8wNS8xOCAyMDoxNiwgSm9sbHkgU2hhaCB3cm90ZToN
Cj4gPiBISSBTdWRlZXAsDQo+ID4NCj4gDQo+IFsuLi5dDQo+IA0KPiA+Pg0KPiA+PiBDYW4geW91
IGdpdmUgbW9yZSBpbnNpZ2h0IGludG8gdGhpcyA/IEhvdyB3aWxsIGJlIHRoaXMgdXNlZCA/IEhv
dw0KPiA+PiB0aGlzIGFsaWducyB3aXRoIGRhdGEgd2UgZ2V0IGZyb20gRFQgPyBJIGFtIGp1c3Qg
dHJ5aW5nIHRvIHVuZGVyc3RhbmQNCj4gPj4gaG93IGlzIHRoaXMgaW5mb3JtYXRpb24gc3BsaXQg
YmV0d2VlbiB0aGlzIEFQSSBhbmQgRFQgZm9yIGV4YW1wbGUuDQo+ID4+DQo+ID4NCj4gPiBUaGlz
IEFQSSBpcyB1c2VkIHRvIGdldCBjbG9jayBpbmZvcm1hdGlvbiBmcm9tIGZpcm13YXJlIGFuZCBy
ZWdpc3Rlcg0KPiA+IGNsb2NrcyBhY2NvcmRpbmdseSBpbiBkcml2ZXIuIEluIG91ciBjYXNlLCBm
aXJtd2FyZSBtYWludGFpbnMgZGF0YWJhc2UNCj4gPiBvZiBhbGwgY2xvY2tzIGF2YWlsYWJsZSBv
biBjaGlwLiBEVCB3aWxsIHByb3ZpZGUgaW5mb3JtYXRpb24gZm9yIG9mZg0KPiA+IGNoaXAgcmVm
ZXJlbmNlIGNsb2NrcyBvbmx5LiBUaGlzIGlzIHRvIGF2b2lkIGR1cGxpY2F0aW9uIG9mIGNsb2Nr
cw0KPiA+IGRhdGEgaW4gRFQgYW5kIGZpcm13YXJlIGJvdGggYXMgZmlybXdhcmUgYW55d2F5cyBu
ZWVkIGNsb2NrIGRhdGEgdG8NCj4gPiBtYW5hZ2UgdGhlbS4NCj4gPg0KPiANCj4gSSB3YW50ZWQg
dG8gdW5kZXJzdGFuZCB0aGUgZGlmZmVyZW5jZSB3aXRoIGV4YW1wbGUuIFdoYXQga2luZCBvZiBp
bmZvcm1hdGlvbg0KPiB5b3UgZ2V0IGZyb20gRFQgYW5kIHdoYXQgeW91IGdldCBmcm9tIGZpcm13
YXJlID8NCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IFN1ZGVlcA0KDQoNCkJlbG93IGlzIGFuIGV4
YW1wbGUgc2hvd2luZyBQTEwgYW5kIExlYWYgY2xvY2sgZGVyaXZhdGlvbjoNCg0KSW5wdXQgcmVm
IGNsb2Nrcy0+TXV4LT5NdWx0aXBsaWVyL0RpdmlkZXItPlBMTCoNClBsbDEvcGxsMi9wbGwzL3Bs
bDQtPk11eC0+RGl2aWRlci0+R2F0ZS0+TGVhZiBjbG9jazENCg0KSGVyZSBPZmYgY2hpcCBpbnB1
dCByZWYgY2xvY2sgaW5mb3JtYXRpb24gY29tZXMgZnJvbSBEVC4NClJlc3QgaW5mb3JtYXRpb24g
Zm9yIFBsbC9sZWFmIGNsb2NrcyBjb21lIGZyb20gZmlybXdhcmUgdXNpbmcgcXVlcnkgQVBJLiBG
b3IgY2xvY2sgZHJpdmVyLCBxdWVyeSBBUEkgaXMgdXNlZCB0byBnZXQgdG9wb2xvZ3ksIGZsYWdz
LCBwYXJlbnRzIGV0YyBpbmZvcm1hdGlvbiBwZXIgY2xvY2suDQoNClRoYW5rcywNCkpvbGx5IFNo
YWgNCg==
