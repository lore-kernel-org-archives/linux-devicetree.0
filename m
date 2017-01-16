From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v1 7/7] ARM: configs: Add STM32 LTDC support in STM32 defconfig
Date: Mon, 16 Jan 2017 14:29:04 +0100
Message-ID: <1484573344-11609-8-git-send-email-yannick.fertre@st.com>
References: <1484573344-11609-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1484573344-11609-1-git-send-email-yannick.fertre@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre TORGUE <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KLS0t
CiBhcmNoL2FybS9jb25maWdzL3N0bTMyX2RlZmNvbmZpZyB8IDUgKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL3N0bTMy
X2RlZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3Mvc3RtMzJfZGVmY29uZmlnCmluZGV4IDI5MDY4
ZjUuLmUzOTc0ZDkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2NvbmZpZ3Mvc3RtMzJfZGVmY29uZmln
CisrKyBiL2FyY2gvYXJtL2NvbmZpZ3Mvc3RtMzJfZGVmY29uZmlnCkBAIC03MSwzICs3MSw4IEBA
IENPTkZJR19NQUdJQ19TWVNSUT15CiAjIENPTkZJR19GVFJBQ0UgaXMgbm90IHNldAogQ09ORklH
X0NSQ19JVFVfVD15CiBDT05GSUdfQ1JDNz15CitDT05GSUdfRFJNPXkKK0NPTkZJR19EUk1fU1Q9
eQorQ09ORklHX0RSTV9QQU5FTD15CitDT05GSUdfRFJNX1BBTkVMX1NJTVBMRT15CitDT05GSUdf
QkFDS0xJR0hUX0xDRF9TVVBQT1JUPXkKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
