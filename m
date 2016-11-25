From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH v5 2/2] DW DMAC: add multi-block property to device tree
Date: Fri, 25 Nov 2016 11:40:31 +0000
Message-ID: <1480074030.2534.46.camel@synopsys.com>
References: <1479999878-19120-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1479999878-19120-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1480002728.20074.15.camel@linux.intel.com>
 <1480003098.20074.18.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1480003098.20074.18.camel@linux.intel.com>
Content-Language: en-US
Content-ID: <C44003A2FF4F1F4CAA6307A0283F3011@internal.synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "christian.ruppert@alitech.com" <christian.ruppert@alitech.com>, "arnd@arndb.de" <arnd@arndb.de>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "vireshk@kernel.org" <vireshk@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "shiraz.linux.kernel@gmail.com" <shiraz.linux.kernel@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDE2LTExLTI0IGF0IDE3OjU4ICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIFRodSwgMjAxNi0xMS0yNCBhdCAxNzo1MiArMDIwMCwgQW5keSBTaGV2Y2hlbmtvIHdy
b3RlOg0KPiA+IA0KPiA+IE9uIFRodSwgMjAxNi0xMS0yNCBhdCAxODowNCArMDMwMCwgRXVnZW5p
eSBQYWx0c2V2IHdyb3RlOg0KPiA+ID4gDQo+ID4gPiBTZXZlcmFsIHZlcnNpb25zIG9mIERXIERN
QUMgaGF2ZSBtdWx0aSBibG9jayB0cmFuc2ZlcnMgaGFyZHdhcmUNCj4gPiA+IHN1cHBvcnQuIEhh
cmR3YXJlIHN1cHBvcnQgb2YgbXVsdGkgYmxvY2sgdHJhbnNmZXJzIGlzIGRpc2FibGVkDQo+ID4g
PiBieSBkZWZhdWx0IGlmIHdlIHVzZSBEVCB0byBjb25maWd1cmUgRE1BQyBhbmQgc29mdHdhcmUg
ZW11bGF0aW9uDQo+ID4gPiBvZiBtdWx0aSBibG9jayB0cmFuc2ZlcnMgdXNlZCBpbnN0ZWFkLg0K
PiA+ID4gQWRkIG11bHRpLWJsb2NrIHByb3BlcnR5LCBzbyBpdCBpcyBwb3NzaWJsZSB0byBlbmFi
bGUgaGFyZHdhcmUNCj4gPiA+IG11bHRpIGJsb2NrIHRyYW5zZmVycyAoaWYgcHJlc2VudCkgdmlh
IERULg0KPiA+ID4gDQo+ID4gPiBTd2l0Y2ggZnJvbSBwZXIgZGV2aWNlIGlzX25vbGxwIHZhcmlh
YmxlIHRvIG11bHRpX2Jsb2NrIGFycmF5DQo+ID4gPiB0byBiZSBhYmxlIGVuYWJsZS9kaXNhYmxl
IG11bHRpIGJsb2NrIHRyYW5zZmVycyBzZXBhcmF0ZWx5IHBlcg0KPiA+ID4gY2hhbm5lbC4NCj4g
PiBUaGFua3MgZm9yIGFuIHVwZGF0ZS4gQmFzaWNhbGx5IEknbSBmaW5lIHdpdGggdGhpcyBvbmUu
DQo+ID4gDQo+ID4gU28sIHdlIHN0aWxsIGhhdmUgcXVlc3Rpb24gYWJvdXQgYXV0b2NvbmZpZ3Vy
YXRpb24gaW4gU1BFQXIgU29DcywNCj4gPiBhbmQNCj4gPiB5b3VyIEFSQyBTb0MgYnV0IGl0J3Mg
YSBkaWZmZXJlbnQgc3RvcnkuIEkgd291bGQgZXhwZWN0IG9uY2UgeW91DQo+ID4gd2lsbA0KPiA+
IGNsYXJpZnkgaXQuDQo+ID4gDQo+ID4gQW5vdGhlciBvbmUgaXMgbWlub3IgbGlzdGVkIGJlbG93
LCBvdGhlcndpc2UNCj4gPiANCj4gPiBBY2tlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+DQo+ID4gDQo+ID4gPiANCj4gPiA+IEBAIC0xNTIs
NiArMTU0LDExIEBAIGR3X2RtYV9wYXJzZV9kdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ID4g
PiAqcGRldikNCj4gPiA+IMKgCQkJcGRhdGEtPmRhdGFfd2lkdGhbdG1wXSA9IEJJVChhcnJbdG1w
XSAmDQo+ID4gPiAweDA3KTsNCj4gPiA+IMKgCX0NCj4gPiA+IMKgDQo+ID4gPiArCWlmICghb2Zf
cHJvcGVydHlfcmVhZF91MzJfYXJyYXkobnAsICJtdWx0aS1ibG9jayIsIGNoYW4sDQo+ID4gPiBu
cl9jaGFubmVscykpIHsNCj4gPiA+ICsJCWZvciAodG1wID0gMDsgdG1wIDwgbnJfY2hhbm5lbHM7
IHRtcCsrKQ0KPiA+ID4gKwkJCXBkYXRhLT5tdWx0aV9ibG9ja1t0bXBdID0gY2hhblt0bXBdOw0K
PiA+IC4uLm1iIChhcyBzaG9ydCBvZiBtdWx0aS1ibG9jaykgd291bGQgc3VpdCBiZXR0ZXIuDQo+
IE9oLCBzb3JyeSwgZ3V5cywgYnV0IG9uZSBtb3JlIGltcG9ydGFudCB0aGluZy4gSWYgdGhlcmUg
aXMgbm8gc3VjaA0KPiBwcm9wZXJ0eSwga2VlcCBhIGRlZmF1bHQgdG8gInN1cHBvcnRlZCIuIE90
aGVyd2lzZSB5b3Ugd2lsbCBicmVhayBvbGQNCj4gKHdvcmtpbmcpIERUQnMuDQpTaG91bGQgSSBy
ZW1vdmUgZXhwbGljaXQgZGVjbGFyYXRpb24gIm11bHRpLWJsb2NrIiBwcm9wZXJ0eSBmcm9tDQpl
eGlzdGluZyBEVFMgKHdoaWNoIEkgYWRkZWQgZHVyaW5nIHY1IHBhdGNoIGl0ZXJhdGlvbik/DQoN
CkkgbWVhbiB0aGF0Og0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCisJCQltdWx0aS1ibG9jayA9IDwxIDEgMSAxIDEgMSAxIDE+Ow0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KV2UgZG9uJ3QgYWN0dWFsbHkg
bmVlZCBpdCwgaWYgd2UgdXNlIHVzZSAxICgic3VwcG9ydGVkIikgYXMgIm11bHRpLQ0KYmxvY2si
IHByb3BlcnR5IGRlZmF1bHQgdmFsdWUuDQoNCi0tIA0KwqBQYWx0c2V2IEV1Z2VuaXkNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJj
IG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmM=
