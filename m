From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v6 09/11] firmware: xilinx: Add debugfs for clock control
 APIs
Date: Fri, 25 May 2018 19:23:49 +0000
Message-ID: <SN1PR02MB3758876A011FFF46C71C8F6CB8690@SN1PR02MB3758.namprd02.prod.outlook.com>
References: <1523389127-14243-1-git-send-email-jollys@xilinx.com>
 <1523389127-14243-10-git-send-email-jollys@xilinx.com>
 <5bcc47f7-3352-f0e6-29c5-78d5be96c1d1@arm.com>
 <SN1PR02MB3758191654612CFC261A38BEB89C0@SN1PR02MB3758.namprd02.prod.outlook.com>
 <6579fdce-6845-70d5-1dc1-64d52debef19@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6579fdce-6845-70d5-1dc1-64d52debef19@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "mingo@kernel.org" <mingo@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Rajan Vaja <RAJANV@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgU3VkZWVwLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN1ZGVl
cCBIb2xsYSBbbWFpbHRvOnN1ZGVlcC5ob2xsYUBhcm0uY29tXQ0KPiBTZW50OiBUdWVzZGF5LCBN
YXkgMTUsIDIwMTggMTo1OCBBTQ0KPiBUbzogSm9sbHkgU2hhaCA8Sk9MTFlTQHhpbGlueC5jb20+
OyBhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnOw0KPiBtaW5nb0BrZXJuZWwub3JnOyBncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZzsgbWF0dEBjb2RlYmx1ZXByaW50LmNvLnVrOw0KPiBoa2FsbHdl
aXQxQGdtYWlsLmNvbTsga2Vlc2Nvb2tAY2hyb21pdW0ub3JnOw0KPiBkbWl0cnkudG9yb2tob3ZA
Z21haWwuY29tOyBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsNCj4gc2JveWRAY29kZWF1cm9yYS5v
cmc7IG1pY2hhbC5zaW1la0B4aWxpbnguY29tOyByb2JoK2R0QGtlcm5lbC5vcmc7DQo+IG1hcmsu
cnV0bGFuZEBhcm0uY29tOyBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnDQo+IENjOiBTdWRlZXAg
SG9sbGEgPHN1ZGVlcC5ob2xsYUBhcm0uY29tPjsgUmFqYW4gVmFqYSA8UkFKQU5WQHhpbGlueC5j
b20+Ow0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjYgMDkvMTFdIGZpcm13YXJlOiB4aWxpbng6IEFkZCBkZWJ1Z2ZzIGZv
ciBjbG9jayBjb250cm9sDQo+IEFQSXMNCj4gDQo+IA0KPiANCj4gT24gMTQvMDUvMTggMjA6MTgs
IEpvbGx5IFNoYWggd3JvdGU6DQo+ID4gSGkgU3VkZWVwLA0KPiANCj4gWy4uXQ0KPiANCj4gPj4N
Cj4gPj4gQXMgSSBtZW50aW9uZWQgaW4gZWFybGllciBwYXRjaCwgSSBkb24ndCBzZWUgdGhlIG5l
ZWQgZm9yIHRoaXMNCj4gPj4gZGVidWdmcyBpbnRlcmZhY2UuIENsb2NrIGxheSBoYXMgcmVhZC1v
bmx5IGludGVyZmFjZSBpbiBkZWJ1Z2ZzDQo+ID4+IGFscmVhZHkuIEFsc28gaWYgeW91IHdhbnQg
dG8gZGVidWcgY2xvY2tzLCB5b3UgY2FuIGRvIHNvIHVzaW5nIHRoZQ0KPiA+PiBkcml2ZXIgd2hp
Y2ggdXNlcyB0aGVzZSBjbG9ja3MuIERvIHlvdSByZWFsbHkgd2FudCB0byBtYW5hZ2UgY2xvY2tz
DQo+ID4+IGluIHVzZXItc3BhY2UgPyBUaGUgd2hvbGUgaWRlYSBvZiBFRU1JIGtpbmQgb2YgaW50
ZXJmYWNlIGlzIHRvDQo+ID4+IGFic3RyYWN0IGFuZCBoaWRlIHRoZSBmaW5lIGRldGFpbHMgZXZl
biBmcm9tIG5vbi10cnVzdGVkIHJpY2ggT1MgbGlrZQ0KPiA+PiBMaW51eCBrZXJuZWwsIGJ1dCBi
eSBwcm92aWRpbmcgdGhpcyB5b3UgYXJlIGRvaW5nIGV4YWN0bHkgb3Bwb3NpdGUuDQo+ID4NCj4g
PiBObyB3ZSBkb24ndCB3YW50IHRvIG1hbmFnZSBjbG9ja3MgaW4gdXNlci1zcGFjZS4gVGhpcyBk
ZWJ1Z2ZzIGlzIG1lYW50DQo+ID4gZm9yIGRldmVsb3BlciB3aG8gd2FudHMgdG8gZGVidWcgQVBJ
cyBiZWhhdmlvciBpbiBjYXNlIHNvbWV0aGluZw0KPiA+IGRvZXNuJ3Qgd29yayBhcyBleHBlY3Rl
ZC4gRGVidWdmcyBzaG91bGQgYmUgb2ZmIGJ5IGRlZmF1bHQgaW4NCj4gPiBwcm9kdWN0aW9uIGlt
YWdlcy4NCj4gPg0KPiANCj4gR29vZCB0aGF0IGl0J3Mgbm90IHVzZWQgaW4gcHJvZHVjdGlvbiBp
bWFnZS4gVGhlIGNsb2NrIGxheWVyIGhhcw0KPiAqc3VmZmljaWVudCogZGVidWdmcyBzdXBwb3J0
IHRoYXQgd2lsbCAqaGVscCBpbiBkZWJ1Z2dpbmcqLiBTbyBwbGVhc2UgZHJvcCB0aGlzDQo+IFhp
bGlueCBzcGVjaWZpYyBjbG9jayBkZWJ1Z2ZzLg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gU3Vk
ZWVwDQoNCk9rLiBXaWxsIHJlbW92ZSB0aGVtIGluIG5leHQgdmVyc2lvbi4gTGV0IG1lIGtub3cg
aWYgcmVzdCBjaGFuZ2VzIGxvb2sgb2sgYW5kIEkgY2FuIHN1Ym1pdCBmaW5hbCB2ZXJzaW9uIHdp
dGggc3VnZ2VzdGVkIG1pbm9yIGNoYW5nZXMuDQoNClRoYW5rcywNCkpvbGx5IFNoYWgNCg0KDQo=
