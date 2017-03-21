From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 08/13] ARM64: dts: meson-gx: Add shared CMA dma memory pool
Date: Tue, 21 Mar 2017 16:25:45 +0100
Message-ID: <1490109950-21421-9-git-send-email-narmstrong@baylibre.com>
References: <1490109950-21421-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1490109950-21421-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIEhETUkgbW9kZXMgbmVlZHMgbW9yZSBDTUEgbWVtb3J5IHRvIGJlIHJlc2VydmVkIGF0IGJv
b3QtdGltZS4KClNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxp
YnJlLmNvbT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3guZHRzaSB8
IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3guZHRzaSBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC5kdHNpCmluZGV4IDVkOTk1ZjcuLjk0YzZmOTUgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC5kdHNpCisrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC5kdHNpCkBAIC03MSw2ICs3MSwx
NCBAQAogCQkJcmVnID0gPDB4MCAweDEwMDAwMDAwIDB4MCAweDIwMDAwMD47CiAJCQluby1tYXA7
CiAJCX07CisKKwkJbGludXgsY21hIHsKKwkJCWNvbXBhdGlibGUgPSAic2hhcmVkLWRtYS1wb29s
IjsKKwkJCXJldXNhYmxlOworCQkJc2l6ZSA9IDwweDAgMHhiYzAwMDAwPjsKKwkJCWFsaWdubWVu
dCA9IDwweDAgMHg0MDAwMDA+OworCQkJbGludXgsY21hLWRlZmF1bHQ7CisJCX07CiAJfTsKIAog
CWNwdXMgewotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
