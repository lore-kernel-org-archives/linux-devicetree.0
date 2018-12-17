From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 15/15] arm64: defconfig: enable hym8563 rtc driver
Date: Mon, 17 Dec 2018 13:36:50 +0100
Message-ID: <20181217123650.6773-16-heiko@sntech.de>
References: <20181217123650.6773-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181217123650.6773-1-heiko@sntech.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-rockchip@lists.infradead.org, hjc@rock-chips.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIGh5bTg1NjMgaXMgdXNlZCBvbiBhIG51bWJlciBvZiBSb2NrY2hpcCBib2FyZHMgb24gNjRi
aXQgYXMgd2VsbAphbmQgbWF5YmUgZXZlbiBtb3JlIGltcG9ydGFudGx5IGlzIHRoZSBzb3VyY2Ug
Zm9yIDMya0h6IGNsb2NrIG9uIHRob3NlCmFzIHdlbGwsIGNvbXBsZXRpbmcgdGhlIGNsb2NrIHRy
ZWUgb2YgdGhlIHNvYy4gU28gZW5hYmxlIGl0IGFzIGJ1aWx0LWluLgoKU2lnbmVkLW9mZi1ieTog
SGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KLS0tCiBhcmNoL2FybTY0L2NvbmZpZ3Mv
ZGVmY29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIGIvYXJjaC9hcm02NC9jb25maWdzL2Rl
ZmNvbmZpZwppbmRleCBjOWE1N2QxMTMzMGIuLmViNWIwMzIwYzNhMiAxMDA2NDQKLS0tIGEvYXJj
aC9hcm02NC9jb25maWdzL2RlZmNvbmZpZworKysgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29u
ZmlnCkBAIC01NTcsNiArNTU3LDcgQEAgQ09ORklHX0xFRFNfVFJJR0dFUl9QQU5JQz15CiBDT05G
SUdfRURBQz15CiBDT05GSUdfRURBQ19HSEVTPXkKIENPTkZJR19SVENfQ0xBU1M9eQorQ09ORklH
X1JUQ19EUlZfSFlNODU2Mz15CiBDT05GSUdfUlRDX0RSVl9NQVg3NzY4Nj15CiBDT05GSUdfUlRD
X0RSVl9SSzgwOD1tCiBDT05GSUdfUlRDX0RSVl9TNU09eQotLSAKMi4xOS4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
