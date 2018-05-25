From: <stu.hsieh@mediatek.com>
Subject: [PATCH v3 1/8] drm/mediatek: update dt-bindings for mt2712
Date: Fri, 25 May 2018 10:34:18 +0800
Message-ID: <1527215665-11937-2-git-send-email-stu.hsieh@mediatek.com>
References: <1527215665-11937-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1527215665-11937-1-git-send-email-stu.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgoKVXBkYXRlIGRldmljZSB0
cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIGRpc3BsYXkgc3Vic3lzdGVtIGZvcgpN
ZWRpYXRlayBNVDI3MTIgU29Dcy4KClNpZ25lZC1vZmYtYnk6IFN0dSBIc2llaCA8c3R1LmhzaWVo
QG1lZGlhdGVrLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWssZGlzcC50eHQKaW5kZXggMzgzMTgzYTg5MTY0Li44NDY5ZGU1MTAwMDEgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLGRpc3AudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0CkBAIC00MCw3ICs0MCw3IEBAIFJlcXVpcmVk
IHByb3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBibG9ja3MpOgogCSJtZWRpYXRlayw8Y2hpcD4tZHBp
IiAgICAgICAgLSBEUEkgY29udHJvbGxlciwgc2VlIG1lZGlhdGVrLGRwaS50eHQKIAkibWVkaWF0
ZWssPGNoaXA+LWRpc3AtbXV0ZXgiIC0gZGlzcGxheSBtdXRleAogCSJtZWRpYXRlayw8Y2hpcD4t
ZGlzcC1vZCIgICAgLSBvdmVyZHJpdmUKLSAgdGhlIHN1cHBvcnRlZCBjaGlwcyBhcmUgbXQyNzAx
IGFuZCBtdDgxNzMuCisgIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQyNzEyIGFu
ZCBtdDgxNzMuCiAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhl
IGZ1bmN0aW9uIGJsb2NrIHJlZ2lzdGVyIHNwYWNlCiAtIGludGVycnVwdHM6IFRoZSBpbnRlcnJ1
cHQgc2lnbmFsIGZyb20gdGhlIGZ1bmN0aW9uIGJsb2NrIChyZXF1aXJlZCwgZXhjZXB0IGZvcgog
ICBtZXJnZSBhbmQgc3BsaXQgZnVuY3Rpb24gYmxvY2tzKS4KLS0gCjIuMTIuNQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
