From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 01/15] clk: sunxi-ng: Add check for minimal rate to NM PLLs
Date: Mon, 26 Feb 2018 18:28:43 +0800
Message-ID: <CAGb2v67X8BpvSbxj4So0fdPnY5c6yEKza6b=KZWf7qxMaOUXWg@mail.gmail.com>
References: <20180224214545.3740-1-jernej.skrabec@siol.net>
 <20180224214545.3740-2-jernej.skrabec@siol.net>
 <20180226093800.uwbo54wrdcwmsyzh@flea.lan>
 <CAGb2v64fxs5Ne5=orQxNcg70Z_N0NJyyC7MPuNH6pxcqrsUq4g@mail.gmail.com>
 <20180226102557.7bgjs3txp7cbridn@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180226102557.7bgjs3txp7cbridn@flea.lan>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>, Mike Turquette <mturquette@baylibre.com>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Stephen Boyd <sboyd@kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBGZWIgMjYsIDIwMTggYXQgNjoyNSBQTSwgTWF4aW1lIFJpcGFyZAo8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4gd3JvdGU6Cj4gT24gTW9uLCBGZWIgMjYsIDIwMTggYXQgMDU6NDM6
MDFQTSArMDgwMCwgQ2hlbi1ZdSBUc2FpIHdyb3RlOgo+PiBPbiBNb24sIEZlYiAyNiwgMjAxOCBh
dCA1OjM4IFBNLCBNYXhpbWUgUmlwYXJkCj4+IDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPiB3
cm90ZToKPj4gPiBIaSwKPj4gPgo+PiA+IE9uIFNhdCwgRmViIDI0LCAyMDE4IGF0IDEwOjQ1OjMx
UE0gKzAxMDAsIEplcm5laiBTa3JhYmVjIHdyb3RlOgo+PiA+PiBTb21lIE5NIFBMTHMgZG9lc24n
dCB3b3JrIHdlbGwgd2hlbiB0aGVpciBvdXRwdXQgY2xvY2sgcmF0ZSBpcyBzZXQgYmVsb3cKPj4g
Pj4gY2VydGFpbiByYXRlLgo+PiA+Pgo+PiA+PiBBZGQgc3VwcG9ydCBmb3IgdGhhdCBjb25zdHJh
aW4uCj4+ID4KPj4gPiBJbiBzdWNoIGEgY2FzZSwgeW91IHNob3VsZCByb3VuZCB0aGUgcmF0ZSB0
byB0aGUgbWluaW11bSB0aGUgY2xvY2sgY2FuCj4+ID4gb3BlcmF0ZSBhdCwgYW5kIG5vdCByZXR1
cm4gYW4gZXJyb3IuCj4+Cj4+IFRoYXQncyB0cnVlIGZvciByb3VuZF9yYXRlLiBCdXQgd2hhdCdz
IHRoZSBleHBlY3RlZCBiZWhhdmlvciBvZiBzZXRfcmF0ZT8KPj4gQUZBSUsgd2UgcHJlc3VtZSBh
bGwgdXNlcnMgY2FsbCByb3VuZF9yYXRlIGJlZm9yZSBzZXRfcmF0ZSwgYnV0IHRoYXQgZG9lc24n
dAo+PiBzZWVtIHRvIGJlIHRydWUgYWxsIHRoZSB0aW1lLgo+Cj4gT25lIG9mIHRoZSBmaXJzdCB0
aGluZ3MgdGhhdCBoYXBwZW5zIGR1cmluZyBhIHNldF9yYXRlIGlzIGEgcm91bmRfcmF0ZToKPiBo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NC4xNi1yYzMvc291cmNlL2RyaXZlcnMv
Y2xrL2Nsay5jI0wxODczCgpBaCEgVGhpcyB3YXMgYWRkZWQgcmVjZW50bHkgaW4gY29tbWl0IGNh
NWUwODlhMzJjNSAoImNsazogdXNlIHJvdW5kIHJhdGUKdG8gYmFpbCBvdXQgZWFybHkgaW4gc2V0
X3JhdGUiKS4KClRoYW5rcyBmb3IgdGhlIHRpcCEKQ2hlbll1Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
