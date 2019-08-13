From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Subject: Re: [PATCH v4 13/14] net: phy: adin: add ethtool get_stats support
Date: Tue, 13 Aug 2019 05:48:53 +0000
Message-ID: <c3fdb21c40900dae0e52b02b98fe27924a76c256.camel@analog.com>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
         <20190812112350.15242-14-alexandru.ardelean@analog.com>
         <20190812143315.GS14290@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812143315.GS14290@lunn.ch>
Content-Language: en-US
Content-ID: <62EC167CBC703842B2016E467A3C42D8@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "andrew@lunn.ch" <andrew@lunn.ch>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCAyMDE5LTA4LTEyIGF0IDE2OjMzICswMjAwLCBBbmRyZXcgTHVubiB3cm90ZToNCj4g
W0V4dGVybmFsXQ0KPiANCj4gPiArc3RhdGljIGludCBhZGluX3JlYWRfbW1kX3N0YXRfcmVncyhz
dHJ1Y3QgcGh5X2RldmljZSAqcGh5ZGV2LA0KPiA+ICsJCQkJICAgc3RydWN0IGFkaW5faHdfc3Rh
dCAqc3RhdCwNCj4gPiArCQkJCSAgIHUzMiAqdmFsKQ0KPiA+ICt7DQo+ID4gKwlpbnQgcmV0Ow0K
PiA+ICsNCj4gPiArCXJldCA9IHBoeV9yZWFkX21tZChwaHlkZXYsIE1ESU9fTU1EX1ZFTkQxLCBz
dGF0LT5yZWcxKTsNCj4gPiArCWlmIChyZXQgPCAwKQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4g
Kw0KPiA+ICsJKnZhbCA9IChyZXQgJiAweGZmZmYpOw0KPiA+ICsNCj4gPiArCWlmIChzdGF0LT5y
ZWcyID09IDApDQo+ID4gKwkJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsJcmV0ID0gcGh5X3JlYWRf
bW1kKHBoeWRldiwgTURJT19NTURfVkVORDEsIHN0YXQtPnJlZzIpOw0KPiA+ICsJaWYgKHJldCA8
IDApDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwkqdmFsIDw8PSAxNjsNCj4gPiAr
CSp2YWwgfD0gKHJldCAmIDB4ZmZmZik7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30N
Cj4gDQo+IEl0IHN0aWxsIGxvb2tzIGxpa2UgeW91IGhhdmUgbm90IGRlYWx0IHdpdGggb3ZlcmZs
b3cgZnJvbSB0aGUgTFNCIGludG8NCj4gdGhlIE1TQiBiZXR3ZWVuIHRoZSB0d28gcmVhZHMuDQoN
CkFwb2xvZ2llcyBmb3IgZm9yZ2V0dGluZyB0byBhZGRyZXNzIHRoaXMuDQpJIGRpZCBub3QgaW50
ZW50aW9uYWxseSBsZWF2ZSBpdCBvdXQ7IHRoaXMgaXRlbSBnb3QgbG9zdCBhZnRlciBWMSBbd2hp
Y2ggaGFkIHRoZSBtb3N0IHJlbWFya3NdLg0KQ2hhbmdlbG9nIFYxIC0+IFYyIHdhcyBxdWl0ZSBi
dWxreSwgYW5kIEkgZGlkIG5vdCBsb29rIGF0IFYxIHJlbWFya3MgYWZ0ZXIgSSBmaW5pc2hlZCBW
Mi4NCg0KVGhhbmtzIGZvciBzbmlwcGV0Lg0KDQo+IA0KPiAJZG8gew0KPiAJCWhpMSA9IHBoeV9y
ZWFkX21tZChwaHlkZXYsIE1ESU9fTU1EX1ZFTkQxLCBzdGF0LT5yZWcyKTsNCj4gCQlpZiAoaGkx
IDwgMCkNCj4gCQkJcmV0dXJuIGhpMTsNCj4gCQkNCj4gCQlsb3cgPSBwaHlfcmVhZF9tbWQocGh5
ZGV2LCBNRElPX01NRF9WRU5EMSwgc3RhdC0+cmVnMSk7DQo+IAkJaWYgKGxvdyA8IDApDQo+IAkJ
CXJldHVybiBsb3c7DQo+IA0KPiAJCWhpMiA9IHBoeV9yZWFkX21tZChwaHlkZXYsIE1ESU9fTU1E
X1ZFTkQxLCBzdGF0LT5yZWcyKTsNCj4gCQlpZiAoaGkyIDwgMCkNCj4gCQkJcmV0dXJuIGhpMTsN
Cj4gCX0gd2hpbGUgKGhpMSAhPSBoaTIpDQo+IA0KPiAJcmV0dXJuIGxvdyB8IChoaSA8PCAxNik7
DQo+IA0KPiAJQW5kcmV3DQo=
