From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v7 04/21] ARM: imx6q: Add GPR3 MIPI muxing control
 register field shift bits definition
Date: Tue, 30 Dec 2014 11:33:54 +0800
Message-ID: <1419910451-15268-5-git-send-email-Ying.Liu@freescale.com>
References: <1419910451-15268-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1419910451-15268-1-git-send-email-Ying.Liu@freescale.com>
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
IDxZaW5nLkxpdUBmcmVlc2NhbGUuY29tPgotLS0KdjYtPnY3OgogKiBOb25lLgoKdjUtPnY2Ogog
KiBOb25lLgoKdjQtPnY1OgogKiBOb25lLgoKdjMtPnY0OgogKiBOb25lLgoKdjItPnYzOgogKiBO
b25lLgoKdjEtPnYyOgogKiBOb25lLgoKIGluY2x1ZGUvbGludXgvbWZkL3N5c2Nvbi9pbXg2cS1p
b211eGMtZ3ByLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvbWZkL3N5c2Nvbi9pbXg2cS1pb211eGMtZ3ByLmggYi9pbmNs
dWRlL2xpbnV4L21mZC9zeXNjb24vaW14NnEtaW9tdXhjLWdwci5oCmluZGV4IGZmNDQzNzQuLjNi
MGJlZDQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbWZkL3N5c2Nvbi9pbXg2cS1pb211eGMt
Z3ByLmgKKysrIGIvaW5jbHVkZS9saW51eC9tZmQvc3lzY29uL2lteDZxLWlvbXV4Yy1ncHIuaApA
QCAtMjA3LDYgKzIwNyw3IEBACiAjZGVmaW5lIElNWDZRX0dQUjNfTFZEUzBfTVVYX0NUTF9JUFUx
X0RJMQkoMHgxIDw8IDYpCiAjZGVmaW5lIElNWDZRX0dQUjNfTFZEUzBfTVVYX0NUTF9JUFUyX0RJ
MAkoMHgyIDw8IDYpCiAjZGVmaW5lIElNWDZRX0dQUjNfTFZEUzBfTVVYX0NUTF9JUFUyX0RJMQko
MHgzIDw8IDYpCisjZGVmaW5lIElNWDZRX0dQUjNfTUlQSV9NVVhfQ1RMX1NISUZUCQk0CiAjZGVm
aW5lIElNWDZRX0dQUjNfTUlQSV9NVVhfQ1RMX01BU0sJCSgweDMgPDwgNCkKICNkZWZpbmUgSU1Y
NlFfR1BSM19NSVBJX01VWF9DVExfSVBVMV9ESTAJKDB4MCA8PCA0KQogI2RlZmluZSBJTVg2UV9H
UFIzX01JUElfTVVYX0NUTF9JUFUxX0RJMQkoMHgxIDw8IDQpCi0tIAoyLjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
