From: Philippe Cornu <philippe.cornu@st.com>
Subject: [PATCH 0/2] drm/bridge: sii902x: add optional power supplies
Date: Tue, 10 Apr 2018 07:19:25 +0200
Message-ID: <20180410051927.8268-1-philippe.cornu@st.com>
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
To: Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Alexandre Torgue <alexandre.torgue@st.com>
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaHNldCBhZGRzIHRoZSAzIG9wdGlvbmFsIHBvd2VyIHN1cHBsaWVzIHRvIHRoZSBz
aWk5MDJ4CmRybSBicmlkZ2UgZHJpdmVyLgoKUGhpbGlwcGUgQ29ybnUgKDIpOgogIGR0LWJpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlOiBzaWk5MDJ4OiBhZGQgb3B0aW9uYWwgcG93ZXIgc3VwcGxpZXMK
ICBkcm0vYnJpZGdlOiBzaWk5MDJ4OiBhZGQgb3B0aW9uYWwgcG93ZXIgc3VwcGxpZXMKCiAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4LnR4dCB8ICAzICsrCiBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyAgICAgICAgICAgICAgICAgICB8IDM5ICsr
KysrKysrKysrKysrKysrKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCi0tIAoyLjE1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
