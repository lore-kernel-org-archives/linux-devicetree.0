From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v9 07/10] firmware: xilinx: Add debugfs for IOCTL API
Date: Tue, 17 Jul 2018 20:01:40 +0000
Message-ID: <SN1PR02MB3758432C38CC9580BC96182DB85C0@SN1PR02MB3758.namprd02.prod.outlook.com>
References: <1529516435-7315-1-git-send-email-jollys@xilinx.com>
 <1529516435-7315-8-git-send-email-jollys@xilinx.com>
 <153111415833.143105.8701882244160397855@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153111415833.143105.8701882244160397855@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, Michal Simek <michals@xilinx.com>, "mingo@kernel.org" <mingo@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>
Cc: Rajan Vaja <RAJANV@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgU3RlcGhlbiwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3LA0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IFN0ZXBoZW4gQm95ZCBbbWFpbHRvOnNib3lkQGtlcm5lbC5v
cmddDQo+IFNlbnQ6IFN1bmRheSwgSnVseSAwOCwgMjAxOCAxMDoyOSBQTQ0KPiBUbzogSm9sbHkg
U2hhaCA8Sk9MTFlTQHhpbGlueC5jb20+OyBhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnOw0KPiBk
bWl0cnkudG9yb2tob3ZAZ21haWwuY29tOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsNCj4g
aGthbGx3ZWl0MUBnbWFpbC5jb207IGtlZXNjb29rQGNocm9taXVtLm9yZzsgbGludXgtY2xrQHZn
ZXIua2VybmVsLm9yZzsNCj4gbWFyay5ydXRsYW5kQGFybS5jb207IG1hdHRAY29kZWJsdWVwcmlu
dC5jby51azsgTWljaGFsIFNpbWVrDQo+IDxtaWNoYWxzQHhpbGlueC5jb20+OyBtaW5nb0BrZXJu
ZWwub3JnOyBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsNCj4gcm9iaCtkdEBrZXJuZWwub3JnOyBz
Ym95ZEBjb2RlYXVyb3JhLm9yZzsgc3VkZWVwLmhvbGxhQGFybS5jb20NCj4gQ2M6IFJhamFuIFZh
amEgPFJBSkFOVkB4aWxpbnguY29tPjsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsgSm9sbHkgU2hhaA0KPiA8Sk9MTFlTQHhpbGlueC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjkgMDcvMTBdIGZpcm13YXJlOiB4aWxpbng6IEFkZCBkZWJ1Z2ZzIGZvciBJT0NU
TCBBUEkNCj4gDQo+IFF1b3RpbmcgSm9sbHkgU2hhaCAoMjAxOC0wNi0yMCAxMDo0MDozMikNCj4g
PiBGcm9tOiBSYWphbiBWYWphIDxyYWphbnZAeGlsaW54LmNvbT4NCj4gPg0KPiA+IEFkZCBkZWJ1
Z2ZzIGZpbGUgdG8gc2V0L2dldCBJT0NUTCB1c2luZyBkZWJ1Z2ZzIGludGVyZmFjZS4NCj4gDQo+
IElPQ1RMcyBhbmQgZGVidWdmcyBhcmVuJ3QgdGhlIHNhbWUgdGhpbmcuIFdoeSBhcmUgdGhlIHR3
byBiZWluZyBtaXhlZA0KPiB0b2dldGhlcj8gSXMgc29tZSBzb3J0IG9mIHVzZXJzcGFjZSBBQkkg
YmVpbmcgY3JlYXRlZCBoZXJlIHRvIGNvbnRyb2wgY2xrcyB3aXRoDQo+IHVzZXJtb2RlIGRyaXZl
cnM/DQoNClRoaXMgaXMgbm90IHN0YW5kYXJkIGlvY3RsLiBUaGlzIGlzIHR5cGUgb2YgWnlucU1Q
IEFQSSBqdXN0IGxpa2Ugb3RoZXIgQVBJcy4gVGhpcyBkZWJ1Z2ZzIGlzIGNyZWF0ZWQgdG8gZGVi
dWcgWnlucU1QIElPQ1RMIEFQSS4NCg0KVGhhbmtzLA0KSm9sbHkgU2hhaA0K
