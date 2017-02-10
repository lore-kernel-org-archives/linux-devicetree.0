From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v2 7/9] ARM: dts: stm32: Add ltdc support on stm32f429 MCU
Date: Fri, 10 Feb 2017 15:54:47 +0100
Message-ID: <1486738489-22154-8-git-send-email-yannick.fertre@st.com>
References: <1486738489-22154-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1486738489-22154-1-git-send-email-yannick.fertre@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre TORGUE <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, Philippe Cornu <philippe.cornu@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWRkIExUREMgKExjZC10ZnQgRGlzcGxheSBDb250cm9sbGVyKSBzdXBwb3J0LgoKU2lnbmVkLW9m
Zi1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KLS0tCiBhcmNoL2Fy
bS9ib290L2R0cy9zdG0zMmY0MjkuZHRzaSB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJmNDI5LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY0MjkuZHRzaQppbmRl
eCA0NzM1MWUyLi4wMGY2NjgxIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY0
MjkuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY0MjkuZHRzaQpAQCAtNDksNiAr
NDksNyBAQAogI2luY2x1ZGUgImFybXY3LW0uZHRzaSIKICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9w
aW5jdHJsL3N0bTMyZjQyOS1waW5mdW5jLmg+CiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2sv
c3RtMzJmNC1jbG9jay5oPgorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL21mZC9zdG0zMmY0LXJjYy5o
PgogCiAvIHsKIAljbG9ja3MgewpAQCAtNDMyLDkgKzQzMyw5IEBACiAJCQljb21wYXRpYmxlID0g
InN0LHN0bTMyLWx0ZGMiOwogCQkJcmVnID0gPDB4NDAwMTY4MDAgMHgyMDA+OwogCQkJaW50ZXJy
dXB0cyA9IDw4OD4sIDw4OT47Ci0JCQlyZXNldHMgPSA8JnJjYyAzMTQ+OworCQkJcmVzZXRzID0g
PCZyY2MgU1RNMzJGNF9BUEIyX1JFU0VUKExUREMpPjsKIAkJCWNsb2NrcyA9IDwmcmNjIDEgQ0xL
X0xDRD47Ci0JCQljbG9jay1uYW1lcyA9ICJjbGstbGNkIjsKKwkJCWNsb2NrLW5hbWVzID0gImxj
ZCI7CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCiAJCQlwb3J0IHsKLS0gCjEuOS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
