From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v3 2/5] dt-bindings: display: renesas: lvds: Document r8a7744
 bindings
Date: Tue, 22 Jan 2019 15:25:46 +0000
Message-ID: <1548170749-12773-3-git-send-email-biju.das@bp.renesas.com>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
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

RG9jdW1lbnQgdGhlIFJaL0cxTiAoUjhBNzc0NCkgTFZEUyBiaW5kaW5ncy4KClNpZ25lZC1vZmYt
Ynk6IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dCB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNh
cyxsdmRzLnR4dAppbmRleCAyN2EwNTRlLi45MDBhODg0IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVu
ZXNhcyxsdmRzLnR4dApAQCAtOCw2ICs4LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKIAogLSBj
b21wYXRpYmxlIDogU2hhbGwgY29udGFpbiBvbmUgb2YKICAgLSAicmVuZXNhcyxyOGE3NzQzLWx2
ZHMiIGZvciBSOEE3NzQzIChSWi9HMU0pIGNvbXBhdGlibGUgTFZEUyBlbmNvZGVycworICAtICJy
ZW5lc2FzLHI4YTc3NDQtbHZkcyIgZm9yIFI4QTc3NDQgKFJaL0cxTikgY29tcGF0aWJsZSBMVkRT
IGVuY29kZXJzCiAgIC0gInJlbmVzYXMscjhhNzc0YzAtbHZkcyIgZm9yIFI4QTc3NEMwIChSWi9H
MkUpIGNvbXBhdGlibGUgTFZEUyBlbmNvZGVycwogICAtICJyZW5lc2FzLHI4YTc3OTAtbHZkcyIg
Zm9yIFI4QTc3OTAgKFItQ2FyIEgyKSBjb21wYXRpYmxlIExWRFMgZW5jb2RlcnMKICAgLSAicmVu
ZXNhcyxyOGE3NzkxLWx2ZHMiIGZvciBSOEE3NzkxIChSLUNhciBNMi1XKSBjb21wYXRpYmxlIExW
RFMgZW5jb2RlcnMKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
