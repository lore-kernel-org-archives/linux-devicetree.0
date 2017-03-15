From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v4 7/8] ARM: configs: Add STM32 LTDC support in STM32 defconfig
Date: Wed, 15 Mar 2017 18:02:13 +0100
Message-ID: <1489597334-16896-8-git-send-email-yannick.fertre@st.com>
References: <1489597334-16896-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1489597334-16896-1-git-send-email-yannick.fertre@st.com>
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

U2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KLS0t
CiBhcmNoL2FybS9jb25maWdzL3N0bTMyX2RlZmNvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9zdG0zMl9kZWZj
b25maWcgYi9hcmNoL2FybS9jb25maWdzL3N0bTMyX2RlZmNvbmZpZwppbmRleCA0MzYyNDBkLi45
YzZiYTU0ZSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vY29uZmlncy9zdG0zMl9kZWZjb25maWcKKysr
IGIvYXJjaC9hcm0vY29uZmlncy9zdG0zMl9kZWZjb25maWcKQEAgLTQ5LDYgKzQ5LDcgQEAgQ09O
RklHX1NFUklBTF9TVE0zMj15CiBDT05GSUdfU0VSSUFMX1NUTTMyX0NPTlNPTEU9eQogIyBDT05G
SUdfSFdfUkFORE9NIGlzIG5vdCBzZXQKICMgQ09ORklHX0hXTU9OIGlzIG5vdCBzZXQKK0NPTkZJ
R19EUk09eQogQ09ORklHX01GRF9TWVNDT049eQogIyBDT05GSUdfVVNCX1NVUFBPUlQgaXMgbm90
IHNldAogQ09ORklHX05FV19MRURTPXkKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
