From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v8 42/42] ARM: dts: da850: Add clocks
Date: Tue, 3 Apr 2018 11:13:07 +0530
Message-ID: <82917652-8be2-75f5-f3fc-814ee7c3f51d@ti.com>
References: <1521168778-27236-1-git-send-email-david@lechnology.com>
 <1521168778-27236-43-git-send-email-david@lechnology.com>
 <cf0c4153-b65d-da57-cd0f-0a16cb186377@lechnology.com>
 <510309d2-2df0-a915-a6f6-082b41c6b28b@ti.com>
 <5502d0ee-b5dc-e90a-a041-882350c7d339@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5502d0ee-b5dc-e90a-a041-882350c7d339@lechnology.com>
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

T24gTW9uZGF5IDAyIEFwcmlsIDIwMTggMDk6NDUgUE0sIERhdmlkIExlY2huZXIgd3JvdGU6Cj4g
T24gMDQvMDIvMjAxOCAwNjoxMiBBTSwgU2VraGFyIE5vcmkgd3JvdGU6Cj4+IE9uIEZyaWRheSAx
NiBNYXJjaCAyMDE4IDEwOjUwIFBNLCBEYXZpZCBMZWNobmVyIHdyb3RlOgo+Pj4gT24gMDMvMTUv
MjAxOCAwOTo1MiBQTSwgRGF2aWQgTGVjaG5lciB3cm90ZToKPj4+PiBUaGlzIGFkZHMgY2xvY2sg
cHJvdmlkZXIgbm9kZXMgZm9yIGRhODUwIGFuZCB3aXJlcyB0aGVtIHVwIHRvIGFsbCBvZgo+Pj4+
IHRoZQo+Pj4+IGRldmljZXMuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBMZWNobmVy
IDxkYXZpZEBsZWNobm9sb2d5LmNvbT4KPj4+PiAtLS0KPj4+Cj4+PiAuLi4KPj4+Cj4+PiBUaGlz
IGlzIHRoZSBtY2FzcDA6IG1jYXNwQDEwMDAwMCBub2RlLi4uCj4+Pgo+Pj4+IEBAIC01NjAsNiAr
NzIwLDcgQEAKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYXMgPSA8JmVkbWEw
IDEgMT4sCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmZWRtYTAg
MCAxPjsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYS1uYW1lcyA9ICJ0eCIs
ICJyeCI7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZwc2MxIDc+Owo+
Pj4KPj4+IEFmdGVyIHNvbWUgdGVzdGluZywgaXQgbG9va3MgbGlrZSBpdCBuZWVkcyB0byBiZToK
Pj4+Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwb3dlci1kb21haW5zID0gPCZwc2MxIDc+
Owo+Pj4KPj4+IGluc3RlYWQgb2YKPj4+Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9j
a3MgPSA8JnBzYzEgNz47Cj4+Cj4+IFdlIHNob3VsZCBwcm9iYWJseSBoYXZlIGJvdGggY2xvY2tz
IGFuZCBwb3dlci1kb21haW5zIHByb3BlcnRpZXMgZm9yIGFsbAo+PiBQU0MgY2xvY2tzLiBUaGlz
IHdheSwgdGhlIGRyaXZlciBjYW4gY2hhbmdlIHdpdGhvdXQgYSBjb3JyZXNwb25kaW5nIERUCj4+
IHVwZGF0ZSBkZXBlbmRlbmN5Lgo+Pgo+PiBUaGFua3MsCj4+IFNla2hhcgo+Pgo+IAo+IFRoYXQn
cyBmaW5lIHdpdGggbWUuIEkganVzdCBkaWRuJ3Qga25vdyBob3cgcGVvcGxlIGZlbHQgYWJvdXQg
dXNpbmcKPiBwcm9wZXJ0aWVzCj4gdGhhdCBhcmUgbm90IGRvY3VtZW50ZWQuCgpHb29kIHBvaW50
LiBIb3cgdG8gZWFzZSBkb2N1bWVudGF0aW9uIGZvciBnZW5lcmljIHByb3BlcnRpZXMgbGlrZSB0
aGVzZQp3YXMgZGlzY3Vzc2VkIGluIHRoZSBwYXN0LCBidXQgdGhlcmUgaXMgbm8gZ3VpZGFuY2Ug
aW4KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzIHRoYXQgSSBjYW4gc2VlLgoKU28s
IGluIHRoZSBpbnRlcmVzdCBvZiByZWR1Y2VkIGNvbnRyb3ZlcnN5LCBpdHMgcHJvYmFibHkgYmV0
dGVyIHRvIGRvCndoYXQgeW91IGFscmVhZHkgaGF2ZSBhbmQgb25seSBwb3B1bGF0ZSBwcm9wZXJ0
aWVzIGFscmVhZHkgZG9jdW1lbnRlZCBpbgp0aGUgYmluZGluZ3MuCgpUaGFua3MsClNla2hhcgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtl
cm5lbAo=
