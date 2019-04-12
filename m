From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH V2 2/4] dt-bindings: display: renesas: lvds: Document r8a774a1
 bindings
Date: Fri, 12 Apr 2019 13:38:03 +0100
Message-ID: <1555072685-59276-3-git-send-email-biju.das@bp.renesas.com>
References: <1555072685-59276-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1555072685-59276-1-git-send-email-biju.das@bp.renesas.com>
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
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+ClJldmlld2VkLWJ5OiBLaWVy
YW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgotLS0K
VjEtLT5WMgogKiBBZGRlZCBLaWVyYW4ncyBSZXZpZXdlZC1ieSB0YWcKLS0tCiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dCB8
IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVu
ZXNhcyxsdmRzLnR4dAppbmRleCA5MDBhODg0Li44NmE2OTFhIDEwMDY0NAotLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4
dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
cmVuZXNhcyxsdmRzLnR4dApAQCAtOSw2ICs5LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKIC0g
Y29tcGF0aWJsZSA6IFNoYWxsIGNvbnRhaW4gb25lIG9mCiAgIC0gInJlbmVzYXMscjhhNzc0My1s
dmRzIiBmb3IgUjhBNzc0MyAoUlovRzFNKSBjb21wYXRpYmxlIExWRFMgZW5jb2RlcnMKICAgLSAi
cmVuZXNhcyxyOGE3NzQ0LWx2ZHMiIGZvciBSOEE3NzQ0IChSWi9HMU4pIGNvbXBhdGlibGUgTFZE
UyBlbmNvZGVycworICAtICJyZW5lc2FzLHI4YTc3NGExLWx2ZHMiIGZvciBSOEE3NzRBMSAoUlov
RzJNKSBjb21wYXRpYmxlIExWRFMgZW5jb2RlcnMKICAgLSAicmVuZXNhcyxyOGE3NzRjMC1sdmRz
IiBmb3IgUjhBNzc0QzAgKFJaL0cyRSkgY29tcGF0aWJsZSBMVkRTIGVuY29kZXJzCiAgIC0gInJl
bmVzYXMscjhhNzc5MC1sdmRzIiBmb3IgUjhBNzc5MCAoUi1DYXIgSDIpIGNvbXBhdGlibGUgTFZE
UyBlbmNvZGVycwogICAtICJyZW5lc2FzLHI4YTc3OTEtbHZkcyIgZm9yIFI4QTc3OTEgKFItQ2Fy
IE0yLVcpIGNvbXBhdGlibGUgTFZEUyBlbmNvZGVycwotLSAKMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
