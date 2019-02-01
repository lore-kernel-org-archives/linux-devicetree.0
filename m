From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v6 3/3] drivers: soc: xilinx: Add ZynqMP PM driver
Date: Fri, 1 Feb 2019 18:44:36 +0000
Message-ID: <BYAPR02MB5992A4D0347DF535569DBC4EB8920@BYAPR02MB5992.namprd02.prod.outlook.com>
References: <1548794301-30483-1-git-send-email-jollys@xilinx.com>
 <1548794301-30483-4-git-send-email-jollys@xilinx.com>
 <20190130101236.GA27201@e107155-lin>
 <BYAPR02MB59926CC0829613B4B52A7D3EB8910@BYAPR02MB5992.namprd02.prod.outlook.com>
 <20190201121445.GD10042@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201121445.GD10042@e107155-lin>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "andy.gross@linaro.org" <andy.gross@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, Michal Simek <michals@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Rajan Vaja <RAJANV@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgU3VkZWVwLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN1ZGVl
cCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkg
MDEsIDIwMTkgNDoxNSBBTQ0KPiBUbzogSm9sbHkgU2hhaCA8Sk9MTFlTQHhpbGlueC5jb20+DQo+
IENjOiBtYXR0aGlhcy5iZ2dAZ21haWwuY29tOyBhbmR5Lmdyb3NzQGxpbmFyby5vcmc7IHNoYXdu
Z3VvQGtlcm5lbC5vcmc7DQo+IGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlOyBiam9ybi5hbmRlcnNz
b25AbGluYXJvLm9yZzsNCj4gc2Vhbi53YW5nQG1lZGlhdGVrLmNvbTsgbS5zenlwcm93c2tpQHNh
bXN1bmcuY29tOyBNaWNoYWwgU2ltZWsNCj4gPG1pY2hhbHNAeGlsaW54LmNvbT47IHJvYmgrZHRA
a2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207IFJhamFuDQo+IFZhamEgPFJBSkFOVkB4
aWxpbnguY29tPjsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS0NCj4ga2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NiAzLzNdIGRyaXZlcnM6IHNvYzogeGlsaW54OiBBZGQgWnlu
cU1QIFBNIGRyaXZlcg0KPiANCj4gT24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMDc6MDE6MDVQTSAr
MDAwMCwgSm9sbHkgU2hhaCB3cm90ZToNCj4gPiA+DQo+ID4gPiBOQUNLLCBpZiB0aGlzIGlzIGZv
ciBzeXN0ZW0gc3VzcGVuZC9yZXNldCA/IFlvdSBjYW4ganVzdCB1c2UgZXhpdGluZw0KPiA+ID4g
c3lzZnMsIG5vIG5lZWQgdG8gY3JlYXRlIFhpbGlueCBzcGVjaWZpYyBuZXcgb25lcy4gTW9yZW92
ZXIgeW91IG5lZWQgdG8NCj4gPiA+IHVzZSBQU0NJIHRvIG1ha2Ugc3VyZSBoaWdoZXIgRUxzIGNh
biBkbyBvcmRlcmx5IHN1c3BlbmQvc2h1dGRvd24uDQo+ID4gPg0KPiA+DQo+ID4gV2UgaGF2ZSBw
b3dlciBvZmYgc3VzcGVuZCBtb2RlIHdoaWNoIGlzIG5vdCBzdXBwb3J0ZWQgYnkgZXhpc3Rpbmcg
c3lzZnMgYW5kDQo+ID4gaGVuY2UgbmV3IG9uZSBpcyBuZWVkZWQuIFN1c3BlbmQgaXMgaGFuZGxl
ZCB0aHJvdWdoIFBTQ0kgaW50ZXJmYWNlIG9ubHkuDQo+ID4NCj4gDQo+IEkgc2VlIG9ubHkgMiBj
YXNlcyBzdXBwb3J0ZWQgU1VTUEVORF9TWVNURU1fU0hVVERPV04gYW5kDQo+IFNVU1BFTkRfUE9X
RVJfUkVRVUVTVC4gQm90aCBhcmUgYWxyZWFkeSBzdXBwb3J0IHNvIG15IE5BQ0sgc3RpbGwgc3Rh
bmRzLg0KDQpUaGUgMiBjYXNlcyhTVVNQRU5EX1NZU1RFTV9TSFVURE9XTiBhbmQgIFNVU1BFTkRf
UE9XRVJfUkVRVUVTVCApaW4gaXNyIGlzIGZvciByZW1vdGUgc3VzcGVuZC4gIFN5c2ZzIGlzIGZv
ciBzZWxmIHN1c3BlbmQgYW5kIGl0IHN1cHBvcnRzIFBNX1NVU1BFTkRfTU9ERV9TVEQgYW5kIFBN
X1NVU1BFTkRfTU9ERV9QT1dFUl9PRkYocG93ZXIgb2ZmIHN1c3BlbmQpLg0KDQpUaGFua3MsDQpK
b2xseSBTaGFoDQoNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IFN1ZGVlcA0K
