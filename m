From: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>
Subject: [PATCH 1/2] ARM: berlin: add the LIBGPIO as a dependency for the BG2Q
Date: Tue, 15 Apr 2014 10:07:24 +0200
Message-ID: <1397549245-3338-2-git-send-email-antoine.tenart@free-electrons.com>
References: <1397549245-3338-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1397549245-3338-1-git-send-email-antoine.tenart@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sebastian.hesselbarth@gmail.com
Cc: zmxu@marvell.com, jszhang@marvell.com, devicetree@vger.kernel.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIEJHMlEgaGFzIEdQSU9zIGRyaXZlbiBieSB0aGUgZHdhcGIgR1BJTyBkcml2ZXIuIEFkZCB0
aGUgTElCR1BJTyBhcyBhCmRlcGVuZGVuY3kgdG8gYmUgYWJsZSB0byBzdXBwb3J0IHRoZW0uCgpT
aWduZWQtb2ZmLWJ5OiBBbnRvaW5lIFTDqW5hcnQgPGFudG9pbmUudGVuYXJ0QGZyZWUtZWxlY3Ry
b25zLmNvbT4KLS0tCiBhcmNoL2FybS9tYWNoLWJlcmxpbi9LY29uZmlnIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLWJlcmxp
bi9LY29uZmlnIGIvYXJjaC9hcm0vbWFjaC1iZXJsaW4vS2NvbmZpZwppbmRleCAyOTFmMWNhYzZj
M2QuLmMzMTk2ODcxMjA5NSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vbWFjaC1iZXJsaW4vS2NvbmZp
ZworKysgYi9hcmNoL2FybS9tYWNoLWJlcmxpbi9LY29uZmlnCkBAIC0yOCw2ICsyOCw3IEBAIGNv
bmZpZyBNQUNIX0JFUkxJTl9CRzJRCiAJc2VsZWN0IENQVV9WNwogCXNlbGVjdCBIQVZFX0FSTV9U
V0QgaWYgU01QCiAJc2VsZWN0IEhBVkVfU01QCisJc2VsZWN0IEFSQ0hfUkVRVUlSRV9HUElPTElC
CiAKIGVuZG1lbnUKIAotLSAKMS44LjMuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
