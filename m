From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v4 04/21] ARM: imx6q: Add GPR3 MIPI muxing control
 register field shift bits definition
Date: Tue, 23 Dec 2014 18:02:02 +0800
Message-ID: <1419328939-22758-5-git-send-email-Ying.Liu@freescale.com>
References: <1419328939-22758-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1419328939-22758-1-git-send-email-Ying.Liu@freescale.com>
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
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, linux-kernel@vger.kernel.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, andyshrk@gmail.com
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIGEgbWFjcm8gdG8gZGVmaW5lIHRoZSBHUFIzIE1JUEkgbXV4aW5nIGNv
bnRyb2wgcmVnaXN0ZXIgZmllbGQKc2hpZnQgYml0cy4KClNpZ25lZC1vZmYtYnk6IExpdSBZaW5n
IDxZaW5nLkxpdUBmcmVlc2NhbGUuY29tPgotLS0KdjMtPnY0OgogKiBOb25lLgoKdjItPnYzOgog
KiBOb25lLgoKdjEtPnYyOgogKiBOb25lLgoKIGluY2x1ZGUvbGludXgvbWZkL3N5c2Nvbi9pbXg2
cS1pb211eGMtZ3ByLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWZkL3N5c2Nvbi9pbXg2cS1pb211eGMtZ3ByLmggYi9p
bmNsdWRlL2xpbnV4L21mZC9zeXNjb24vaW14NnEtaW9tdXhjLWdwci5oCmluZGV4IGZmNDQzNzQu
LjNiMGJlZDQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbWZkL3N5c2Nvbi9pbXg2cS1pb211
eGMtZ3ByLmgKKysrIGIvaW5jbHVkZS9saW51eC9tZmQvc3lzY29uL2lteDZxLWlvbXV4Yy1ncHIu
aApAQCAtMjA3LDYgKzIwNyw3IEBACiAjZGVmaW5lIElNWDZRX0dQUjNfTFZEUzBfTVVYX0NUTF9J
UFUxX0RJMQkoMHgxIDw8IDYpCiAjZGVmaW5lIElNWDZRX0dQUjNfTFZEUzBfTVVYX0NUTF9JUFUy
X0RJMAkoMHgyIDw8IDYpCiAjZGVmaW5lIElNWDZRX0dQUjNfTFZEUzBfTVVYX0NUTF9JUFUyX0RJ
MQkoMHgzIDw8IDYpCisjZGVmaW5lIElNWDZRX0dQUjNfTUlQSV9NVVhfQ1RMX1NISUZUCQk0CiAj
ZGVmaW5lIElNWDZRX0dQUjNfTUlQSV9NVVhfQ1RMX01BU0sJCSgweDMgPDwgNCkKICNkZWZpbmUg
SU1YNlFfR1BSM19NSVBJX01VWF9DVExfSVBVMV9ESTAJKDB4MCA8PCA0KQogI2RlZmluZSBJTVg2
UV9HUFIzX01JUElfTVVYX0NUTF9JUFUxX0RJMQkoMHgxIDw8IDQpCi0tIAoyLjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
