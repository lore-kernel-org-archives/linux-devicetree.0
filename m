From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] dt-bindings: mtd: explicitly document nesting
 partitions descriptions
Date: Mon, 16 Jul 2018 11:57:17 -0600
Message-ID: <20180716175717.GA14348@rob-hp-laptop>
References: <20180713143221.8474-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180713143221.8474-1-zajec5@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBKdWwgMTMsIDIwMTggYXQgMDQ6MzI6MjBQTSArMDIwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBE
b2N1bWVudGF0aW9uIHdhcyBhbHJlYWR5IHNheWluZyB0aGF0IGZpeGVkIGFuZCBkeW5hbWljIHBh
cnRpdGlvbmluZyBjYW4KPiBiZSBtaXhlZCBidXQgd2FzIG1pc3NpbmcgYSBjbGVhciBkZXNjcmlw
dGlvbiBhbmQgZXhhbXBsZXMuIFRoaXMgY29tbWl0Cj4gYWRkcyBhIHByb3BlciBkb2N1bWVudGF0
aW9uIG9mIGhvdyBkZXNjcmlwdGlvbnMgY2FuIGJlIG5lc3RlZCBhbmQgaG93Cj4gbGF5b3V0cyBj
YW4gYmUgbWl4ZWQuCj4gCj4gVGhpcyBhZGRpdGlvbiBpcyBpbXBvcnRhbnQgZm9yIHBhcnRpdGlv
bnMgdGhhdCBjb250YWluIHN1YnBhcnRpdGlvbnMuCj4gSW4gc3VjaCBjYXNlcyBwYXJ0aXRpb25z
IGhhdmUgdG8gYmUgcHJvcGVybHkgZGVzY3JpYmVkIGluIG9yZGVyIHRvIGxldAo+IHN5c3RlbSBo
YW5kbGUgdGhlbSBjb3JyZWN0bHkuCj4gCj4gRGVwZW5kaW5nIG9uIHNpdHVhdGlvbiwgbmVzdGlu
ZyBkZXNjcmlwdGlvbnMgbWF5IHByb3ZpZGUgbW9yZSBhY2N1cmF0ZQo+IGxvZ2ljL3N0cnVjdHVy
ZSBhbmQvb3IgYWxsb3cgbWl4aW5nIHBhcnRpdGlvbmluZyB0eXBlcyAodmFyaW91cwo+ICJjb21w
YXRpYmxlIiB2YWx1ZXMpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFm
YWxAbWlsZWNraS5wbD4KPiAtLS0KPiBWMjogUmV3cm90ZSBleGFtcGxlOiBJIGNhbiBpbmNsdWRl
ICJicmNtLHRyeCIgbm93IGFzIGl0cyBEb2N1bWVudGF0aW9uCj4gICAgIGhhcyBiZWVuIHB1c2hl
ZCBpbnRvIG10ZCBnaXQgdHJlZS4KPiAgICAgVXBkYXRlZCBjb21taXQgbWVzc2FnZS4KPiAtLS0K
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbi50eHQgICAgICAgICAgfCA0
NiArKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25z
KCspCgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
