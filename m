From: Olivier Moysan <olivier.moysan@st.com>
Subject: [PATCH v2 0/3] drm/bridge: sii902x: fix audio mclk management
Date: Mon, 22 Jul 2019 18:05:57 +0200
Message-ID: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
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
To: a.hajda@samsung.com, narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, benjamin.gaignard@st.com, alexandre.torgue@st.com, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, olivier.moysan@st.com, jsarha@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Rml4IGF1ZGlvIG1hc3RlciBjbG9jayB1c2UgZm9yIFNpbGFiIHNpaTkwMnggSERNSSB0cmFuc2Nl
aXZlci4KTWFrZSBhdWRpbyBtYXN0ZXIgY2xvY2sgb3B0aW9uYWwsIGFzIHRoaXMgY2xvY2sgaXMg
bm90IG1hbmRhdG9yeS4KCkNoYW5nZXMgaW4gdjI6Ci0gUmVseSBvbiBjbGsgZnJhbWV3b3JrIHRv
IG1hbmFnZSB1bmRlZmluZWQgbWNsayBjYXNlLgotIFVzZSBkZXZtX2Nsa19nZXRfb3B0aW9uYWwg
aW5zdGVhZCBvZiBkZXZtX2Nsa19nZXQuCgpPbGl2aWVyIE1veXNhbiAoMyk6CiAgZHJtL2JyaWRn
ZTogc2lpOTAyeDogZml4IG1pc3NpbmcgcmVmZXJlbmNlIHRvIG1jbGsgY2xvY2sKICBkdC1iaW5k
aW5nczogZGlzcGxheTogc2lpOTAyeDogQ2hhbmdlIGF1ZGlvIG1jbGsgYmluZGluZwogIGRybS9i
cmlkZ2U6IHNpaTkwMng6IG1ha2UgYXVkaW8gbWNsayBvcHRpb25hbAoKIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0ICAgICB8ICA1ICsrLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyAgICAgICAgICAgICAgICAgICAgICAgfCAxOCAr
KysrKysrKysrLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
