From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v1 5/7] ARM: dts: stm32f429: Add ltdc support
Date: Mon, 16 Jan 2017 14:29:02 +0100
Message-ID: <1484573344-11609-6-git-send-email-yannick.fertre@st.com>
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

QWRkIExUREMgKExjZC10ZnQgRGlzcGxheSBDb250cm9sbGVyKSBzdXBwb3J0LgoKU2lnbmVkLW9m
Zi1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KLS0tCiBhcmNoL2Fy
bS9ib290L2R0cy9zdG0zMmY0MjkuZHRzaSB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNDI5LmR0c2kgYi9hcmNoL2FybS9ib290L2R0
cy9zdG0zMmY0MjkuZHRzaQppbmRleCAzMzZlZTRmLi5mYzQzNDE1IDEwMDY0NAotLS0gYS9hcmNo
L2FybS9ib290L2R0cy9zdG0zMmY0MjkuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0z
MmY0MjkuZHRzaQpAQCAtMTg1LDcgKzE4NSw3IEBACiAJCQlpbnRlcnJ1cHRzID0gPDE+LCA8Mj4s
IDwzPiwgPDY+LCA8Nz4sIDw4PiwgPDk+LCA8MTA+LCA8MjM+LCA8NDA+LCA8NDE+LCA8NDI+LCA8
NjI+LCA8NzY+OwogCQl9OwogCi0JCXBpbi1jb250cm9sbGVyIHsKKwkJcGluY3RybDogcGluLWNv
bnRyb2xsZXIgewogCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAJCQkjc2l6ZS1jZWxscyA9IDwx
PjsKIAkJCWNvbXBhdGlibGUgPSAic3Qsc3RtMzJmNDI5LXBpbmN0cmwiOwpAQCAtNDA0LDYgKzQw
NCwyOSBAQAogCQkJaW50ZXJydXB0cyA9IDw4MD47CiAJCQljbG9ja3MgPSA8JnJjYyAwIDM4PjsK
IAkJfTsKKworCQlzdC1kaXNwbGF5LXN1YnN5c3RlbSB7CisJCQljb21wYXRpYmxlID0gInN0LGRp
c3BsYXktc3Vic3lzdGVtIjsKKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJI3NpemUtY2Vs
bHMgPSA8MT47CisJCQlyYW5nZXM7CisJCQlkbWEtcmFuZ2VzOworCisJCQlsdGRjX2hvc3Q6IHN0
bTMyLWx0ZGNANDAwMTY4MDAgeworCQkJCWNvbXBhdGlibGUgPSAic3QsbHRkYyI7CisJCQkJcmVn
ID0gPDB4NDAwMTY4MDAgMHgyMDA+OworCQkJCWludGVycnVwdHMgPSA8ODg+LCA8ODk+OworCQkJ
CXJlc2V0cyA9IDwmcmNjIDMxND47CisJCQkJY2xvY2tzID0gPCZyY2MgMSA4PjsKKwkJCQljbG9j
ay1uYW1lcyA9ICJjbGstbGNkIjsKKwkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCisJCQkJcG9y
dCB7CisJCQkJCWx0ZGNfb3V0X3JnYjogZW5kcG9pbnQgeworCQkJCQl9OworCQkJCX07CisJCQl9
OworCQl9OwogCX07CiB9OwogCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
