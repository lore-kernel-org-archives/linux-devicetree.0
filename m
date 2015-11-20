From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v4 01/13] clk: rockchip: add id for mipidsi sclk on rk3288
Date: Fri, 20 Nov 2015 16:15:27 +0800
Message-ID: <1448007339-10966-2-git-send-email-zyw@rock-chips.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandru M Stan <amstan@chromium.org>, Huang Lin <hl@rock-chips.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Roger Chen <roger.chen@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Chris Zhong <zyw@rock-chips.com>, rmk+kernel@arm.linux.org.uk, Sonny Rao <sonnyrao@chromium.org>, ajaykumar.rs@samsung.com, Jeff Chen <cym@rock-chips.com>
List-Id: devicetree@vger.kernel.org

QWRkcyBhIG5ldyBpZCBmb3IgdGhlIHNjbGsgc3VwcGx5aW5nIHRoZSBtaXBpZHNpIG9uIHJrMzI4
OCBzb2NzLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgWmhvbmcgPHp5d0Byb2NrLWNoaXBzLmNvbT4K
Ci0tLQoKQ2hhbmdlcyBpbiB2NDogTm9uZQpDaGFuZ2VzIGluIHYzOiBOb25lCkNoYW5nZXMgaW4g
djI6CmFkZCB0aGUgbWlwaSBjbGsgaWQgaW4gYSBzaW5nbGUgcGF0Y2gKCiBpbmNsdWRlL2R0LWJp
bmRpbmdzL2Nsb2NrL3JrMzI4OC1jcnUuaCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9yazMyODgtY3J1
LmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3JrMzI4OC1jcnUuaAppbmRleCBjNzE5YWFj
Li5iMDdjZGQzIDEwMDY0NAotLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3JrMzI4OC1j
cnUuaAorKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3JrMzI4OC1jcnUuaApAQCAtODYs
NiArODYsNyBAQAogI2RlZmluZSBTQ0xLX1VTQlBIWTQ4ME1fU1JDCTEyMgogI2RlZmluZSBTQ0xL
X1BWVE1fQ09SRQkJMTIzCiAjZGVmaW5lIFNDTEtfUFZUTV9HUFUJCTEyNAorI2RlZmluZSBTQ0xL
X01JUElfMjRNCQkxMjUKIAogI2RlZmluZSBTQ0xLX01BQwkJMTUxCiAjZGVmaW5lIFNDTEtfTUFD
UkVGX09VVAkJMTUyCi0tIAoyLjYuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
