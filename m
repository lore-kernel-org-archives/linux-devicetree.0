From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v4 12/13] drm/panel: simple: Add boe,
 tv080wum-nl0 simple panel device tree binding
Date: Fri, 20 Nov 2015 16:15:38 +0800
Message-ID: <1448007339-10966-13-git-send-email-zyw@rock-chips.com>
References: <1448007339-10966-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1448007339-10966-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: heiko@sntech.de, linux-rockchip@lists.infradead.org, mark.yao@rock-chips.com, treding@nvidia.com, emil.l.velikov@gmail.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Chris Zhong <zyw@rock-chips.com>, rmk+kernel@arm.linux.org.uk, ajaykumar.rs@samsung.com
List-Id: devicetree@vger.kernel.org

VGhpcyBiaW5kaW5nIHNwZWNpZmllcyBhIHNldCBvZiBjb21tb24gcHJvcGVydGllcyBmb3IgZGlz
cGxheSBwYW5lbHMuIEl0CmNhbiBiZSB1c2VkIGFzIGEgYmFzaXMgYnkgYmluZGluZ3MgZm9yIHNw
ZWNpZmljIHBhbmVscy4KQmluZGluZ3MgZm9yIHRocmVlIHNwZWNpZmljIHBhbmVscyBhcmUgcHJv
dmlkZWQgdG8gc2hvdyBob3cgdGhlCnNpbXBsZSBwYW5lbCBiaW5kaW5nIGNhbiBiZSB1c2VkLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXMgWmhvbmcgPHp5d0Byb2NrLWNoaXBzLmNvbT4KQWNrZWQtYnk6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgotLS0KCkNoYW5nZXMgaW4gdjQ6IE5vbmUK
Q2hhbmdlcyBpbiB2MzoKbW92ZSBib2UsdHYwODB3dW0tbmwwLnR4dCB0byBiaW5kaW5ncy9kaXNw
bGF5L3BhbmVsLwoKQ2hhbmdlcyBpbiB2MjoKQXMgVGhpZXJyeS5SZWRpbmcgY29tbWVudCwgYWRk
IGEgZG9jdW1lbnRhdGlvbiBmb3IgdGhpcyBwYW5lbC4KCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL2JvZSx0djA4MHd1bS1ubDAudHh0ICAgICAgICAgfCA3ICsrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYwODB3dW0t
bmwwLnR4dAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL2JvZSx0djA4MHd1bS1ubDAudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MDgwd3VtLW5sMC50eHQKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uNTBiZTVlMgotLS0gL2Rldi9udWxsCisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2JvZSx0djA4MHd1
bS1ubDAudHh0CkBAIC0wLDAgKzEsNyBAQAorQm9lIENvcnBvcmF0aW9uIDguMCIgV1VYR0EgVEZU
IExDRCBwYW5lbAorCitSZXF1aXJlZCBwcm9wZXJ0aWVzOgorLSBjb21wYXRpYmxlOiBzaG91bGQg
YmUgImJvZSx0djA4MHd1bS1ubDAiCisKK1RoaXMgYmluZGluZyBpcyBjb21wYXRpYmxlIHdpdGgg
dGhlIHNpbXBsZS1wYW5lbCBiaW5kaW5nLCB3aGljaCBpcyBzcGVjaWZpZWQKK2luIHNpbXBsZS1w
YW5lbC50eHQgaW4gdGhpcyBkaXJlY3RvcnkuCi0tIAoyLjYuMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
