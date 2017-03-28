From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v5 10/10] ARM: configs: stm32: Add simple panel support in
 STM32 defconfig
Date: Tue, 28 Mar 2017 11:44:53 +0200
Message-ID: <1490694293-18358-11-git-send-email-yannick.fertre@st.com>
References: <1490694293-18358-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1490694293-18358-1-git-send-email-yannick.fertre@st.com>
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

VGhpcyBwYXRjaCBhZGRzIHNpbXBsZSBwYW5lbCBzdXBwb3J0IGluIHN0bTMyX2RlZmNvbmZpZyBm
aWxlCgpTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyZSA8eWFubmljay5mZXJ0cmVAc3QuY29t
PgotLS0KIGFyY2gvYXJtL2NvbmZpZ3Mvc3RtMzJfZGVmY29uZmlnIHwgMiArKwogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3Mvc3Rt
MzJfZGVmY29uZmlnIGIvYXJjaC9hcm0vY29uZmlncy9zdG0zMl9kZWZjb25maWcKaW5kZXggNTYy
ZDM1MS4uYWU2OGQ5ZiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vY29uZmlncy9zdG0zMl9kZWZjb25m
aWcKKysrIGIvYXJjaC9hcm0vY29uZmlncy9zdG0zMl9kZWZjb25maWcKQEAgLTUwLDYgKzUwLDgg
QEAgQ09ORklHX1NFUklBTF9TVE0zMl9DT05TT0xFPXkKICMgQ09ORklHX0hXX1JBTkRPTSBpcyBu
b3Qgc2V0CiAjIENPTkZJR19IV01PTiBpcyBub3Qgc2V0CiBDT05GSUdfRFJNPXkKK0NPTkZJR19E
Uk1fUEFORUxfU0lNUExFPXkKK0NPTkZJR19CQUNLTElHSFRfTENEX1NVUFBPUlQ9eQogQ09ORklH
X1JFR1VMQVRPUj15CiBDT05GSUdfUkVHVUxBVE9SX0ZJWEVEX1ZPTFRBR0U9eQogQ09ORklHX01G
RF9TWVNDT049eQotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
