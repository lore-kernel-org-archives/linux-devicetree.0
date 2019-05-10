From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
Subject: [PATCH v2 0/5] Add supply property for DSI controller
Date: Fri, 10 May 2019 16:20:18 +0200
Message-ID: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
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
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>, Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

VGhlIERTSSBjb250cm9sbGVyIG5lZWRzIGEgbmV3IHByb3BlcnR5IHRoYXQgcG93ZXJzIGl0cyBw
aHlzaWNhbCBsYXllci4KQmluZGluZyBoYXMgYmVlbiB1cGRhdGVkIHRvIGRvY3VtZW50ZWQgdGhp
cyBwcm9wZXJ0eS4KRGV2aWNlIHRyZWUgb2Ygc3RtMzJtcDE1N2Mgc29jLgpNb3ZlIHJlZzE4ICYg
cmVnMTEgdG8gc3RtMzJtcDE1N2MgZGV2aWNlIHRyZWUgZmlsZS4KUmVtb3ZlIHByb3BlcnR5IHBo
eS1kc2ktc3VwcGx5IHByb3BlcnR5IHRvIHN0bTMybXAxNTdjLWRrMi5kdHMgZmlsZS4KCgpDaGFu
Z2VzIGluIHYyOgotIHJlbmFtZSBwYXRjaCBkcm0vc3RtOiBkc2k6IGFkZCBzdXBwb3J0IG9mIGFu
IG9wdGlvbmFsIHJlZ3VsYXRvcgotIHJld29yayBkd19taXBpX2RzaS1zdG0gcHJvYmUgc2VxdWVu
Y2UKCllhbm5pY2sgRmVydHLDqSAoNSk6CiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHN0bTMyOiBh
ZGQgc3VwcGx5IHByb3BlcnR5IHRvIERTSSBjb250cm9sbGVyCiAgZHJtL3N0bTogZHNpOiBhZGQg
c3VwcG9ydCBvZiBhbiBvcHRpb25hbCByZWd1bGF0b3IKICBBUk06IGR0czogc3RtMzI6IGFkZCBw
aHktZHNpLXN1cHBseSBwcm9wZXJ0eSBvbiBzdG0zMm1wMTU3YwogIEFSTTogZHRzOiBzdG0zMjog
bW92ZSBmaXhlIHJlZ3VsYXRvcnMgcmVnMTEgJiByZWcxOAogIEFSTTogZHRzOiBzdG0zMjogcmVt
b3ZlIHBoeS1kc2ktc3VwcGx5IHByb3BlcnR5IG9uIHN0bTMybXAxNTdjLWRrMgogICAgYm9hcmQK
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMudHh0ICAgIHwg
IDMgKysrCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRzICAgICAgICAgICAg
ICAgIHwgIDkgLS0tLS0tLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1lZDEuZHRz
ICAgICAgICAgICAgICAgIHwgMTYgLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9hcm0vYm9vdC9kdHMv
c3RtMzJtcDE1N2MuZHRzaSAgICAgICAgICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysr
CiBkcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jICAgICAgICAgICAgICB8IDQ1
ICsrKysrKysrKysrKysrKysrKystLS0KIDUgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygr
KSwgMjUgZGVsZXRpb25zKC0pCgotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
