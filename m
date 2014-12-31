From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v8 04/21] ARM: imx6q: Add GPR3 MIPI muxing control
 register field shift bits definition
Date: Wed, 31 Dec 2014 16:23:22 +0800
Message-ID: <1420014219-915-5-git-send-email-Ying.Liu@freescale.com>
References: <1420014219-915-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1420014219-915-1-git-send-email-Ying.Liu@freescale.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, linux-kernel@vger.kernel.org, a.hajda@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, andyshrk@gmail.com
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIGEgbWFjcm8gdG8gZGVmaW5lIHRoZSBHUFIzIE1JUEkgbXV4aW5nIGNv
bnRyb2wgcmVnaXN0ZXIgZmllbGQKc2hpZnQgYml0cy4KClNpZ25lZC1vZmYtYnk6IExpdSBZaW5n
IDxZaW5nLkxpdUBmcmVlc2NhbGUuY29tPgotLS0KdjctPnY4OgogKiBOb25lLgoKdjYtPnY3Ogog
KiBOb25lLgoKdjUtPnY2OgogKiBOb25lLgoKdjQtPnY1OgogKiBOb25lLgoKdjMtPnY0OgogKiBO
b25lLgoKdjItPnYzOgogKiBOb25lLgoKdjEtPnYyOgogKiBOb25lLgoKIGluY2x1ZGUvbGludXgv
bWZkL3N5c2Nvbi9pbXg2cS1pb211eGMtZ3ByLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWZkL3N5c2Nvbi9pbXg2cS1p
b211eGMtZ3ByLmggYi9pbmNsdWRlL2xpbnV4L21mZC9zeXNjb24vaW14NnEtaW9tdXhjLWdwci5o
CmluZGV4IGZmNDQzNzQuLjNiMGJlZDQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbWZkL3N5
c2Nvbi9pbXg2cS1pb211eGMtZ3ByLmgKKysrIGIvaW5jbHVkZS9saW51eC9tZmQvc3lzY29uL2lt
eDZxLWlvbXV4Yy1ncHIuaApAQCAtMjA3LDYgKzIwNyw3IEBACiAjZGVmaW5lIElNWDZRX0dQUjNf
TFZEUzBfTVVYX0NUTF9JUFUxX0RJMQkoMHgxIDw8IDYpCiAjZGVmaW5lIElNWDZRX0dQUjNfTFZE
UzBfTVVYX0NUTF9JUFUyX0RJMAkoMHgyIDw8IDYpCiAjZGVmaW5lIElNWDZRX0dQUjNfTFZEUzBf
TVVYX0NUTF9JUFUyX0RJMQkoMHgzIDw8IDYpCisjZGVmaW5lIElNWDZRX0dQUjNfTUlQSV9NVVhf
Q1RMX1NISUZUCQk0CiAjZGVmaW5lIElNWDZRX0dQUjNfTUlQSV9NVVhfQ1RMX01BU0sJCSgweDMg
PDwgNCkKICNkZWZpbmUgSU1YNlFfR1BSM19NSVBJX01VWF9DVExfSVBVMV9ESTAJKDB4MCA8PCA0
KQogI2RlZmluZSBJTVg2UV9HUFIzX01JUElfTVVYX0NUTF9JUFUxX0RJMQkoMHgxIDw8IDQpCi0t
IAoyLjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
