From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: Add LVDS decoder to R-Car
 V3M Eagle
Date: Sat, 10 Mar 2018 18:22:08 +0100
Message-ID: <20180310172208.GI4023@w540>
References: <1520603500-15218-1-git-send-email-jacopo+renesas@jmondi.org>
 <1520603500-15218-4-git-send-email-jacopo+renesas@jmondi.org>
 <e0ff40be-f134-5a86-6d00-9506d9829364@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <e0ff40be-f134-5a86-6d00-9506d9829364@cogentembedded.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, magnus.damm@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org

SGkgU2VyZ2VpLAoKT24gRnJpLCBNYXIgMDksIDIwMTggYXQgMDg6MzA6MzZQTSArMDMwMCwgU2Vy
Z2VpIFNodHlseW92IHdyb3RlOgo+IE9uIDAzLzA5LzIwMTggMDQ6NTEgUE0sIEphY29wbyBNb25k
aSB3cm90ZToKPgo+ID4gVGhlIFItQ2FyIFYzTSBFYWdsZSBib2FyZCBpbmNsdWRlcyBhIHRyYW5z
cGFyZW50IExWRFMgZGVjb2RlciwgY29ubmVjdGVkCj4gPiB0byB0aGUgb24tY2hpcCBMVkRTIGVu
Y29kZXIgb3V0cHV0IG9uIG9uZSBzaWRlIGFuZCB0byBIRE1JIGVuY29kZXIKPiA+IEFEVjc1MTF3
IG9uIHRoZSBvdGhlciBvbmUuCj4gPgo+ID4gQXMgdGhlIGRlY29kZXIgZG9lcyBub3QgbmVlZCBh
bnkgY29uZmlndXJhdGlvbiBpdCBoYXMgYmVlbiBzby1mYXIKPiA+IG9taXR0ZWQgZnJvbSBEVFMu
IE5vdyB0aGF0IGEgZHJpdmVyIGZvciB0cmFuc3BhcmVudCBMVkRTIGRlY29kZXIgaXMKPiA+IGF2
YWlsYWJsZSwgZGVzY3JpYmUgaXQgaW4gRFQgYXMgd2VsbC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4gPiAtLS0KPiA+ICBh
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NzAtZWFnbGUuZHRzIHwgMzEgKysrKysr
KysrKysrKysrKysrKysrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I4YTc3OTcwLWVhZ2xlLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9yOGE3Nzk3MC1lYWdsZS5kdHMKPiA+IGluZGV4IGMwZmQxNDQuLjBhOTVjMjAgMTAwNjQ0Cj4g
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NzAtZWFnbGUuZHRzCj4g
PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NzAtZWFnbGUuZHRzCj4g
PiBAQCAtNDIsNiArNDIsMzMgQEAKPiA+ICAJCQl9Owo+ID4gIAkJfTsKPiA+ICAJfTsKPiA+ICsK
PiA+ICsJbHZkcyxkZWNvZGVyIHsKPgo+ICAgIEkgc2FpZCBoeXBoZW4gKC0pLCBub3QgY29tbWEg
KCwpISA6LSkKCkFoYWggb2ssIG15IGJhZCwgSSBzb21laG93IGNvbmZ1c2VkIHRoZSB0d28gOikK
SXQgbG9va2VkIHdlaXJkIHRvIG1lLCBidXQgSSB0aG91Z2h0IHlvdSB3ZXJlIHBvaW50aW5nIG1l
IHRvIHNvbWUKY29udmVudGlvbiBJIGRpZG4ndCBrbm93IGFib3V0IQoKSSdsbCBjaGFuZ2UgdGhp
cyBpbiB2MwoKVGhhbmtzCiAgago+Cj4gWy4uLl0KPgo+IE1CUiwgU2VyZ2VpCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
