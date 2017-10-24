From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 05/10] drm/sun4i: Add support for A20 display pipeline
 components
Date: Tue, 24 Oct 2017 11:34:21 -0500
Message-ID: <20171024163421.wfbk5jlm2g5xmr55@rob-hp-laptop>
References: <20171017121807.2994-1-wens@csie.org>
 <20171017121807.2994-6-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20171017121807.2994-6-wens@csie.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jonathan Liu <net147@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBPY3QgMTcsIDIwMTcgYXQgMDg6MTg6MDJQTSArMDgwMCwgQ2hlbi1ZdSBUc2FpIHdy
b3RlOgo+IEZyb206IEpvbmF0aGFuIExpdSA8bmV0MTQ3QGdtYWlsLmNvbT4KPiAKPiBUaGUgQTIw
IGRpc3BsYXkgcGlwZWxpbmUgaGFzIDIgZnJvbnRlbmRzLCAyIGJhY2tlbmRzLCBhbmQgMiBUQ09O
cy4KPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCAob3IgYSBjb21wYXRpYmxlIHN0cmluZyBpbiB0
aGUgZnJvbnRlbmQncwo+IGNhc2UpIGZvciB0aGVzZSBjb21wb25lbnRzLgo+IAo+IFRoZSBUQ09O
cyBzdXBwb3J0IGRpcmVjdGx5IG91dHB1dHRpbmcgdG8gQ1BVL1JHQi9MVkRTIExDRCBwYW5lbHMs
Cj4gb3IgaXQgY2FuIG91dHB1dCB0byBIRE1JIHZpYSBhbiBvbi1jaGlwIEhETUkgY29udHJvbGxl
ciwgb3IKPiBDVkJTL1lQYlByL1ZHQSBzaWduYWxzIHZpYSBvbi1jaGlwIFRWIGVuY29kZXJzLiBU
aGVzZSBhZGRpdGlvbmFsCj4gZW5jb2RlcnMgYXJlIG5vdCBjb3ZlcmVkIGluIHRoaXMgcGF0Y2gu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gTGl1IDxuZXQxNDdAZ21haWwuY29tPgo+IFt3
ZW5zQGNzaWUub3JnOiBFeHBhbmQgY29tbWl0IG1lc3NhZ2VdCj4gU2lnbmVkLW9mZi1ieTogQ2hl
bi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW40aS1kcm0udHh0IHwgNCArKysrCj4gIGRyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW40aV9iYWNrZW5kLmMgICAgICAgICAgICAgICAgICAgICAgICAg
fCA4ICsrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9kcnYuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAzICsrKwo+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
NGlfdGNvbi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNyArKysrKysrCj4gIDQgZmls
ZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQoKQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+CgpJbiB0aGUgZnV0dXJlLCBwbGVhc2UgcHV0IGFsbCB0aGVzZSBEVCBjaGFu
Z2VzIGluIGEgc2VwYXJhdGUgcGF0Y2guCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
