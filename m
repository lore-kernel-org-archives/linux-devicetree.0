From: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
Date: Tue, 18 Jun 2019 23:40:20 +0000
Message-ID: <5172a1fc3b249b84c1f2c65631a7a4fbc47ad571.camel@wdc.com>
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
         <CAAhSdy3zODw=JFaN=2F4K5-umihJDivLO8J8LBdkFkuZgzu41Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAhSdy3zODw=JFaN=2F4K5-umihJDivLO8J8LBdkFkuZgzu41Q@mail.gmail.com>
Content-Language: en-US
Content-ID: <17C38DEF824F8D47BC6F2EA0CBD171D3@namprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "anup@brainfault.org" <anup@brainfault.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@sifive.com" <palmer@sifive.com>
Cc: "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, Alistair Francis <Alistair.Francis@wdc.com>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "yash.shah@sifive.com" <yash.shah@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ynezz@true.cz" <ynezz@true.cz>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sachin.ghadi@sifive.com" <sachin.ghadi@sifive.com>, "jamez@wit.com" <jamez@wit.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "schwab@suse.de" <schwab@suse.de>, "lukas.auer@aisec.fraunhofer.de" <lukas.auer@aisec.fraunhofer.de>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAyMDE5LTA2LTE4IGF0IDE1OjAyICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOg0KPiBP
biBUdWUsIEp1biAxOCwgMjAxOSBhdCA4OjU2IEFNIFBhdWwgV2FsbXNsZXkgPA0KPiBwYXVsLndh
bG1zbGV5QHNpZml2ZS5jb20+IHdyb3RlOg0KPiA+IE9uIE1vbiwgMTcgSnVuIDIwMTksIEFsaXN0
YWlyIEZyYW5jaXMgd3JvdGU6DQo+ID4gDQo+ID4gPiA+IFRoZSBsZWdhY3kgTS1tb2RlIFUtYm9v
dCBoYW5kbGVzIHRoZSBwaHkgcmVzZXQgYWxyZWFkeSwgYW5kDQo+ID4gPiA+IEnigJl2ZSBiZWVu
DQo+ID4gPiA+IGFibGUgdG8gbG9hZCB1cHN0cmVhbSBTLW1vZGUgdWJvb3QgYXMgYSBwYXlsb2Fk
IHZpYSBURlRQLCBhbmQNCj4gPiA+ID4gdGhlbg0KPiA+ID4gPiBsb2FkIGFuZCBib290IGEgNC4x
OSBrZXJuZWwuDQo+ID4gPiA+IA0KPiA+ID4gPiBJdCB3b3VsZCBiZSBuaWNlIHRvIGdldCB0aGlz
IGFsbCB3b3JraW5nIHdpdGggNS54LCBob3dldmVyDQo+ID4gPiA+IHRoZXJlIGFyZQ0KPiA+ID4g
PiBzdGlsbA0KPiA+ID4gPiBzZXZlcmFsIG1pc3NpbmcgcGllY2VzIHRvIHJlYWxseSBoYXZlIGl0
IHdvcmsgd2VsbC4NCj4gPiA+IA0KPiA+ID4gTGV0IG1lIGtub3cgd2hhdCBpcyBzdGlsbCBtaXNz
aW5nL2RvZXNuJ3Qgd29yayBhbmQgSSBjYW4gYWRkIGl0Lg0KPiA+ID4gQXQgdGhlDQo+ID4gPiBt
b21lbnQgdGhlIG9ubHkga25vd24gaXNzdWUgSSBrbm93IG9mIGlzIGEgbWlzc2luZyBTRCBjYXJk
IGRyaXZlcg0KPiA+ID4gaW4gVS0NCj4gPiA+IEJvb3QuDQo+ID4gDQo+ID4gVGhlIERUIGRhdGEg
aGFzIGNoYW5nZWQgYmV0d2VlbiB0aGUgbm9uLXVwc3RyZWFtIGRhdGEgdGhhdCBwZW9wbGUNCj4g
PiBkZXZlbG9wZWQgYWdhaW5zdCBwcmV2aW91c2x5LCB2cy4gdGhlIERUIGRhdGEgdGhhdCBqdXN0
IHdlbnQNCj4gPiB1cHN0cmVhbQ0KPiA+IGhlcmU6DQo+ID4gDQo+ID4gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1p
dC8/aWQ9NzIyOTZiZGU0ZjQyMDc1NjY4NzJlZTM1NTk1MGE1OWNiYzI5Zjg1Mg0KPiA+IA0KPiA+
IGFuZA0KPiA+IA0KPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPWMzNWYxYjg3ZmM1OTU4MDdmZjE1
ZDI4MzRkMjQxZjk3NzE0OTcyMDUNCj4gPiANCj4gPiBTbyBVcHN0cmVhbSBVLUJvb3QgaXMgZ29p
bmcgdG8gbmVlZCBzZXZlcmFsIHBhdGNoZXMgdG8gZ2V0IHRoaW5ncw0KPiA+IHdvcmtpbmcNCj4g
PiBhZ2Fpbi4gIENsb2NrIGlkZW50aWZpZXJzIGFuZCBFdGhlcm5ldCBhcmUgdHdvIGtub3duIGFy
ZWFzLg0KPiANCj4gRG9uZS4NCj4gDQo+IEkganVzdCBzZW5kLW91dCBmZXcgcGF0Y2hlcyB0byBm
aXggVS1Cb290IFNpRml2ZSBDbG9jayBkcml2ZXIuDQo+IA0KPiBUaGUgVS1Cb290IFNpRml2ZSBD
bG9jayBkcml2ZXIgZml4IHNlcmllcyBjYW4gYmUgZm91bmQgaW4NCj4gcmlzY3ZfdW5sZWFzaGVk
X2Nsa19zeW5jX3YxIGJyYW5jaCBvZjoNCj4gaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvdS1i
b290LmdpdA0KPiANCj4gVXNlcnMgd2lsbCBhbHNvIHJlcXVpcmUgT3BlblNCSSBEVEIgZml4IHdo
aWNoIGNhbiBiZSBmb3VuZA0KPiBpbiBzaWZpdmVfdW5sZWFzaGVkX2R0Yl9maXhfdjEgYnJhbmNo
IG9mOg0KPiBodHRwczovL2dpdGh1Yi5jb20vYXZwYXRlbC9vcGVuc2JpLmdpdA0KPiANCg0KQWRk
aXRpb25hbGx5LCB1c2VyIGNhbiBhbHNvIHVzZSBGV19QQVlMT0FEX0ZEVF9QQVRIIGFyZ3VtZW50
IGR1cmluZw0KYnVpbGQgdG8gaW5jbHVkZSB0aGUgZHRiIGJ1aWx0IGZyb20ga2VybmVsLg0KDQpl
eGFtcGxlOg0KbWFrZSAtaiAzMiBQTEFURk9STT1zaWZpdmUvZnU1NDAgRldfUEFZTE9BRF9QQVRI
PTx1LWJvb3QgcGF0aD4vdS0NCmJvb3QuYmluIEZXX1BBWUxPQURfRkRUX1BBVEg9PGtlcm5lbF9k
dGJfcGF0aD4NCg0KDQo+IFdpdGggYWJvdmUgZml4ZXMsIHdlIGNhbiBub3cgdXNlIHNhbWUgRFRC
IGZvciBib3RoIFUtQm9vdA0KPiBhbmQgTGludXgga2VybmVsICg1LjItcmMxKS4gQWx0aG91Z2gs
IHVzZXJzIGFyZSBmcmVlIHRvIHBhc3MgYQ0KPiBkaWZmZXJlbnQgRFRCIHRvIExpbnV4IGtlcm5l
bCB2aWEgVEZUUC4NCj4gDQo+IEkgaGF2ZSB0ZXN0ZWQgU2lGaXZlIHNlcmlhbCBhbmQgQ2FkYW5j
ZSBNQUNCIGV0aGVybmV0IG9uDQo+IGJvdGggVS1Cb290IGFuZCBMaW51eCAoNS4yLXJjMSkNCj4g
DQo+IFJlZ2FyZHMsDQo+IEFudXANCi0tIA0KUmVnYXJkcywNCkF0aXNoDQo=
