From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: Re: [PATCH 1/3] ARM: dts: stm32: add stpmic1 support on stm32mp157c
 ed1 board
Date: Mon, 8 Apr 2019 12:26:33 +0000
Message-ID: <5CAB3DF8.7020505@st.com>
References: <1554298852-9955-1-git-send-email-p.paillet@st.com>
 <1554298852-9955-2-git-send-email-p.paillet@st.com>
 <CACRpkdZ9evBnvnmidQ2VW=dPUdGBM4Pkzo1VyMfDdQZFe6U7TA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZ9evBnvnmidQ2VW=dPUdGBM4Pkzo1VyMfDdQZFe6U7TA@mail.gmail.com>
Content-Language: en-US
Content-ID: <149534930B54F74E978E209E1753A909@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "arnd@arndb.de" <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "biju.das@bp.renesas.com" <biju.das@bp.renesas.com>, Yannick FERTRE <yannick.fertre@st.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "olof@lixom.net" <olof@lixom.net>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

SGVsbG8hDQoNCkxlIDA0LzA4LzIwMTkgMDI6MDUgUE0sIExpbnVzIFdhbGxlaWogYSDDqWNyaXQg
Og0KPiBPbiBXZWQsIEFwciAzLCAyMDE5IGF0IDM6NDEgUE0gUGFzY2FsIFBBSUxMRVQtTE1FIDxw
LnBhaWxsZXRAc3QuY29tPiB3cm90ZToNCj4NCj4+IFRoaXMgcGF0Y2ggYWRkcyBzdHBtaWMxIHN1
cHBvcnQgb24gc3RtMzJtcDE1N2MgZWQxIGJvYXJkLg0KPj4gVGhlIFNUUE1JQzEgaXMgYSBQTUlD
IGZyb20gU1RNaWNyb2VsZWN0cm9uaWNzLiBUaGUgU1RQTUlDMSBpbnRlZ3JhdGVzIDEwDQo+PiBy
ZWd1bGF0b3JzLCAzIHBvd2VyIHN3aXRjaGVzLCBhIHdhdGNoZG9nIGFuZCBhbiBpbnB1dCBmb3Ig
YSBwb3dlciBvbiBrZXkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogUGFzY2FsIFBhaWxsZXQgPHAu
cGFpbGxldEBzdC5jb20+DQo+IE9LDQo+DQo+PiArICAgICAgIC9kZWxldGUtcHJvcGVydHkvZG1h
czsNCj4+ICsgICAgICAgL2RlbGV0ZS1wcm9wZXJ0eS9kbWEtbmFtZXM7DQo+IE1heWJlIHlvdSBj
YW4gYWRkIGEgY29tbWVudCBib3RoIHRvIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgdGhlDQo+IERU
UyBmaWxlIGFzIHRvIHdoeSB5b3UgYXJlIGRvaW5nIHRoaXM/DQo+DQo+IEkgaG9wZSB5b3UgYXJl
IG5vdCB0cnlpbmcgdG8gd29yayBhcm91bmQgYSBidWcgaW4gdGhlIGRyaXZlciBieQ0KPiBzdHJp
cHBpbmcgb3V0IERNQSBjb25maWd1cmF0aW9uIGZyb20gdGhlIGRldmljZSB0cmVlLCBiZWNhdXNl
IHRoZW4NCj4gaXQgaXMgcHJvYmFibHkgYSBiZXR0ZXIgaWRlYSB0byBmaXggdGhlIGJ1Zy4NClRo
aXMgaXMgbm90IGEgd29ya2Fyb3VuZC4gVGhlIFBNSUMgY2FuIHVzZSB0aGUgRE1BIG92ZXIgSTJD
IGJ1cy4NCk91ciBnb2FsIGlzIHRvIGF2b2lkIHVzaW5nIGEgRE1BIGNoYW5uZWwgZm9yIGEgY29u
c3VtZXIgdGhhdCBnZW5lcmF0ZXMgYQ0KdmVyeSBmZXcgdHJhZmZpYy4gRG1hIGNoYW5uZWxzIG1h
eSBsYWNrIGZvciBvdGhlciB1c2UgY2FzZXMuDQoNCklmIHlvdSBhZ3JlZSwgeW91IGNhbiBhZGQg
dGhlIHRvIHRoZSBjb21taXQgbWVzc2FnZS4NCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCj4N
Cg0KdGhhbmsgeW91LA0KQmVzdCBSZWdhcmRzLA0KUGFzY2FsDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
