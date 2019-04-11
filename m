From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/4] dt-bindings: display: renesas: lvds: Document r8a774a1
 bindings
Date: Thu, 11 Apr 2019 15:34:29 +0100
Message-ID: <1554993271-29523-3-git-send-email-biju.das@bp.renesas.com>
References: <1554993271-29523-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1554993271-29523-1-git-send-email-biju.das@bp.renesas.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

RG9jdW1lbnQgdGhlIFJaL0cyTSAoUjhBNzc0QTEpIExWRFMgYmluZGluZ3MuCgpTaWduZWQtb2Zm
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+Ci0tLQogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVz
YXMsbHZkcy50eHQKaW5kZXggOTAwYTg4NC4uODZhNjkxYSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3Jl
bmVzYXMsbHZkcy50eHQKQEAgLTksNiArOSw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAtIGNv
bXBhdGlibGUgOiBTaGFsbCBjb250YWluIG9uZSBvZgogICAtICJyZW5lc2FzLHI4YTc3NDMtbHZk
cyIgZm9yIFI4QTc3NDMgKFJaL0cxTSkgY29tcGF0aWJsZSBMVkRTIGVuY29kZXJzCiAgIC0gInJl
bmVzYXMscjhhNzc0NC1sdmRzIiBmb3IgUjhBNzc0NCAoUlovRzFOKSBjb21wYXRpYmxlIExWRFMg
ZW5jb2RlcnMKKyAgLSAicmVuZXNhcyxyOGE3NzRhMS1sdmRzIiBmb3IgUjhBNzc0QTEgKFJaL0cy
TSkgY29tcGF0aWJsZSBMVkRTIGVuY29kZXJzCiAgIC0gInJlbmVzYXMscjhhNzc0YzAtbHZkcyIg
Zm9yIFI4QTc3NEMwIChSWi9HMkUpIGNvbXBhdGlibGUgTFZEUyBlbmNvZGVycwogICAtICJyZW5l
c2FzLHI4YTc3OTAtbHZkcyIgZm9yIFI4QTc3OTAgKFItQ2FyIEgyKSBjb21wYXRpYmxlIExWRFMg
ZW5jb2RlcnMKICAgLSAicmVuZXNhcyxyOGE3NzkxLWx2ZHMiIGZvciBSOEE3NzkxIChSLUNhciBN
Mi1XKSBjb21wYXRpYmxlIExWRFMgZW5jb2RlcnMKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
