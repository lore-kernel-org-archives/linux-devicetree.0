From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v1 0/5] Enable graphic support on RK3288 EVB boards
Date: Tue, 28 Jun 2016 12:48:08 +0800
Message-ID: <1467089288-18355-1-git-send-email-ykk@rock-chips.com>
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
To: Thierry Reding <thierry.reding@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

CkhpIEhlaWtvLAoKICAgVGhpcyBzZXJpZXMganVzdCB3YW50IHRvIGVuYWJsZSB0aGUgZ3JhcGhp
YyBzdXBwb3J0IG9uIFJLMzI4OCBFVkIKYm9hcmRzLCBtb3N0IG9mIHRoZW0gYXJlIERUUyBjaGFu
Z2VzLCBidXQgc3RpbGwgaGF2ZSBvbmUgY2hhbmdlIGFib3V0Cm5ldyBlRFAgcGFuZWwgc3VwcG9y
dC4KClRoYW5rcywKLSBZYWtpcgoKCllha2lyIFlhbmcgKDUpOgogIGR0LWJpbmRpbmdzOiBBZGQg
c3VwcG9ydCBmb3IgTEcgTFAwNzlRWDEtU1AwViAxNTM2eDIwNDggcGFuZWwKICBkcm0vcGFuZWw6
IHNpbXBsZTogQWRkIHN1cHBvcnQgZm9yIExHIExQMDc5UVgxLVNQMFYgMTUzNngyMDQ4IHBhbmVs
CiAgQVJNOiBkdHM6IHJvY2tjaGlwOiBhZGQgZURQL3BhbmVsIGRpc3BsYXkgZGV2aWNlIG5vZGVz
IGZvciByazMyODgtZXZiCiAgQVJNOiBkdHM6IHJvY2tjaGlwOiBhZGQgdGhlIHBhbmVsIHBvd2Vy
IHN1cHBseSBmb3IgcmszMjg4LWV2YiBib2FyZAogICAgd2l0aCBhY3Q4ODQ2IHBtdQogIEFSTTog
ZHRzOiByb2NrY2hpcDogYWRkIHRoZSBwYW5lbCBwb3dlciBzdXBwbHkgZm9yIHJrMzI4OC1ldmIg
Ym9hcmQKICAgIHdpdGggcms4MDggcG11CgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbGcs
bHAwNzlxeDEtc3Awdi50eHQgICAgfCAgNyArKysrCiBhcmNoL2FybS9ib290L2R0cy9yazMyODgt
ZXZiLWFjdDg4NDYuZHRzICAgICAgICAgICB8ICA0ICsrCiBhcmNoL2FybS9ib290L2R0cy9yazMy
ODgtZXZiLXJrODA4LmR0cyAgICAgICAgICAgICB8ICA0ICsrCiBhcmNoL2FybS9ib290L2R0cy9y
azMyODgtZXZiLmR0c2kgICAgICAgICAgICAgICAgICB8IDQzICsrKysrKysrKysrKysrKysrKysr
Ky0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyAgICAgICAgICAgICAgIHwg
MjYgKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA4MyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvbGcsbHAwNzlxeDEtc3Awdi50eHQKCi0tIAoxLjkuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
