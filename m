From: Christophe ROULLIER <christophe.roullier@st.com>
Subject: Re: [PATCH 0/5] net: ethernet: stmmac: some fixes and optimization
Date: Mon, 23 Sep 2019 07:46:11 +0000
Message-ID: <1d5dfc73-73e1-fe47-d1f6-9c24f9e5e532@st.com>
References: <20190920053817.13754-1-christophe.roullier@st.com>
 <20190922151257.51173d89@cakuba.netronome.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190922151257.51173d89@cakuba.netronome.com>
Content-Language: en-US
Content-ID: <83AB20E31971524C9CCD0202AF363D9C@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jakub Kicinski <jakub.kicinski@netronome.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "joabreu@synopsys.com" <joabreu@synopsys.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Peppe CAVALLARO <peppe.cavallaro@st.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "andrew@lunn.ch" <andrew@lunn.ch>
List-Id: devicetree@vger.kernel.org

SGkgSmFrdWIsIGFsbCwNCg0KSXQgaXMgbm90IHVyZ2VudCwgbm8gcHJvYmxlbSB0byB3YWl0IG5l
eHQgbWVyZ2Ugd2luZG93IChyZWxlYXNlIDUuNSkNCg0KRm9yIHBhdGNoIDEgYW5kIDMsIGl0IGlz
IGltcHJvdmVtZW50L2NsZWFudXAgYmVjYXVzZSBub3cgc3lzY2ZnIGNsb2NrIGlzIA0Kbm90IG1h
bmRhdG9yeSAoSSBwdXQgY29kZSBiYWNrd2FyZCBjb21wYXRpYmxlKS4NCg0KUmVnYXJkcywNCg0K
Q2hyaXN0b3BoZQ0KDQpPbiA5LzIzLzE5IDEyOjEyIEFNLCBKYWt1YiBLaWNpbnNraSB3cm90ZToN
Cj4gT24gRnJpLCAyMCBTZXAgMjAxOSAwNzozODoxMiArMDIwMCwgQ2hyaXN0b3BoZSBSb3VsbGll
ciB3cm90ZToNCj4+IFNvbWUgaW1wcm92ZW1lbnRzIChtYW5hZ2Ugc3lzY2ZnIGFzIG9wdGlvbmFs
IGNsb2NrLCB1cGRhdGUgc2xldyByYXRlIG9mDQo+PiBFVEhfTURJTyBwaW4sIEVuYWJsZSBnYXRp
bmcgb2YgdGhlIE1BQyBUWCBjbG9jayBkdXJpbmcgVFggbG93LXBvd2VyIG1vZGUpDQo+PiBGaXgg
d2FybmluZyBidWlsZCBtZXNzYWdlIHdoZW4gVz0xDQo+IFRoZXJlIHNlZW1zIHRvIGJlIHNvbWUg
bmV3IGZlYXR1cmVzL2NsZWFudXBzIChvciBpbXByb3ZlbWVudHMgYXMNCj4geW91IHNheSkgaGVy
ZS4gQ291bGQgeW91IGV4cGxhaW4gdGhlIG5lZ2F0aXZlIGltcGFjdCBub3QgYXBwbHlpbmcNCj4g
dGhlc2UgY2hhbmdlcyB3aWxsIGhhdmU/IFBhdGNoZXMgMSBhbmQgMyBpbiBwYXJ0aWN1bGFyLg0K
Pg0KPiBuZXQtbmV4dCBpcyBub3cgY2xvc2VkIFsxXSwgYW5kIHdpbGwgcmVvcGVuIHNvbWUgdGlt
ZSBhZnRlciB0aGUgbWVyZ2UNCj4gd2luZG93IGlzIG92ZXIuIEZvciBub3cgd2UgYXJlIG9ubHkg
ZXhwZWN0aW5nIGZpeGVzIGZvciB0aGUgbmV0IHRyZWUuDQo+DQo+IENvdWxkIHlvdSAoYSkgcHJv
dmlkZSBzdHJvbmdlciBtb3RpdmF0aW9uIHRoZXNlIGNoYW5nZXMgYXJlIGZpeGVzOyBvcg0KPiAo
Yikgc2VwYXJhdGUgdGhlIGZpeGVzIGZyb20gaW1wcm92ZW1lbnRzPw0KPg0KPiBUaGFuayB5b3Uh
DQo+DQo+IFsxXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9uZXR3b3Jr
aW5nL25ldGRldi1GQVEuaHRtbA==
