From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH 2/4] arm64: dts: rockchip: add rockchip,
 uphy-dp-sel for Type-C phy
Date: Fri, 10 Feb 2017 15:44:12 +0800
Message-ID: <1486712654-15431-3-git-send-email-zyw@rock-chips.com>
References: <1486712654-15431-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1486712654-15431-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, kishon@ti.com, robh@kernel.org, linux-rockchip@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>, Shawn Lin <shawn.lin@rock-chips.com>, Brian Norris <briannorris@chromium.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, zyw@rock-chips.com, Rob Herring <robh+dt@kernel.org>, David Wu <david.wu@rock-chips.com>, groeck@chromium.org, William wu <wulf@rock-chips.com>, Caesar Wang <wxt@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

cm9ja2NoaXAsdXBoeS1kcC1zZWwgaXMgdGhlIHJlZ2lzdGVyIG9mIHR5cGUtYyBwaHkgZW5hYmxl
IERQIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgWmhvbmcgPHp5d0Byb2NrLWNoaXBz
LmNvbT4KLS0tCgogYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMzOTkuZHRzaSB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9y
b2NrY2hpcC9yazMzOTkuZHRzaQppbmRleCA4ZTZkMWJkLi43ZThhYThjIDEwMDY0NAotLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS5kdHNpCisrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcm9ja2NoaXAvcmszMzk5LmR0c2kKQEAgLTEyMjUsNiArMTIyNSw3IEBACiAJCXJv
Y2tjaGlwLHVzYjN0b3VzYjItZW4gPSA8MHhlNTgwIDMgMTk+OwogCQlyb2NrY2hpcCxleHRlcm5h
bC1wc20gPSA8MHhlNTg4IDE0IDMwPjsKIAkJcm9ja2NoaXAscGlwZS1zdGF0dXMgPSA8MHhlNWMw
IDAgMD47CisJCXJvY2tjaGlwLHVwaHktZHAtc2VsID0gPDB4NjI2OCAxOSAxOT47CiAJCXN0YXR1
cyA9ICJkaXNhYmxlZCI7CiAKIAkJdGNwaHkwX2RwOiBkcC1wb3J0IHsKQEAgLTEyNTQsNiArMTI1
NSw3IEBACiAJCXJvY2tjaGlwLHVzYjN0b3VzYjItZW4gPSA8MHhlNThjIDMgMTk+OwogCQlyb2Nr
Y2hpcCxleHRlcm5hbC1wc20gPSA8MHhlNTk0IDE0IDMwPjsKIAkJcm9ja2NoaXAscGlwZS1zdGF0
dXMgPSA8MHhlNWMwIDE2IDE2PjsKKwkJcm9ja2NoaXAsdXBoeS1kcC1zZWwgPSA8MHg2MjY4IDMg
MTk+OwogCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCiAJCXRjcGh5MV9kcDogZHAtcG9ydCB7Ci0t
IAoyLjYuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
