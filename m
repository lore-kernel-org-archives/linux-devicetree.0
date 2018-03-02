From: Philippe Cornu <philippe.cornu@st.com>
Subject: [PATCH v2 0/2] drm/panel: Add support for Raydium RM68200 panel
Date: Fri, 2 Mar 2018 16:32:20 +0100
Message-ID: <20180302153222.4377-1-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>, Vincent Abriou <vincent.abriou@st.com>
List-Id: devicetree@vger.kernel.org

VGhlIFJheWRpdW0gU2VtaWNvbmR1Y3RvciBDb3Jwb3JhdGlvbiBSTTY4MjAwIGlzIGEgNS41IiA3
MjB4MTI4MApURlQgTENEIHBhbmVsIGNvbm5lY3RlZCB1c2luZyBhIE1JUEktRFNJIHZpZGVvIGlu
dGVyZmFjZS4KClZlcnNpb24gMjoKLSBBZGQgUm9iIEhlcnJpbmcgUmV2aWV3ZWQtYnkgb24gZHQt
YmluZGluZ3MuCi0gVXBkYXRlIEtjb25maWcgJiBkcml2ZXIgdGhhbmtzIHRvIFRoaWVycnkgUmVk
aW5nIGNvbW1lbnRzOiBubyBtb3JlCiAgRFJWX05BTUUsIERSTV9XQVJOX09OQ0UgaW5zdGVhZCBv
ZiBEUlZfTkFNRSB3aGVyZSBhcHBsaWNhYmxlLCB1c2UKICBiYWNrbGlnaHRfZW5hYmxlL2Rpc2Fi
bGUoKSAmIGRldm1fb2ZfZmluZF9iYWNrbGlnaHQoKSwgbm8gZXh0cmEKICBncGlvIHJlc2V0IHRv
IDAsIG5vIG1vcmUgbXNnIGlmIHN1Y2Nlc3NmdWwsIHVzZSBSTTY4MjAwIGluc3RlYWQgb2YKICBy
bTY4MjAwIHdoZXJlIG5lY2Vzc2FyeS4KClZlcnNpb24gMToKLSBJbml0aWFsIGNvbW1pdAoKUGhp
bGlwcGUgQ29ybnUgKDIpOgogIGR0LWJpbmRpbmdzL2Rpc3BsYXkvcGFuZWw6IEFkZCBzdXBwb3J0
IGZvciBSYXlkaXVtIHJtNjgyMDAgZHNpIHBhbmVsCiAgZHJtL3BhbmVsOiBBZGQgc3VwcG9ydCBm
b3IgUmF5ZGl1bSBSTTY4MjAwIHBhbmVsIGRyaXZlcgoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL3JheWRpdW0scm02ODIwMC50eHQgICAgIHwgIDI1ICsrCiBkcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtcmF5ZGl1bS1ybTY4MjAwLmMgICAgICB8IDQzNyArKysrKysrKysrKysr
KysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNDcxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9y
YXlkaXVtLHJtNjgyMDAudHh0CiBjcmVhdGUgbW9kZSAxMDA3NTUgZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXJheWRpdW0tcm02ODIwMC5jCgotLSAKMi4xNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
