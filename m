From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v5 0/4] Innolux P097PFG panel
Date: Mon,  2 Jul 2018 12:27:17 +0200
Message-ID: <20180702102721.3546-1-heiko@sntech.de>
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
To: thierry.reding@gmail.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, hl@rock-chips.com, briannorris@chromium.org, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

VGhlIElubm9sdXggcDA5N3BmZyBpcyBvbmUgb2YgdHdvIHBvc3NpYmxlIHBhbmVscyB1c2VkIGlu
IHRoZQpncnUtc2NhcmxldCBDaHJvbWVPUyBkZXZpY2VzLgoKVGhpcyB2NSBtYWlubHkgYWRkcmVz
c2VzIHRoZSB2ZXJ5IHZhbHVhYmxlIGNvbW1lbnRzIGZyb20gRW1pbApyZWdhcmRpbmcgcG93ZXIt
c3VwcGx5IGFuZCBkZWxheSBoYW5kbGluZyBhcyB3ZWxsIGFzIGRvY3VtZW50aW5nCnRoZSAodW5z
YXRpc2Z5aW5nKSBzb3VyY2Ugb2YgdGhlIGluaXQgY29tbWFuZHMuCgpJbmRpdmlkdWFsIGNoYW5n
ZWxvZ3MgaW5zaWRlIHRoZSBzcGVjaWZpYyBwYXRjaGVzLgoKVGVzdGVkIHdpdGggdGhlIHJlY2Vu
dGx5IHJlc3VycmVjdGVkIFJvY2tjaGlwIGR1YWwtZHNpIHBhdGNoZXMKb24gYSBncnUtc2Nhcmxl
dC4KCgpMaW4gSHVhbmcgKDIpOgogIGRybS9wYW5lbDogcDA3OXpjYTogYWRkIHZhcmlhYmxlIHVu
cHJlcGFyZV9kZWxheSBwcm9wZXJ0aWVzCiAgZHJtL3BhbmVsOiBwMDc5emNhOiBzdXBwb3J0IElu
bm9sdXggUDA5N1BGRyBwYW5lbAoKaHVhbmcgbGluICgyKToKICBkcm0vcGFuZWw6IHAwNzl6Y2E6
IHJlZmFjdG9yIHBhbmVsIGRyaXZlciB0byBzdXBwb3J0IG11bHRpcGxlIHBhbmVscwogIGR0LWJp
bmRpbmdzOiBBZGQgSW5ub2x1eCBQMDk3UEZHIHBhbmVsIGJpbmRpbmdzCgogLi4uL2Rpc3BsYXkv
cGFuZWwvaW5ub2x1eCxwMDk3cGZnLnR4dCAgICAgICAgIHwgIDI0ICsrCiBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtaW5ub2x1eC1wMDc5emNhLmMgfCAzNTMgKysrKysrKysrKysrKysrLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDMyOCBpbnNlcnRpb25zKCspLCA0OSBkZWxldGlvbnMoLSkKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9pbm5vbHV4LHAwOTdwZmcudHh0CgotLSAKMi4xNy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
