From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: panel: lvds: Fix path to display timing
 bindings
Date: Fri, 27 Apr 2018 01:45:39 +0300
Message-ID: <101662296.DZBr8NQOBO@avalon>
References: <1524642578-2885-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1524642578-2885-1-git-send-email-geert+renesas@glider.be>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFdlZG5lc2RheSwgMjUgQXBy
aWwgMjAxOCAxMDo0OTozOCBFRVNUIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiBGaXhlczog
MTRkYTNlZDhkZDA4YzU4MSAoImRldmljZXRyZWUvYmluZGluZ3M6IGRpc3BsYXk6IERvY3VtZW50
IGNvbW1vbgo+IHBhbmVsIHByb3BlcnRpZXMiKQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKPiAtLS0KPiAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtY29tbW9u
LnR4dCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdAo+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvcGFuZWwtY29tbW9uLnR4dAo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtY29tbW9uLnR4dCBpbmRleAo+IDU1N2Zh
NzY1YWRjYjk0NTAuLjVkMjUxOWFmNGJiNWNhNWUgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtY29tbW9uLnR4dAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVs
LWNvbW1vbi50eHQKPiBAQCAtMzgsNyArMzgsNyBAQCBEaXNwbGF5IFRpbWluZ3MKPiAgICByZXF1
aXJlIHNwZWNpZmljIGRpc3BsYXkgdGltaW5ncy4gVGhlIHBhbmVsLXRpbWluZyBzdWJub2RlIGV4
cHJlc3Nlcwo+IHRob3NlIHRpbWluZ3MgYXMgc3BlY2lmaWVkIGluIHRoZSB0aW1pbmcgc3Vibm9k
ZSBzZWN0aW9uIG9mIHRoZSBkaXNwbGF5Cj4gdGltaW5nIGJpbmRpbmdzIGRlZmluZWQgaW4KPiAt
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9kaXNwbGF5LXRpbWlu
Zy50eHQuCj4gKyAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvZGlzcGxheS10aW1pbmcudHh0Lgo+IAo+IAo+ICBDb25uZWN0aXZpdHkKCgotLSAKUmVnYXJk
cywKCkxhdXJlbnQgUGluY2hhcnQKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
