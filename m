From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v3 7/7] ARM: configs: stm32: ADD LDTC support
Date: Mon, 20 Feb 2017 17:08:41 +0100
Message-ID: <1487606921-26981-8-git-send-email-yannick.fertre@st.com>
References: <1487606921-26981-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1487606921-26981-1-git-send-email-yannick.fertre@st.com>
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

VGhpcyBwYXRjaCBhZGRzIFNUTTMyIExUREMgc3VwcG9ydCAmIHNpbXBsZSBwYW5lbCBzdXBwb3J0
IGluIHN0bTMyX2RlZmNvbmZpZyBmaWxlCgpTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyZSA8
eWFubmljay5mZXJ0cmVAc3QuY29tPgotLS0KIGFyY2gvYXJtL2NvbmZpZ3Mvc3RtMzJfZGVmY29u
ZmlnIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2NvbmZpZ3Mvc3RtMzJfZGVmY29uZmlnIGIvYXJjaC9hcm0vY29uZmlncy9z
dG0zMl9kZWZjb25maWcKaW5kZXggZTk5NTIwOS4uZDZhMDBiOCAxMDA2NDQKLS0tIGEvYXJjaC9h
cm0vY29uZmlncy9zdG0zMl9kZWZjb25maWcKKysrIGIvYXJjaC9hcm0vY29uZmlncy9zdG0zMl9k
ZWZjb25maWcKQEAgLTcwLDMgKzcwLDggQEAgQ09ORklHX01BR0lDX1NZU1JRPXkKICMgQ09ORklH
X0ZUUkFDRSBpcyBub3Qgc2V0CiBDT05GSUdfQ1JDX0lUVV9UPXkKIENPTkZJR19DUkM3PXkKK0NP
TkZJR19EUk09eQorQ09ORklHX0RSTV9TVD15CitDT05GSUdfRFJNX1BBTkVMPXkKK0NPTkZJR19E
Uk1fUEFORUxfU0lNUExFPXkKK0NPTkZJR19CQUNLTElHSFRfTENEX1NVUFBPUlQ9eQotLSAKMS45
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
