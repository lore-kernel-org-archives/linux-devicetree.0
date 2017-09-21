From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Subject: Re: [PATCH v4 2/4] dmaengine: Add STM32 DMAMUX driver
Date: Thu, 21 Sep 2017 14:47:59 +0200
Message-ID: <ab012ccc-21e4-e487-4ef1-056c36a65cd0@st.com>
References: <1504785168-26572-1-git-send-email-pierre-yves.mordret@st.com>
 <1504785168-26572-3-git-send-email-pierre-yves.mordret@st.com>
 <a88a83ba-9477-36ae-87ba-a35f477a5ca1@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a88a83ba-9477-36ae-87ba-a35f477a5ca1@ti.com>
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
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Dan Williams <dan.j.williams@intel.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, Herbert Xu <herbert@gondor.apana.org.au>, Fabien DESSENNE <fabien.dessenne@st.com>, Amelie Delaunay <amelie.delaunay@st.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

CgpPbiAwOS8yMS8yMDE3IDAxOjI1IFBNLCBQZXRlciBVamZhbHVzaSB3cm90ZToKPiAKPiBUZXhh
cyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5r
aS4gWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTog
SGVsc2lua2kKPiAKPiAKPiBHcmVhdCB0aGF0IHlvdSBnb3QgaXQgd29ya2luZyB3L28gYSBjdXN0
b20gQVBJIQo+IEkgaGF2ZSBvbmUgY29tbWVudCwgd2hpY2ggYWN0dWFsbHkgdmFsaWQgZm9yIHRo
ZSB0aS1kbWEtY3Jvc3NiYXIgZHJpdmVyCj4gYXMgd2VsbC4uLgoKWWVzLiBUaGF0IGNsZWFucyB1
cCBhIGxpdHRsZSBiaXQgdGhlIHN3IGFyY2hpdGVjdHVyZS4gQnV0IHN0aWxsIHRoaXMgY3VzdG9t
IEFQSQphbGxvd2VkIGJvdGggRE1BTVVYIGFuZCBETUEgYXQgdGhlIHNhbWUgdGltZSBzaW5jZSB1
c2luZyB0aGUgc2FtZSBjaGFubmVsIElECmFsbG9jYXRvci4KT2sgdGhpcyBpcyBhbm90aGVyIHN0
b3J5IHRvIGJlIGFkZHJlc3NlZCBvdXQgb2YgdGhpcyB0aHJlYWQgOykKCj4gCj4+ICtzdGF0aWMg
dm9pZCAqc3RtMzJfZG1hbXV4X3JvdXRlX2FsbG9jYXRlKHN0cnVjdCBvZl9waGFuZGxlX2FyZ3Mg
KmRtYV9zcGVjLAo+PiArCQkJCQkgc3RydWN0IG9mX2RtYSAqb2ZkbWEpCj4+ICsKPj4gKwlzcGlu
X2xvY2tfaXJxc2F2ZSgmZG1hbXV4LT5sb2NrLCBmbGFncyk7Cj4+ICsJbXV4LT5jaGFuX2lkID0g
ZmluZF9maXJzdF96ZXJvX2JpdChkbWFtdXgtPmRtYV9pbnVzZSwKPj4gKwkJCQkJICAgZG1hbXV4
LT5kbWFfcmVxdWVzdHMpOwo+IAo+IHlvdSBwaWNrIHRoZSBmaXJzdCBhdmFpbGFibGUgY2hhbl9p
ZCBoZXJlIHVuZGVyIHRoZSBsb2NrLgo+IAo+PiArCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRt
YW11eC0+bG9jaywgZmxhZ3MpOwo+PiArCWlmIChtdXgtPmNoYW5faWQgPT0gZG1hbXV4LT5kbWFf
cmVxdWVzdHMpIHsKPj4gLi4uCj4+ICsJLyogU2V0IGRtYSByZXF1ZXN0ICovCj4+ICsJc3Bpbl9s
b2NrX2lycXNhdmUoJmRtYW11eC0+bG9jaywgZmxhZ3MpOwo+PiArCWlmICghSVNfRVJSKGRtYW11
eC0+Y2xrKSkgewo+PiAuLi4KPj4gKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkbWFtdXgtPmxv
Y2ssIGZsYWdzKTsKPj4gKwo+PiArCXNldF9iaXQobXV4LT5jaGFuX2lkLCBkbWFtdXgtPmRtYV9p
bnVzZSk7Cj4gCj4gQnV0IG5vdGhpbmcgc3RvcHMgb3RoZXIgcGFyYWxsZWwgdGhyZWFkcyB0byBw
aWNrIHRoZSBzYW1lIGNoYW5faWQgc2luY2UKPiB5b3UgaGF2ZSByZWxlYXNlZCB0aGUgbG9jayAo
cmVsZWFzZWQsIGdvdCB0aGUgbG9jayB0byBwcm90ZWN0IHRoZSBzZXQKPiBkbWEgcmVxdWVzdCBh
bmQgcmVsZWFzZWQgaXQgYWdhaW4pLiBpbWhvIHRoZSBmaW5kX2ZpcnN0X3plcm9fYml0KCkgYW5k
Cj4gdGhlIHNldF9iaXQoKSBzaG91bGQgYmUgZG9uZSB3aXRoaW4gdGhlIHNhbWUgbG9jayB0byBh
dm9pZCByYWNlIGNvbmRpdGlvbnMuCj4gCj4gLSBQw6l0ZXIKPiAKClllcCBnb29kIGNhdGNoIDog
VGhhdCdzIGNvcnJlY3QuIEV2ZW4gaWYgcHJvYmFiaWxpdHkgdG8gaGFwcGVuIGlzIHJhdGhlciBs
b3csIGl0Cm1heSBoYXBwZW4uCldpbGwgc29sdmUgdGhhdC4KClB5CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcg
bGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
