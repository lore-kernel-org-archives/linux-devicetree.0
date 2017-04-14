From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v6 1/9] drm/cma: Update DEFINE_DRM_GEM_CMA_FOPS to add
 get_unmapped_area
Date: Fri, 14 Apr 2017 10:10:47 +0200
Message-ID: <1492157455-2283-2-git-send-email-yannick.fertre@st.com>
References: <1492157455-2283-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1492157455-2283-1-git-send-email-yannick.fertre@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre TORGUE <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@st.com>, Yannick Fertre <yannick.fertre@st.com>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, Philippe Cornu <philippe.cornu@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

TWlzc2luZyBmaWVsZCBnZXRfdW5tYXBwZWRfYXJlYSB3aGljaCBpcyBuZWNlc3Nhcnkgd2l0aCBk
ZXZpY2Ugd2l0aG91dCBNTVUKClNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNr
LmZlcnRyZUBzdC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmggfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2RybV9nZW1fY21hX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV9jbWFfaGVscGVy
LmgKaW5kZXggZjk2MmQzMy4uNzMyMGIxNCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dl
bV9jbWFfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmgKQEAg
LTUwLDYgKzUwLDcgQEAgc3RydWN0IGRybV9nZW1fY21hX29iamVjdCB7CiAJCS5yZWFkCQk9IGRy
bV9yZWFkLFwKIAkJLmxsc2VlawkJPSBub29wX2xsc2VlayxcCiAJCS5tbWFwCQk9IGRybV9nZW1f
Y21hX21tYXAsXAorCQkuZ2V0X3VubWFwcGVkX2FyZWEJPSBkcm1fZ2VtX2NtYV9nZXRfdW5tYXBw
ZWRfYXJlYSxcCiAJfQogCiAvKiBmcmVlIEdFTSBvYmplY3QgKi8KLS0gCjEuOS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
