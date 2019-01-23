From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: renesas: lvds: Document
 r8a7744 bindings
Date: Wed, 23 Jan 2019 09:59:17 +0100
Message-ID: <20190123085916.enynafmsnrhm2bmk@verge.net.au>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-3-git-send-email-biju.das@bp.renesas.com>
 <20190122154428.GE11461@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190122154428.GE11461@pendragon.ideasonboard.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBKYW4gMjIsIDIwMTkgYXQgMDU6NDQ6MjhQTSArMDIwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBCaWp1LAo+IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9u
IFR1ZSwgSmFuIDIyLCAyMDE5IGF0IDAzOjI1OjQ2UE0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOgo+
ID4gRG9jdW1lbnQgdGhlIFJaL0cxTiAoUjhBNzc0NCkgTFZEUyBiaW5kaW5ncy4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPgo+IAo+IFJl
dmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+Cj4gCj4gYW5kIHRha2VuIGluIG15IHRyZWUuCgpSZXZpZXdlZC1ieTogU2ltb24gSG9y
bWFuIDxob3JtcytyZW5lc2FzQHZlcmdlLm5ldC5hdT4KCj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dCB8
IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3Jl
bmVzYXMsbHZkcy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dAo+ID4gaW5kZXggMjdhMDU0ZS4uOTAwYTg4NCAxMDA2
NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9yZW5lc2FzLGx2ZHMudHh0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dAo+ID4gQEAgLTgsNiArOCw3
IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gPiAgCj4gPiAgLSBjb21wYXRpYmxlIDogU2hhbGwg
Y29udGFpbiBvbmUgb2YKPiA+ICAgIC0gInJlbmVzYXMscjhhNzc0My1sdmRzIiBmb3IgUjhBNzc0
MyAoUlovRzFNKSBjb21wYXRpYmxlIExWRFMgZW5jb2RlcnMKPiA+ICsgIC0gInJlbmVzYXMscjhh
Nzc0NC1sdmRzIiBmb3IgUjhBNzc0NCAoUlovRzFOKSBjb21wYXRpYmxlIExWRFMgZW5jb2RlcnMK
PiA+ICAgIC0gInJlbmVzYXMscjhhNzc0YzAtbHZkcyIgZm9yIFI4QTc3NEMwIChSWi9HMkUpIGNv
bXBhdGlibGUgTFZEUyBlbmNvZGVycwo+ID4gICAgLSAicmVuZXNhcyxyOGE3NzkwLWx2ZHMiIGZv
ciBSOEE3NzkwIChSLUNhciBIMikgY29tcGF0aWJsZSBMVkRTIGVuY29kZXJzCj4gPiAgICAtICJy
ZW5lc2FzLHI4YTc3OTEtbHZkcyIgZm9yIFI4QTc3OTEgKFItQ2FyIE0yLVcpIGNvbXBhdGlibGUg
TFZEUyBlbmNvZGVycwo+IAo+IC0tIAo+IFJlZ2FyZHMsCj4gCj4gTGF1cmVudCBQaW5jaGFydAo+
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
