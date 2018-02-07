From: Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v2 1/5] dt-bindings: Add headings to simple-panel bindings
Date: Wed,  7 Feb 2018 12:23:55 -0500
Message-ID: <20180207172404.107358-2-seanpaul@chromium.org>
References: <20180207172404.107358-1-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180207172404.107358-1-seanpaul@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Jeffy Chen <jeffy.chen@rock-chips.com>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>
List-Id: devicetree@vger.kernel.org

SW4gcHJlcGFyYXRpb24gZm9yIGEgbmV3IHN1Ym5vZGUgc2VjdGlvbiBpbiBhIGZvbGxvdy1vbiBw
YXRjaCwgYWRkCmV4cGxpY2l0IGhlYWRpbmdzIHRvIHRoZSBleGlzdGluZ3Mgc2VjdGlvbnMgZm9y
IHNpbXBsZS1wYW5lbC4KCkNoYW5nZXMgaW4gdjI6CiAtIEFkZGVkCgpDYzogRG91ZyBBbmRlcnNv
biA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgpDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5l
dD4KQ2M6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+CkNjOiBKZWZmeSBDaGVuIDxq
ZWZmeS5jaGVuQHJvY2stY2hpcHMuY29tPgpDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVs
Lm9yZz4KQ2M6IFN0w6lwaGFuZSBNYXJjaGVzaW4gPG1hcmNoZXVAY2hyb21pdW0ub3JnPgpDYzog
VGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBs
aW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1
bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NpbXBsZS1wYW5lbC50eHQgfCA0ICsrKysKIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaW1wbGUtcGFuZWwudHh0IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2ltcGxlLXBhbmVsLnR4dApp
bmRleCAxNmQ4ZmYwODhiN2QuLjQ1YTQ1N2FkMzhmMCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2ltcGxlLXBhbmVsLnR4dAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaW1wbGUt
cGFuZWwudHh0CkBAIC0xLDQgKzEsOCBAQAogU2ltcGxlIGRpc3BsYXkgcGFuZWwKKz09PT09PT09
PT09PT09PT09PT09CisKK3BhbmVsIG5vZGUKKy0tLS0tLS0tLS0KIAogUmVxdWlyZWQgcHJvcGVy
dGllczoKIC0gcG93ZXItc3VwcGx5OiBTZWUgcGFuZWwtY29tbW9uLnR4dAotLSAKMi4xNi4wLnJj
MS4yMzguZzUzMGQ2NDlhNzktZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
