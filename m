From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v4 4/6] dt-bindings: media: rcar-vin: Add 'data-enable-active'
Date: Tue, 12 Jun 2018 16:26:04 +0200
Message-ID: <1528813566-17927-5-git-send-email-jacopo+renesas@jmondi.org>
References: <1528813566-17927-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1528813566-17927-1-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com, horms@verge.net.au, geert@glider.be
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

RGVzY3JpYmUgb3B0aW9uYWwgZW5kcG9pbnQgcHJvcGVydHkgJ2RhdGEtZW5hYmxlLWFjdGl2ZScg
Zm9yIFItQ2FyIFZJTi4KClNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVz
YXNAam1vbmRpLm9yZz4KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
ClJldmlld2VkLWJ5OiBOaWtsYXMgU8O2ZGVybHVuZCA8bmlrbGFzLnNvZGVybHVuZCtyZW5lc2Fz
QHJhZ25hdGVjaC5zZQotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9yY2FyX3Zpbi50eHQgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3JjYXJf
dmluLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9yY2FyX3Zp
bi50eHQKaW5kZXggODdmOTNlYy4uODEzMDg0OSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3JjYXJfdmluLnR4dAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvcmNhcl92aW4udHh0CkBAIC01Nyw2ICs1Nyw4IEBA
IGZyb20gbG9jYWwgU29DIENTSS0yIHJlY2VpdmVycyAocG9ydDEpIGRlcGVuZGluZyBvbiBTb0Mu
CiAgICAgICAtIE9wdGlvbmFsIHByb3BlcnRpZXMgZm9yIGVuZHBvaW50IG5vZGVzIG9mIHBvcnRA
MDoKICAgICAgICAgLSBoc3luYy1hY3RpdmU6IHNlZSBbMV0gZm9yIGRlc2NyaXB0aW9uLiBEZWZh
dWx0IGlzIGFjdGl2ZSBoaWdoLgogICAgICAgICAtIHZzeW5jLWFjdGl2ZTogc2VlIFsxXSBmb3Ig
ZGVzY3JpcHRpb24uIERlZmF1bHQgaXMgYWN0aXZlIGhpZ2guCisgICAgICAgIC0gZGF0YS1lbmFi
bGUtYWN0aXZlOiBwb2xhcml0eSBvZiBDTEtFTkIgc2lnbmFsLCBzZWUgWzFdIGZvcgorICAgICAg
ICAgIGRlc2NyaXB0aW9uLiBEZWZhdWx0IGlzIGFjdGl2ZSBoaWdoLgogCiAgICAgICAgIElmIGJv
dGggSFNZTkMgYW5kIFZTWU5DIHBvbGFyaXRpZXMgYXJlIG5vdCBzcGVjaWZpZWQsIGVtYmVkZGVk
CiAgICAgICAgIHN5bmNocm9uaXphdGlvbiBpcyBzZWxlY3RlZC4KLS0gCjIuNy40CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5l
bCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
