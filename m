From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v2 0/3] Add RK3229 vop support
Date: Tue,  5 Jan 2016 11:48:08 +0800
Message-ID: <1451965688-12286-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@linux.ie>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

CkJhc2VkIG9uIE1hcmsgWWFvJ3MgZHJtLW5leHQgYnJhbmNoCltodHRwczovL2dpdGh1Yi5jb20v
bWFya3l6cS9rZXJuZWwtZHJtLXJvY2tjaGlwL3RyZWUvZHJtLXJvY2tjaGlwLW5leHQtMjAxNS0x
Mi0yOF0KCgpDaGFuZ2VzIGluIHYyOgotIEFkZCB0aGlzIHBhdGNoIGluIHYyIChIZWlrbykKLSBT
ZXBhcmF0ZSB0aGUgd3JpdGUtbWFzayBjaGFuZ2VzIG91dCwgYW5kIHJlbW92ZSB0aGUgRFVNTVlf
SU5UUiBtYXJjb3MgKEhlaWtvKQotIGFja2VkIGJ5IFJvYgoKWWFraXIgWWFuZyAoMyk6CiAgZHJt
L3JvY2tjaGlwOiB2b3A6IEFkZCBzdXBwb3J0IGZvciBpbnRlcnJ1cHQgcmVnaXN0ZXJzIHVzaW5n
CiAgICB3cml0ZS1tYXNrcwogIGRybS9yb2NrY2hpcDogdm9wOiBhZGQgcmszMjI5IHZvcCBzdXBw
b3J0CiAgZHQtYmluZGluZ3M6IGFkZCBkb2N1bWVudCBmb3IgcmszMjI5LXZvcAoKIC4uLi9iaW5k
aW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLXZvcC50eHQgICAgIHwgICAxICsKIGRyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMgICAgICAgIHwgICA3ICstCiBk
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5oICAgICAgICB8ICAgMSAr
CiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfdm9wX3JlZy5jICAgICAgICB8IDEx
MiArKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF92b3BfcmVnLmggICAgICAgIHwgIDkwICsrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5n
ZWQsIDIwOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKLS0gCjEuOS4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
