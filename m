From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v2 3/6] dt-bindings: add Samsung LSN122DL01-C01 panel binding
Date: Wed,  8 Jun 2016 19:52:37 +0800
Message-ID: <1465386757-27773-1-git-send-email-ykk@rock-chips.com>
References: <1465386727-27647-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1465386727-27647-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

VGhlIFNhbXN1bmcgTFNOMTIyREwwMS1DMDEgaXMgYW4gMTIuMiIgMjU2MHgxNjAwIChXUVhHQSkg
VEZULUxDRApwYW5lbCBjb25uZWN0ZWQgdXNpbmcgZURQIGludGVyZmFjZXMuCgpTaWduZWQtb2Zm
LWJ5OiBZYWtpciBZYW5nIDx5a2tAcm9jay1jaGlwcy5jb20+CkFja2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBBZGQgUm9iJ3MgYWNrZWQg
Zm9yIGR0LWJpbmRpbmdzIG9mIFNhbXN1bmcgTFNOMTIyREwwMSBwYW5lbAoKIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2Ftc3VuZyxsc24xMjJkbDAxLWMwMS50eHQgICB8
IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3Nh
bXN1bmcsbHNuMTIyZGwwMS1jMDEudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2Ftc3VuZyxsc24xMjJkbDAxLWMwMS50eHQg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zYW1zdW5n
LGxzbjEyMmRsMDEtYzAxLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5k
YmEyOThiCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvc2Ftc3VuZyxsc24xMjJkbDAxLWMwMS50eHQKQEAgLTAsMCArMSw3
IEBACitTYW1zdW5nIDEyLjIiICgyNTYweDE2MDAgcGl4ZWxzKSBURlQgTENEIHBhbmVsCisKK1Jl
cXVpcmVkIHByb3BlcnRpZXM6CistIGNvbXBhdGlibGU6IHNob3VsZCBiZSAic2Ftc3VuZyxsc24x
MjJkbDAxLWMwMSIKKworVGhpcyBiaW5kaW5nIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgc2ltcGxl
LXBhbmVsIGJpbmRpbmcsIHdoaWNoIGlzIHNwZWNpZmllZAoraW4gc2ltcGxlLXBhbmVsLnR4dCBp
biB0aGlzIGRpcmVjdG9yeS4KLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
