From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Subject: Re: [PATCH v4 2/2] net: phy: adin: implement Energy Detect Powerdown
 mode via phy-tunable
Date: Mon, 16 Sep 2019 06:44:23 +0000
Message-ID: <d19897f450cc22a629e0c408b72fbc702ca8fe8c.camel@analog.com>
References: <20190912162812.402-1-alexandru.ardelean@analog.com>
         <20190912162812.402-3-alexandru.ardelean@analog.com>
         <20190914152931.GK27922@lunn.ch>
         <53816513-436e-b33b-99cf-18fa98e468b1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <53816513-436e-b33b-99cf-18fa98e468b1@gmail.com>
Content-Language: en-US
Content-ID: <F3CA00B51D26304BA3FD7223515506E0@namprd03.prod.outlook.com>
Sender: netdev-owner@vger.kernel.org
To: "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "andrew@lunn.ch" <andrew@lunn.ch>
Cc: "mkubecek@suse.cz" <mkubecek@suse.cz>, "davem@davemloft.net" <davem@davemloft.net>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

T24gU3VuLCAyMDE5LTA5LTE1IGF0IDA4OjExIC0wNzAwLCBGbG9yaWFuIEZhaW5lbGxpIHdyb3Rl
Og0KPiBbRXh0ZXJuYWxdDQo+IA0KPiANCj4gDQo+IE9uIDkvMTQvMjAxOSA4OjI5IEFNLCBBbmRy
ZXcgTHVubiB3cm90ZToNCj4gPiBPbiBUaHUsIFNlcCAxMiwgMjAxOSBhdCAwNzoyODoxMlBNICsw
MzAwLCBBbGV4YW5kcnUgQXJkZWxlYW4gd3JvdGU6DQo+ID4gDQo+ID4gPiArc3RhdGljIGludCBh
ZGluX3NldF9lZHBkKHN0cnVjdCBwaHlfZGV2aWNlICpwaHlkZXYsIHUxNiB0eF9pbnRlcnZhbCkN
Cj4gPiA+ICt7DQo+ID4gPiArCXUxNiB2YWw7DQo+ID4gPiArDQo+ID4gPiArCWlmICh0eF9pbnRl
cnZhbCA9PSBFVEhUT09MX1BIWV9FRFBEX0RJU0FCTEUpDQo+ID4gPiArCQlyZXR1cm4gcGh5X2Ns
ZWFyX2JpdHMocGh5ZGV2LCBBRElOMTMwMF9QSFlfQ1RSTF9TVEFUVVMyLA0KPiA+ID4gKwkJCQko
QURJTjEzMDBfTlJHX1BEX0VOIHwgQURJTjEzMDBfTlJHX1BEX1RYX0VOKSk7DQo+ID4gPiArDQo+
ID4gPiArCXZhbCA9IEFESU4xMzAwX05SR19QRF9FTjsNCj4gPiA+ICsNCj4gPiA+ICsJc3dpdGNo
ICh0eF9pbnRlcnZhbCkgew0KPiA+ID4gKwljYXNlIDEwMDA6IC8qIDEgc2Vjb25kICovDQo+ID4g
PiArCQkvKiBmYWxsdGhyb3VnaCAqLw0KPiA+ID4gKwljYXNlIEVUSFRPT0xfUEhZX0VEUERfREZM
VF9UWF9NU0VDUzoNCj4gPiA+ICsJCXZhbCB8PSBBRElOMTMwMF9OUkdfUERfVFhfRU47DQo+ID4g
PiArCQkvKiBmYWxsdGhyb3VnaCAqLw0KPiA+ID4gKwljYXNlIEVUSFRPT0xfUEhZX0VEUERfTk9f
VFg6DQo+ID4gPiArCQlicmVhazsNCj4gPiA+ICsJZGVmYXVsdDoNCj4gPiA+ICsJCXJldHVybiAt
RUlOVkFMOw0KPiA+ID4gKwl9DQo+ID4gPiArDQo+ID4gPiArCXJldHVybiBwaHlfbW9kaWZ5KHBo
eWRldiwgQURJTjEzMDBfUEhZX0NUUkxfU1RBVFVTMiwNCj4gPiA+ICsJCQkgIChBRElOMTMwMF9O
UkdfUERfRU4gfCBBRElOMTMwMF9OUkdfUERfVFhfRU4pLA0KPiA+ID4gKwkJCSAgdmFsKTsNCj4g
PiA+ICt9DQo+ID4gPiArDQo+ID4gPiAgDQo+ID4gPiArCXJjID0gYWRpbl9zZXRfZWRwZChwaHlk
ZXYsIDEpOw0KPiA+ID4gKwlpZiAocmMgPCAwKQ0KPiA+ID4gKwkJcmV0dXJuIHJjOw0KPiA+IA0K
PiA+IEhpIEFsZXhhbmRydQ0KPiA+IA0KPiA+IFNob3VsZG4ndCB0aGlzIGJlIGFkaW5fc2V0X2Vk
cGQocGh5ZGV2LCAxMDAwKTsNCj4gDQo+IFRoYXQgZG9lcyBzb3VuZCBsaWtlIHRoZSBpbnRlbmRl
ZCB1c2UsIG9yIHVzZQ0KPiBFVEhUT09MX1BIWV9FRFBEX0RGTFRfVFhfTVNFQ1MsIHdpdGggdGhh
dCBmaXhlZDoNCg0KQWNrLg0KDQpNYW55IHRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcy4NCkkgbWlz
c2VkIGl0IHdoZW4gcmUtc3Bpbm5pbmcuDQoNCj4gDQo+IFJldmlld2VkLWJ5OiBGbG9yaWFuIEZh
aW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4NCg==
