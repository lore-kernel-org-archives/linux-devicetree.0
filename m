From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v3 2/5] dmaengine: Add STM32 DMAMUX driver
Date: Fri, 4 Aug 2017 17:21:03 +0300
Message-ID: <6e8e19f1-8d0f-183b-e02f-1ec8c4dd57b3@ti.com>
References: <1499343623-5964-1-git-send-email-pierre-yves.mordret@st.com>
 <1499343623-5964-3-git-send-email-pierre-yves.mordret@st.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <58bf2f7c-faf1-d1e9-3c87-d7964d1ba3d4@st.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pierre Yves MORDRET <pierre-yves.mordret@st.com>, Vinod Koul <vinod.koul@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Amelie DELAUNAY <amelie.delaunay@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>
List-Id: devicetree@vger.kernel.org

T24gMDgvMDQvMjAxNyAwMzo1MCBQTSwgUGllcnJlIFl2ZXMgTU9SRFJFVCB3cm90ZToKPiBPdXIg
RE1BTVVYIGNhbiBtYW5hZ2UgdXAgdG8gMjU1IHJlcXVlc3QgbGluZXMgKG9ubHkgMTI4IGlzIGV2
ZW50dWFsbHkgYXNzaWduZWQKPiB0aG91Z2gpIG9udG8gMTYgZXZlbnRzOiA4IGV2ZW50cyBtYXBw
ZWQgb24gMSBETUEgYW5kIHRoZSA4IG90aGVycyBvbnRvIHRoZQo+IHNlY29uZCBETUEuIFJlcXVl
c3QgbGluZSBudW1iZXJpbmcgaXMgZml4ZWQgKGEgcGVyaXBoZXJhbCBETUEgcmVxdWVzdCBpcwo+
IGFzc2lnbmVkIHRvIG9uZSBNVVggaW5wdXQpIGFuZCBidXQgY2FuIGJlIHJvdXRlZCByYW5kb21s
eSBvbnRvIHRoZSBhbnkgMTYKPiBjaGFubmVscy4gV2UgdXNlIGNoYW5JRCB0byBtdXggaW5wdXQg
b24gZXZlbnQuCj4gY2hhbklEIGdpdmVuIGJ5IGRtYV9nZXRfYW55X3NsYXZlX2NoYW5uZSBpcyBl
bm91Z2ggaW4gb3VyIGNhc2UuCgpJIHdvdWxkIHRoaW5rIHRoYXQgaWYgeW91IGhhdmUgaW4gdGhl
IHJvdXRlciBub2RlOgpkbWEtbWFzdGVycyA9IDwmZG1hMT4sIDwmZG1hMj47CgphbmQgcmVxdWVz
dCBhIERNQSB2aWEgdGhlIHJvdXRlcjoKZG1hcyA9IDwmZG1hX3JvdXRlciByZXFfaW4gcGFyYW0x
IHBhcmFtMj47Cgp0aGVuIHRoZSByb3V0ZXIgZHJpdmVyIHdvdWxkIGRlY2lkZSB3aGljaCBkbWEt
bWFzdGVyIGl0IGlzIGdvaW5nIHRvIGFzc2lnbiB0aGUKZ2l2ZW4gcmVxdWVzdCBsaW5lIGFuZCBj
cmFmdCB0aGUgZG1hLXNwZWMgYmFzZWQgb24gdGhpcyBkZWNpc2lvbi4gVGhpcwpyZXF1aXJlcyBu
byBjYWxsYmFjayB0byB0aGUgcm91dGVyIGZyb20gdGhlIERNQSBtYXN0ZXIgZHJpdmVyIGF0IGFs
bC4KClRoZSBpZGVhIG9mIHRoZSBkbWEgZXZlbnQgcm91dGVyIGlzIHRvIGJlIHRyYW5zcGFyZW50
IGZvciB0aGUgRE1BIGNsaWVudHMKKHBlcmlwaGVyYWxzIG5lZWRpbmcgRE1BIGNoYW5uZWwpIGFu
ZCBmb3IgdGhlIERNQSBkcml2ZXJzIGFzIHdlbGwuIE5laXRoZXIKc2hvdWxkIGtub3cgdGhhdCB0
aGUgZXZlbnRzIGFyZSBtdXhlZCBhcyBpdCBkb2VzIG5vdCByZWFsbHkgbWF0dGVyIGZvciB0aGVt
LgoKLS0gClDDqXRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYXJtLWtlcm5lbAo=
