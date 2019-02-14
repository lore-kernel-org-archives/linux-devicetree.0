From: Christophe ROULLIER <christophe.roullier@st.com>
Subject: Re: [PATCH 7/8] ARM: dts: stm32: Add Ethernet support on stm32h7 SOC
 and activate it for eval and disco boards
Date: Thu, 14 Feb 2019 14:55:51 +0000
Message-ID: <5c59f60a-2364-a4a8-117e-b485647fd88e@st.com>
References: <1550126763-22669-1-git-send-email-christophe.roullier@st.com>
 <1550126763-22669-8-git-send-email-christophe.roullier@st.com>
 <20190214134414.GB5699@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214134414.GB5699@lunn.ch>
Content-Language: en-US
Content-ID: <35B4D304070043499A7C310BE66315CA@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "robh@kernel.org" <robh@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "joabreu@synopsys.com" <joabreu@synopsys.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Peppe CAVALLARO <peppe.cavallaro@st.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

T24gMi8xNC8xOSAyOjQ0IFBNLCBBbmRyZXcgTHVubiB3cm90ZToNCj4gT24gVGh1LCBGZWIgMTQs
IDIwMTkgYXQgMDc6NDY6MDJBTSArMDEwMCwgQ2hyaXN0b3BoZSBSb3VsbGllciB3cm90ZToNCj4+
ICsJbWRpbzAgew0KPj4gKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+PiArCQkjc2l6ZS1jZWxs
cyA9IDwwPjsNCj4+ICsJCWNvbXBhdGlibGUgPSAic25wcyxkd21hYy1tZGlvIjsNCj4+ICsJCXBo
eTE6IGV0aGVybmV0LXBoeUAxIHsNCj4+ICsJCQlyZWcgPSA8MD47DQo+PiArCQl9Ow0KPiANCj4g
VGhlIHJlZyB2YWx1ZSBzaG91bGQgYmUgdGhlIHNhbWUgYXMgZXRoZXJuZXQtcGh5QFguDQo+IA0K
PiAgICAgIEFuZHJldw0KPj4gKwltZGlvMCB7DQo+PiArCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsN
Cj4+ICsJCSNzaXplLWNlbGxzID0gPDA+Ow0KPj4gKwkJY29tcGF0aWJsZSA9ICJzbnBzLGR3bWFj
LW1kaW8iOw0KPj4gKwkJcGh5MTogZXRoZXJuZXQtcGh5QDEgew0KPj4gKwkJCXJlZyA9IDwwPjsN
Cj4+ICsJCX07DQo+IA0KPiBIZXJlIGFzIHdlbGwuDQo+IA0KPiAgICAgICBBbmRyZXcNCj4gDQoN
CkhpIEFuZHJldywNCg0KT2sgSSB3aWxsIHVwZGF0ZS4NCg0KVGhhbmtzLg0KDQpDaHJpc3RvcGhl
