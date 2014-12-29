From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v6 04/21] ARM: imx6q: Add GPR3 MIPI muxing control
 register field shift bits definition
Date: Mon, 29 Dec 2014 14:39:11 +0800
Message-ID: <1419835168-9034-5-git-send-email-Ying.Liu@freescale.com>
References: <1419835168-9034-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1419835168-9034-1-git-send-email-Ying.Liu@freescale.com>
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
IDxZaW5nLkxpdUBmcmVlc2NhbGUuY29tPgotLS0KdjUtPnY2OgogKiBOb25lLgoKdjQtPnY1Ogog
KiBOb25lLgoKdjMtPnY0OgogKiBOb25lLgoKdjItPnYzOgogKiBOb25lLgoKdjEtPnYyOgogKiBO
b25lLgoKIGluY2x1ZGUvbGludXgvbWZkL3N5c2Nvbi9pbXg2cS1pb211eGMtZ3ByLmggfCAxICsK
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvbWZkL3N5c2Nvbi9pbXg2cS1pb211eGMtZ3ByLmggYi9pbmNsdWRlL2xpbnV4L21mZC9zeXNj
b24vaW14NnEtaW9tdXhjLWdwci5oCmluZGV4IGZmNDQzNzQuLjNiMGJlZDQgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvbGludXgvbWZkL3N5c2Nvbi9pbXg2cS1pb211eGMtZ3ByLmgKKysrIGIvaW5jbHVk
ZS9saW51eC9tZmQvc3lzY29uL2lteDZxLWlvbXV4Yy1ncHIuaApAQCAtMjA3LDYgKzIwNyw3IEBA
CiAjZGVmaW5lIElNWDZRX0dQUjNfTFZEUzBfTVVYX0NUTF9JUFUxX0RJMQkoMHgxIDw8IDYpCiAj
ZGVmaW5lIElNWDZRX0dQUjNfTFZEUzBfTVVYX0NUTF9JUFUyX0RJMAkoMHgyIDw8IDYpCiAjZGVm
aW5lIElNWDZRX0dQUjNfTFZEUzBfTVVYX0NUTF9JUFUyX0RJMQkoMHgzIDw8IDYpCisjZGVmaW5l
IElNWDZRX0dQUjNfTUlQSV9NVVhfQ1RMX1NISUZUCQk0CiAjZGVmaW5lIElNWDZRX0dQUjNfTUlQ
SV9NVVhfQ1RMX01BU0sJCSgweDMgPDwgNCkKICNkZWZpbmUgSU1YNlFfR1BSM19NSVBJX01VWF9D
VExfSVBVMV9ESTAJKDB4MCA8PCA0KQogI2RlZmluZSBJTVg2UV9HUFIzX01JUElfTVVYX0NUTF9J
UFUxX0RJMQkoMHgxIDw8IDQpCi0tIAoyLjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
