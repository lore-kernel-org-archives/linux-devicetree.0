From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: renesas: lvds: Document
 r8a7744 bindings
Date: Tue, 22 Jan 2019 17:44:28 +0200
Message-ID: <20190122154428.GE11461@pendragon.ideasonboard.com>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-3-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1548170749-12773-3-git-send-email-biju.das@bp.renesas.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

SGkgQmlqdSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVHVlLCBKYW4gMjIsIDIwMTkg
YXQgMDM6MjU6NDZQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6Cj4gRG9jdW1lbnQgdGhlIFJaL0cx
TiAoUjhBNzc0NCkgTFZEUyBiaW5kaW5ncy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8
YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKYW5kIHRha2VuIGluIG15IHRyZWUu
Cgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvcmVuZXNhcyxsdmRzLnR4dCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dAo+IGluZGV4IDI3YTA1NGUu
LjkwMGE4ODQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dAo+IEBAIC04
LDYgKzgsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAKPiAgLSBjb21wYXRpYmxlIDogU2hh
bGwgY29udGFpbiBvbmUgb2YKPiAgICAtICJyZW5lc2FzLHI4YTc3NDMtbHZkcyIgZm9yIFI4QTc3
NDMgKFJaL0cxTSkgY29tcGF0aWJsZSBMVkRTIGVuY29kZXJzCj4gKyAgLSAicmVuZXNhcyxyOGE3
NzQ0LWx2ZHMiIGZvciBSOEE3NzQ0IChSWi9HMU4pIGNvbXBhdGlibGUgTFZEUyBlbmNvZGVycwo+
ICAgIC0gInJlbmVzYXMscjhhNzc0YzAtbHZkcyIgZm9yIFI4QTc3NEMwIChSWi9HMkUpIGNvbXBh
dGlibGUgTFZEUyBlbmNvZGVycwo+ICAgIC0gInJlbmVzYXMscjhhNzc5MC1sdmRzIiBmb3IgUjhB
Nzc5MCAoUi1DYXIgSDIpIGNvbXBhdGlibGUgTFZEUyBlbmNvZGVycwo+ICAgIC0gInJlbmVzYXMs
cjhhNzc5MS1sdmRzIiBmb3IgUjhBNzc5MSAoUi1DYXIgTTItVykgY29tcGF0aWJsZSBMVkRTIGVu
Y29kZXJzCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
