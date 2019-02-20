From: Sylvain Lemieux <slemieux.tyco@gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: iio: adc: lpc32xx-adc: Document
 vref-supply
Date: Wed, 20 Feb 2019 07:11:39 -0500
Message-ID: <CA+rxa6qbk49J8X3Ph81naXEKWWDUH_0h7uJfC0KOFOoTvEW=9w@mail.gmail.com>
References: <20190208160944.13281-1-gregory.clement@bootlin.com>
 <20190208160944.13281-3-gregory.clement@bootlin.com>
 <8bc7bfcf-ad04-0615-1735-c2bbf20b7861@mleia.com>
 <87o97d2fyg.fsf@FE-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87o97d2fyg.fsf@FE-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgR3JlZ29yeSwKCk9uIEZyaSwgRmViIDE1LCAyMDE5IGF0IDExOjA3IEFNIEdyZWdvcnkgQ0xF
TUVOVAo8Z3JlZ29yeS5jbGVtZW50QGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIFZsYWRpbWly
LAo+Cj4gIE9uIHNhbS4sIGbDqXZyLiAwOSAyMDE5LCBWbGFkaW1pciBaYXBvbHNraXkgPHZ6QG1s
ZWlhLmNvbT4gd3JvdGU6Cj4KPiA+IEhpIEdyZWdvcnksCj4gPgo+ID4gT24gMDIvMDgvMjAxOSAw
NjowOSBQTSwgR3JlZ29yeSBDTEVNRU5UIHdyb3RlOgo+ID4+IEFzIG1vc3Qgb2YgdGhlIG90aGVy
IEFEQyB0aGUgbHBjMzJ4eCBvbmUgdXNlIGEgdnJlZi1zdXBwbHkgcHJvcGVydHk6Cj4gPj4gZG9j
dW1lbnQgaXQuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBHcmVnb3J5IENMRU1FTlQgPGdyZWdv
cnkuY2xlbWVudEBib290bGluLmNvbT4KPiA+PiAtLS0KPiA+PiAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvbHBjMzJ4eC1hZGMudHh0IHwgNSArKysrKwo+ID4+ICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPj4KWy4uLl0KPiA+Pgo+ID4KPiA+IEkg
a2luZGx5IGFzayB5b3UgdG8gaW5jbHVkZSBtZSB0byBUbzogbGlzdCwgaWYgeW91IHNlbmQgYW5v
dGhlciBjaGFuZ2VzIGZvcgo+ID4gTlhQIExQQzMyeHggcGxhdGZvcm0uCj4KPiBZZXMgc3VyZSEg
SSB3cm9uZ2x5IG9ubHkgdXNlIHRoZSBmaXJzdCBsaW5lcyBwcm92aWRlZCBieQo+IC4vc2NyaXB0
cy9nZXRfbWFpbnRhaW5lci5wbCwgSSB3aWxsIGluY2x1ZGUgeW91IGluIHRoZSBuZXh0IHZlcnNp
b24uCj4KClBsZWFzZSBhbHNvIGluY2x1ZGUgbXlzZWxmIGluIHRoZSBuZXh0IExQQzMyeHggcmVs
YXRlZCBwYXRjaGVzLgoKUmVnYXJkcywKU3lsdmFpbgo+Cj4gVGhhbmtzLAo+Cj4gR3JlZ29yeQo+
Cj4KPgo+ID4KPiA+IFRoYW5rIHlvdS4KPiA+Cj4gPiAtLQo+ID4gQmVzdCB3aXNoZXMsCj4gPiBW
bGFkaW1pcgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+ID4gbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwKPgo+IC0tCj4gR3JlZ29yeSBDbGVtZW50
LCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHA6
Ly9ib290bGluLmNvbQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
