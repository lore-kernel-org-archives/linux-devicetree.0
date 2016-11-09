From: Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: Re: [PATCH 1/6] clk: stm32f4: Add PLL_I2S & PLL_SAI for STM32F429/469
 boards
Date: Wed, 9 Nov 2016 10:51:09 +0100
Message-ID: <e569aec7-ed6d-84ff-aa45-3d1a4350b60e@st.com>
References: <1478523943-23142-1-git-send-email-gabriel.fernandez@st.com>
 <1478523943-23142-2-git-send-email-gabriel.fernandez@st.com>
 <CAFvLkMQxvo=2Ak033n2XkPgdDfU5DLCMF7dj487QFB0e7WceCQ@mail.gmail.com>
 <ebadfacf-73fb-01a6-791a-324daad5e695@st.com>
 <CAFvLkMSwwyoi8Vb_-+6dViB8PaBRUoCZYBcrzDjgX9EJnv_mvQ@mail.gmail.com>
 <0368d067-461d-2edb-5561-9717934e0dde@st.com>
 <CAFvLkMSUg8=nYY9Zm2Q4ZW=GqUaczK_TA5b5jjb45vYyhoVLZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFvLkMSUg8=nYY9Zm2Q4ZW=GqUaczK_TA5b5jjb45vYyhoVLZA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?Q?Rados=c5=82aw_Pietrzyk?= <radoslaw.pietrzyk@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@linaro.org>, Andrea Merello <andrea.merello@gmail.com>, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, olivier.bideau@st.com, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, amelie.delaunay@st.com, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-clk@vger.kernel.org, ludovic.barre@st.com, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

CgpPbiAxMS8wOS8yMDE2IDA5OjEwIEFNLCBSYWRvc8WCYXcgUGlldHJ6eWsgd3JvdGU6Cj4gSSB3
b3VsZCBleHBlY3QgdGhhdCBWQ08gY2xvY2sgd2lsbCBmb3JjZSByZWNhbGN1bGF0aW9uIGZvciBh
bGwgaXRzCj4gY2hpbGRyZW4gaWYgSSBhbSBub3QgbWlzdGFrZW4uClN1cmUKCkJSCkdhYnJpZWwu
Cj4KPiAyMDE2LTExLTA4IDE3OjE5IEdNVCswMTowMCBHYWJyaWVsIEZlcm5hbmRleiA8Z2Ficmll
bC5mZXJuYW5kZXpAc3QuY29tPjoKPj4gT24gMTEvMDgvMjAxNiAwOTo1MiBBTSwgUmFkb3PFgmF3
IFBpZXRyenlrIHdyb3RlOgo+Pj4gMjAxNi0xMS0wOCA5OjM1IEdNVCswMTowMCBHYWJyaWVsIEZl
cm5hbmRleiA8Z2FicmllbC5mZXJuYW5kZXpAc3QuY29tPjoKPj4+PiBIaSBSYWRvc8WCYXcKPj4+
Pgo+Pj4+IE1hbnkgdGhhbmtzIGZvciByZXZpZXdpbmcuCj4+Pj4KPj4+PiBPbiAxMS8wNy8yMDE2
IDAzOjU3IFBNLCBSYWRvc8WCYXcgUGlldHJ6eWsgd3JvdGU6Cj4+Pj4+PiArc3RhdGljIHN0cnVj
dCBjbGtfaHcgKmNsa19yZWdpc3Rlcl9wbGxfZGl2KGNvbnN0IGNoYXIgKm5hbWUsCj4+Pj4+PiAr
ICAgICAgICAgICAgICAgY29uc3QgY2hhciAqcGFyZW50X25hbWUsIHVuc2lnbmVkIGxvbmcgZmxh
Z3MsCj4+Pj4+PiArICAgICAgICAgICAgICAgdm9pZCBfX2lvbWVtICpyZWcsIHU4IHNoaWZ0LCB1
OCB3aWR0aCwKPj4+Pj4+ICsgICAgICAgICAgICAgICB1OCBjbGtfZGl2aWRlcl9mbGFncywgY29u
c3Qgc3RydWN0IGNsa19kaXZfdGFibGUKPj4+Pj4+ICp0YWJsZSwKPj4+Pj4+ICsgICAgICAgICAg
ICAgICBzdHJ1Y3QgY2xrX2h3ICpwbGxfaHcsIHNwaW5sb2NrX3QgKmxvY2spCj4+Pj4+PiArewo+
Pj4+Pj4gKyAgICAgICBzdHJ1Y3Qgc3RtMzJmNF9wbGxfZGl2ICpwbGxfZGl2Owo+Pj4+Pj4gKyAg
ICAgICBzdHJ1Y3QgY2xrX2h3ICpodzsKPj4+Pj4+ICsgICAgICAgc3RydWN0IGNsa19pbml0X2Rh
dGEgaW5pdDsKPj4+Pj4+ICsgICAgICAgaW50IHJldDsKPj4+Pj4+ICsKPj4+Pj4+ICsgICAgICAg
LyogYWxsb2NhdGUgdGhlIGRpdmlkZXIgKi8KPj4+Pj4+ICsgICAgICAgcGxsX2RpdiA9IGt6YWxs
b2Moc2l6ZW9mKCpwbGxfZGl2KSwgR0ZQX0tFUk5FTCk7Cj4+Pj4+PiArICAgICAgIGlmICghcGxs
X2RpdikKPj4+Pj4+ICsgICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKPj4+
Pj4+ICsKPj4+Pj4+ICsgICAgICAgaW5pdC5uYW1lID0gbmFtZTsKPj4+Pj4+ICsgICAgICAgaW5p
dC5vcHMgPSAmc3RtMzJmNF9wbGxfZGl2X29wczsKPj4+Pj4+ICsgICAgICAgaW5pdC5mbGFncyA9
IGZsYWdzOwo+Pj4+PiBNYXliZSBpdCdzIHdvcnRoIHRvIGhhdmUgQ0xLX1NFVF9SQVRFX1BBUkVO
VCBoZXJlIGFuZCB0aGUgVkNPIGNsb2NrCj4+Pj4+IHNob3VsZCBoYXZlIENMS19TRVRfUkFURV9H
QVRFIGZsYWcgYW5kIHdlIGNhbiBnZXQgcmlkIG9mIGN1c3RvbQo+Pj4+PiBkaXZpZGVyIG9wcy4K
Pj4+PiBJIGRvbid0IHdhbnQgdG8gb2ZmZXIgdGhlIHBvc3NpYmlsaXR5IHRvIGNoYW5nZSB0aGUg
dmNvIGNsb2NrIHRocm91Z2ggdGhlCj4+Pj4gZGl2aXNvciBvZiB0aGUgcGxsIChvbmx5IGJ5IGEg
Ym9vdC1sb2FkZXIgb3IgYnkgRFQpLgo+Pj4+Cj4+Pj4gZS5nLiBpZiBpIG1ha2UgYSBzZXQgcmF0
ZSBvbiBsY2QtdGZ0IGNsb2NrLCBpIGRvbid0IHdhbnQgdG8gY2hhbmdlIHRoZQo+Pj4+IFNBSQo+
Pj4+IGZyZXF1ZW5jaWVzLgo+Pj4+Cj4+Pj4gSSB1c2VkIHNhbWUgc3RydWN0dXJlIGZvciBpbnRl
cm5hbCBkaXZpc29ycyBvZiB0aGUgcGxsIChwLCBxLCByKSBhbmQgZm9yCj4+Pj4gcG9zdCBkaXZp
c29ycyAocGxsaTJzLXEtZGl2LCBwbGxzYWktcS1kaXYgJiBwbGxzYWktci1kaXYpLgo+Pj4+IFRo
YXQgd2h5IHRoZSBDTEtfU0VUX1JBVEVfUEFSRU5UIGZsYWcgaXMgdHJhbnNtaXQgYnkgcGFyYW1l
dGVyLgo+Pj4+Cj4+Pj4gVGhlc2UgZGl2aXNvcnMgYXJlIHNpbWlsYXIgYmVjYXVzZSB3ZSBoYXZl
IHRvIHN3aXRjaCBvZmYgdGhlIHBsbCBiZWZvcmUKPj4+PiBjaGFuZ2luZyB0aGUgcmF0ZS4KPj4+
Pgo+Pj4gQnV0IGNoYW5naW5nIHBsbCBhbmQgbGNkIGRpdmlkZXJzIG9ubHkgbWF5IG5vdCBiZSBl
bm91Z2ggZm9yIGdldHRpbmcKPj4+IHZlcnkgc3BlY2lmaWMgcGl4ZWxjbG9ja3MgYW5kIHRoYXQg
bWlnaHQgcmVxdWlyZSBjaGFuZ2luZyB0aGUgVkNPCj4+PiBmcmVxdWVuY3kgaXRzZWxmLiBUaGUg
cmVzdCBvZiB0aGUgU0FJIHRyZWUgc2hvdWxkIGJlIHJlY2FsY3VsYXRlZAo+Pj4gdGhlbi4KPj4g
SSBhZ3JlZSBidXQgaXQgc2VlbXMgdG8gYmUgdG9vIG11Y2ggY29tcGxpY2F0ZWQgdG8gcmVjYWxj
dWxhdGUgYWxsIFBMTAo+PiBkaXZpc29ycyBpZiB3ZSBjaGFuZ2UgdGhlIHZjbyBjbG9jay4KPj4g
WW91IG1lYW4gdG8gdXNlIENsb2NrIG5vdGlmaWVyIGNhbGxiYWNrID8KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
