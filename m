From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Subject: Re: [PATCH v3 2/5] dmaengine: Add STM32 DMAMUX driver
Date: Wed, 30 Aug 2017 10:02:56 +0200
Message-ID: <5cc55253-cfe8-270e-895a-135eab782446@st.com>
References: <1499343623-5964-1-git-send-email-pierre-yves.mordret@st.com>
 <20170722065133.GT3053@localhost>
 <2b916330-9b65-f4d5-817f-79b66cc236b3@st.com>
 <20170726052930.GF3053@localhost>
 <f2908e38-dc4d-3886-4058-52a7ad845415@st.com>
 <20170731123157.GJ3053@localhost>
 <e3a76a50-4160-d111-cce9-132b46b66c33@st.com>
 <20170802045522.GU3053@localhost>
 <7d2091fe-a2e5-78bb-b63d-9cb66bdb7e84@ti.com>
 <7bcad698-fa1a-3dc2-e918-4400639ca6d7@st.com>
 <47ceba83-1097-072e-bed6-d1964bce7a25@ti.com>
 <0e16a519-3d60-f683-5517-12a520e0e521@st.com>
 <f0db566e-5613-8914-e070-915c8c4d9b9f@ti.com>
 <71b7ef2a-d745-d16b-4538-567c856cce9a@st.com>
 <401305f0-15d8-1996-60d6-69c13cbacc06@ti.com>
 <58bf2f7c-faf1-d1e9-3c87-d7964d1ba3d4@st.com>
 <6e8e19f1-8d0f-183b-e02f-1ec8c4dd57b3@ti.com>
 <f7ddd927-5db3-e1b1-b7f1-94050b508298@st.com>
 <d1cc3cbb-c4aa-2acc-91ff-1d6713cb8867@ti.com>
 <ea66ba14-fe18-cb83-5989-8ae7b3ab50c6@st.com>
 <bbfbf048-9d4d-8714-d607-4d02088170d8@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <bbfbf048-9d4d-8714-d607-4d02088170d8@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, Vinod Koul <vinod.koul@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Amelie DELAUNAY <amelie.delaunay@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>
List-Id: devicetree@vger.kernel.org

CgpPbiAwOC8yOC8yMDE3IDAxOjQ4IFBNLCBQZXRlciBVamZhbHVzaSB3cm90ZToKPiAKPiBUZXhh
cyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5r
aS4gWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTog
SGVsc2lua2kKPiAKClRoYW5rcyBmb3IgeW91ciBpbnZhbHVhYmxlIGlucHV0cy4gVGhpcyBpcyBt
b3JlIGNsZWFyIG5vdyBhbmQgcmV2aXNlIG15IGRyaXZlcgoKPiAKPiBJIHdvdWxkIG5vdCBib3Ro
ZXIgd2l0aCBtaXhlZCB1c2UgY2FzZSBoZXJlLCBJIHdvdWxkIGp1c3QgbWFrZSBpdAo+IG1hbmRh
dG9yeSB0byBnbyB2aWEgdGhlIHJvdXRlci4KPiAKCkkgY291bGRuJ3QgYWdyZWUgbW9yZS4gQnV0
IGl0IHNlZW1zIHRvIG1lIHRoZXJlIGlzIGEgZmxhdyBoZXJlLiBUaGlzIHNob3VsZCBiZQpwb3Nz
aWJsZSB0aG91Z2guIEkgd2lsbCBsaWtlbHkgbG9vayBhdCB0aGF0IGxhdGVyIG9uLgoKQSBuZXcg
cmV2aXNpb24gb2YgdGhpcyBkcml2ZXIgd2lsbCBjb21lIHNvb24gOykKCj4gCj4gLSBQw6l0ZXIK
PiAKUHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFybS1rZXJuZWwK
