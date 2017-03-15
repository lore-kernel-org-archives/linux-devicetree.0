From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v4 8/8] ARM: configs: Add STM32 panel simple support in STM32
 defconfig
Date: Wed, 15 Mar 2017 18:02:14 +0100
Message-ID: <1489597334-16896-9-git-send-email-yannick.fertre@st.com>
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
CiBhcmNoL2FybS9jb25maWdzL3N0bTMyX2RlZmNvbmZpZyB8IDIgKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL3N0bTMyX2Rl
ZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3Mvc3RtMzJfZGVmY29uZmlnCmluZGV4IDljNmJhNTRl
Li5mN2RkZjI5YiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vY29uZmlncy9zdG0zMl9kZWZjb25maWcK
KysrIGIvYXJjaC9hcm0vY29uZmlncy9zdG0zMl9kZWZjb25maWcKQEAgLTUwLDYgKzUwLDggQEAg
Q09ORklHX1NFUklBTF9TVE0zMl9DT05TT0xFPXkKICMgQ09ORklHX0hXX1JBTkRPTSBpcyBub3Qg
c2V0CiAjIENPTkZJR19IV01PTiBpcyBub3Qgc2V0CiBDT05GSUdfRFJNPXkKK0NPTkZJR19EUk1f
UEFORUxfU0lNUExFPXkKK0NPTkZJR19CQUNLTElHSFRfTENEX1NVUFBPUlQ9eQogQ09ORklHX01G
RF9TWVNDT049eQogIyBDT05GSUdfVVNCX1NVUFBPUlQgaXMgbm90IHNldAogQ09ORklHX05FV19M
RURTPXkKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
