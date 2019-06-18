From: Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
Date: Tue, 18 Jun 2019 23:11:54 +0000
Message-ID: <e054e1c22cc52c41cea36b005de5a5ade0f8a23e.camel@wdc.com>
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com>
          <mvmtvco62k9.fsf@suse.de>
          <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com>
          <mvmpnnc5y49.fsf@suse.de>
          <alpine.DEB.2.21.9999.1906170305020.19994@viisi.sifive.com>
          <mvmh88o5xi5.fsf@suse.de>
          <alpine.DEB.2.21.9999.1906170419010.19994@viisi.sifive.com>
          <F48A4F7F-0B0D-4191-91AD-DC51686D1E78@sifive.com>
         <d2836a90b92f3522a398d57ab8555d08956a0d1f.camel@wdc.com>
         <alpine.DEB.2.21.9999.1906172019040.15057@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1906172019040.15057@viisi.sifive.com>
Content-Language: en-US
Content-ID: <B51FAF1422A4224AB60D396DA226F398@namprd04.prod.outlook.com>
Sender: netdev-owner@vger.kernel.org
To: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "palmer@sifive.com" <palmer@sifive.com>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "yash.shah@sifive.com" <yash.shah@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "sachin.ghadi@sifive.com" <sachin.ghadi@sifive.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "ynezz@true.cz" <ynezz@true.cz>, "jamez@wit.com" <jamez@wit.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "schwab@suse.de" <schwab@suse.de>, "troy.benjegerdes@sifive.com" <troy.benjegerdes@sifive.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCAyMDE5LTA2LTE3IGF0IDIwOjI2IC0wNzAwLCBQYXVsIFdhbG1zbGV5IHdyb3RlOg0K
PiBPbiBNb24sIDE3IEp1biAyMDE5LCBBbGlzdGFpciBGcmFuY2lzIHdyb3RlOg0KPiANCj4gPiA+
IFRoZSBsZWdhY3kgTS1tb2RlIFUtYm9vdCBoYW5kbGVzIHRoZSBwaHkgcmVzZXQgYWxyZWFkeSwg
YW5kIEnigJl2ZQ0KPiA+ID4gYmVlbg0KPiA+ID4gYWJsZSB0byBsb2FkIHVwc3RyZWFtIFMtbW9k
ZSB1Ym9vdCBhcyBhIHBheWxvYWQgdmlhIFRGVFAsIGFuZA0KPiA+ID4gdGhlbiANCj4gPiA+IGxv
YWQgYW5kIGJvb3QgYSA0LjE5IGtlcm5lbC4gDQo+ID4gPiANCj4gPiA+IEl0IHdvdWxkIGJlIG5p
Y2UgdG8gZ2V0IHRoaXMgYWxsIHdvcmtpbmcgd2l0aCA1LngsIGhvd2V2ZXIgdGhlcmUNCj4gPiA+
IGFyZQ0KPiA+ID4gc3RpbGwNCj4gPiA+IHNldmVyYWwgbWlzc2luZyBwaWVjZXMgdG8gcmVhbGx5
IGhhdmUgaXQgd29yayB3ZWxsLg0KPiA+IA0KPiA+IExldCBtZSBrbm93IHdoYXQgaXMgc3RpbGwg
bWlzc2luZy9kb2Vzbid0IHdvcmsgYW5kIEkgY2FuIGFkZCBpdC4gQXQNCj4gPiB0aGUNCj4gPiBt
b21lbnQgdGhlIG9ubHkga25vd24gaXNzdWUgSSBrbm93IG9mIGlzIGEgbWlzc2luZyBTRCBjYXJk
IGRyaXZlcg0KPiA+IGluIFUtDQo+ID4gQm9vdC4NCj4gDQo+IFRoZSBEVCBkYXRhIGhhcyBjaGFu
Z2VkIGJldHdlZW4gdGhlIG5vbi11cHN0cmVhbSBkYXRhIHRoYXQgcGVvcGxlIA0KPiBkZXZlbG9w
ZWQgYWdhaW5zdCBwcmV2aW91c2x5LCB2cy4gdGhlIERUIGRhdGEgdGhhdCBqdXN0IHdlbnQNCj4g
dXBzdHJlYW0gDQo+IGhlcmU6DQo+IA0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD03MjI5NmJkZTRm
NDIwNzU2Njg3MmVlMzU1OTUwYTU5Y2JjMjlmODUyDQo+IA0KPiBhbmQNCj4gDQo+IGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4Lmdp
dC9jb21taXQvP2lkPWMzNWYxYjg3ZmM1OTU4MDdmZjE1ZDI4MzRkMjQxZjk3NzE0OTcyMDUNCj4g
DQo+IFNvIFVwc3RyZWFtIFUtQm9vdCBpcyBnb2luZyB0byBuZWVkIHNldmVyYWwgcGF0Y2hlcyB0
byBnZXQgdGhpbmdzDQo+IHdvcmtpbmcgDQo+IGFnYWluLiAgQ2xvY2sgaWRlbnRpZmllcnMgYW5k
IEV0aGVybmV0IGFyZSB0d28ga25vd24gYXJlYXMuDQoNClllcCwgQW51cCBoYXMgc2VudCBwYXRj
aGVzIHRvIFUtQm9vdCBhbmQgT3BlblNCSS4NCg0KQWxpc3RhaXINCg0KPiANCj4gDQo+IC0gUGF1
bA0K
