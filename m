From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v6 8/9] ARM: configs: stm32: Add DRM support in STM32 defconfig
Date: Fri, 14 Apr 2017 10:10:54 +0200
Message-ID: <1492157455-2283-9-git-send-email-yannick.fertre@st.com>
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

VGhpcyBwYXRjaCBhZGRzIERSTSAoRGlyZWN0IFJlbmRlcmluZyBNYW5hZ2VyKSBzdXBwb3J0Cmlu
IHN0bTMyX2RlZmNvbmZpZyBmaWxlCgpTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyZSA8eWFu
bmljay5mZXJ0cmVAc3QuY29tPgotLS0KIGFyY2gvYXJtL2NvbmZpZ3Mvc3RtMzJfZGVmY29uZmln
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNo
L2FybS9jb25maWdzL3N0bTMyX2RlZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3Mvc3RtMzJfZGVm
Y29uZmlnCmluZGV4IGE5ZDhlM2MuLmMyZmYyZTcgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2NvbmZp
Z3Mvc3RtMzJfZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtL2NvbmZpZ3Mvc3RtMzJfZGVmY29uZmln
CkBAIC00OCw2ICs0OCw3IEBAIENPTkZJR19TRVJJQUxfU1RNMzI9eQogQ09ORklHX1NFUklBTF9T
VE0zMl9DT05TT0xFPXkKICMgQ09ORklHX0hXX1JBTkRPTSBpcyBub3Qgc2V0CiAjIENPTkZJR19I
V01PTiBpcyBub3Qgc2V0CitDT05GSUdfRFJNPXkKIENPTkZJR19SRUdVTEFUT1I9eQogQ09ORklH
X1JFR1VMQVRPUl9GSVhFRF9WT0xUQUdFPXkKICMgQ09ORklHX1VTQl9TVVBQT1JUIGlzIG5vdCBz
ZXQKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
