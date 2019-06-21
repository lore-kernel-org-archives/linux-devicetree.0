From: Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 3/3] ARM: dts: rockchip: Add RK3288 VOP gamma LUT address
Date: Fri, 21 Jun 2019 18:13:46 -0300
Message-ID: <20190621211346.1324-4-ezequiel@collabora.com>
References: <20190621211346.1324-1-ezequiel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190621211346.1324-1-ezequiel@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org, Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <seanpaul@chromium.org>, kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
List-Id: devicetree@vger.kernel.org

UkszMjg4IFNvQyBWT1BzIGhhdmUgb3B0aW9uYWwgc3VwcG9ydCBHYW1tYSBMVVQgc2V0dGluZywK
d2hpY2ggcmVxdWlyZXMgc3BlY2lmeWluZyB0aGUgR2FtbWEgTFVUIGFkZHJlc3MgaW4gdGhlIGRl
dmljZXRyZWUuCgpTaWduZWQtb2ZmLWJ5OiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxh
Ym9yYS5jb20+Ci0tLQpDaGFuZ2VzIGZyb20gdjE6CiogRHJvcCByZWctbmFtZXMsIGFzIHN1Z2dl
c3RlZCBieSBEb3VnLgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC5kdHNpIHwgNCArKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMv
cmszMjg4LmR0c2kKaW5kZXggYWEwMTdhYmY0ZjQyLi40MGQ1ZWJkNjYzZWYgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3Jr
MzI4OC5kdHNpCkBAIC0xMDI1LDcgKzEwMjUsNyBAQAogCiAJdm9wYjogdm9wQGZmOTMwMDAwIHsK
IAkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMyODgtdm9wIjsKLQkJcmVnID0gPDB4MCAweGZm
OTMwMDAwIDB4MCAweDE5Yz47CisJCXJlZyA9IDwweDAgMHhmZjkzMDAwMCAweDAgMHgxOWM+LCA8
MHgwIDB4ZmY5MzEwMDAgMHgwIDB4MTAwMD47CiAJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxNSBJ
UlFfVFlQRV9MRVZFTF9ISUdIPjsKIAkJY2xvY2tzID0gPCZjcnUgQUNMS19WT1AwPiwgPCZjcnUg
RENMS19WT1AwPiwgPCZjcnUgSENMS19WT1AwPjsKIAkJY2xvY2stbmFtZXMgPSAiYWNsa192b3Ai
LCAiZGNsa192b3AiLCAiaGNsa192b3AiOwpAQCAtMTA3NSw3ICsxMDc1LDcgQEAKIAogCXZvcGw6
IHZvcEBmZjk0MDAwMCB7CiAJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMjg4LXZvcCI7Ci0J
CXJlZyA9IDwweDAgMHhmZjk0MDAwMCAweDAgMHgxOWM+OworCQlyZWcgPSA8MHgwIDB4ZmY5NDAw
MDAgMHgwIDB4MTljPiwgPDB4MCAweGZmOTQxMDAwIDB4MCAweDEwMDA+OwogCQlpbnRlcnJ1cHRz
ID0gPEdJQ19TUEkgMTYgSVJRX1RZUEVfTEVWRUxfSElHSD47CiAJCWNsb2NrcyA9IDwmY3J1IEFD
TEtfVk9QMT4sIDwmY3J1IERDTEtfVk9QMT4sIDwmY3J1IEhDTEtfVk9QMT47CiAJCWNsb2NrLW5h
bWVzID0gImFjbGtfdm9wIiwgImRjbGtfdm9wIiwgImhjbGtfdm9wIjsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
