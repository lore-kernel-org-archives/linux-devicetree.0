From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v9 03/27] clk: davinci: psc: allow for dev == NULL
Date: Wed, 2 May 2018 20:38:06 +0530
Message-ID: <3cec9c1f-48fd-1c16-b642-eb93e41446fc@ti.com>
References: <20180427001745.4116-1-david@lechnology.com>
 <20180427001745.4116-4-david@lechnology.com>
 <8940259b-5811-ce9f-8262-17d39ca0a46f@ti.com>
 <94d4cfc5-0ea7-e642-c7e3-8d549bdef8ce@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <94d4cfc5-0ea7-e642-c7e3-8d549bdef8ce@lechnology.com>
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
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gV2VkbmVzZGF5IDAyIE1heSAyMDE4IDA3OjE5IEFNLCBEYXZpZCBMZWNobmVyIHdyb3RlOgo+
IE9uIDA1LzAxLzIwMTggMDk6MDIgQU0sIFNla2hhciBOb3JpIHdyb3RlOgo+PiBPbiBGcmlkYXkg
MjcgQXByaWwgMjAxOCAwNTo0NyBBTSwgRGF2aWQgTGVjaG5lciB3cm90ZToKPj4+ICtzdGF0aWMg
aW5saW5lIHZvaWQgKl9kZXZtX2t6YWxsb2Moc3RydWN0IGRldmljZSAqZGV2LCBzaXplX3Qgc2l6
ZSwKPj4+IGdmcF90IGZsYWdzKQo+Pj4gK3sKPj4+ICvCoMKgwqAgaWYgKGRldikKPj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm4gZGV2bV9remFsbG9jKGRldiwgc2l6ZSwgZmxhZ3MpOwo+Pj4gKwo+
Pj4gK8KgwqDCoCByZXR1cm4ga3phbGxvYyhzaXplLCBmbGFncyk7Cj4+PiArfQo+Pgo+PiBJIGhh
dmUgdGhlIHNhbWUgcXVlc3Rpb24gb24gdGhlIHV0aWxpdHkgb2YgdGhpcy4gQSBtZW1vcnkgYWxs
b2NhdGlvbgo+PiBlcnJvciBzbyBlYXJseSBvbiBpcyBub3QgZ29pbmcgdG8gcmVzdWx0IGluIGEg
Ym9vdGFibGUgc3lzdGVtIGFueXdheS4KPj4gU28sIEkgd29uZGVyIGlmIGl0cyBiZXR0ZXIgdG8g
anVzdCBCVUcoKSBpbiBzdWNoIGNhc2VzLiBUaGF0IHdpbGwKPj4gYWN0dWFsbHkgaGVscCBmYXN0
ZXIgZGVidWcgdGhhbiByZXR1cm5pbmcgYW4gZXJyb3IgYmFjay4gSSBrbm93IHRoZSBwdXNoCj4+
IGJhY2sgb24gdXNpbmcgQlVHKCksIGJ1dCBjbG9jayBkcml2ZXJzIGFyZSBzcGVjaWFsLCBhbmQg
SSB0aGluayB0aGF0cwo+PiB3aHkgaXRzIHNlZW1zIHRvIGJlIHVzZWQgcXVpdGUgYSBiaXQgYWxy
ZWFkeS4KPj4KPiAKPiBTYW1lIHJlcGx5IGhlcmUgYXMgd2VsbC4gT24gREE4NTAvREE4MzAsIHlv
dSBtaWdodCBub3QgZ2V0IGEgY29uc29sZSwKPiBidXQgeW91IHdpbGwgImJvb3QiIGV2ZW4gaWYg
b25lIG9mIHRoZSBQU0MgZGV2aWNlcyBmYWlscyB0aG91Z2guCgpXYXMgbm90IHRoaW5raW5nIG9m
IGZhaWx1cmUgdG8gYm9vdCBkdWUgdG8gY2xvY2tzIGJlaW5nIGRpc2FibGVkLCBidXQKdGhlIGZh
Y3QgdGhhdCB5b3UgYXJlIG5vdCBhYmxlIHRvIGFsbG9jYXRlIGEgc21hbGwgYW1vdW50IG9mIG1l
bW9yeSBzbwplYXJseSBpbiBib290IHByb2Nlc3MuIFRoZSBjaGFuY2VzIG9mIHN1Y2Nlc3NmdWwg
Ym9vdCBhZnRlciBtZW1vcnkKYWxsb2NhdGlvbiBmYWlsdXJlcyBsaWtlIHRoYXQgYXJlIGNsb3Nl
IHRvIHplcm8uCgo+IFdBUk4oKSBpcyBwcm9iYWJseSBqdXN0IGFzIGdvb2QgYXMgQlVHKCkgaW4g
dGhpcyBjYXNlIHRvby4KCk9rYXksIGJ1dCB3aXRoIFdBUk4oKSB5b3Ugd291bGQgY29udGludWUg
dG8gcHJvY2VlZCB0byB0cnkgdG8gYm9vdCB3aGljaAppcyBub3QgZ29pbmcgdG8gYmUgbXVjaCBm
cnVpdGZ1bCAoYW5kIG1pZ2h0IGFjdHVhbGx5IG11ZGRsZSB0aGUgZmlyc3QKZmFpbHVyZSkuIEJ1
dCB1cCB0byB5b3Ugb24gdGhpcy4KClRoYW5rcywKU2VraGFyCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
