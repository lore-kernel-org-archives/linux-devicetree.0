From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v9 02/20] ARM: imx6q: Add GPR3 MIPI muxing control
 register field shift bits definition
Date: Thu, 12 Feb 2015 14:01:25 +0800
Message-ID: <1423720903-24806-3-git-send-email-Ying.Liu@freescale.com>
References: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com>
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
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, a.hajda@samsung.com, andy.yan@rock-chips.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIGEgbWFjcm8gdG8gZGVmaW5lIHRoZSBHUFIzIE1JUEkgbXV4aW5nIGNv
bnRyb2wgcmVnaXN0ZXIgZmllbGQKc2hpZnQgYml0cy4KClNpZ25lZC1vZmYtYnk6IExpdSBZaW5n
IDxZaW5nLkxpdUBmcmVlc2NhbGUuY29tPgotLS0KdjgtPnY5OgogKiBSZWJhc2Ugb250byB0aGUg
aW14LWRybS9uZXh0IGJyYW5jaCBvZiBQaGlsaXBwIFphYmVsJ3Mgb3BlbiBnaXQgcmVwb3NpdG9y
eS4KCnY3LT52ODoKICogTm9uZS4KCnY2LT52NzoKICogTm9uZS4KCnY1LT52NjoKICogTm9uZS4K
CnY0LT52NToKICogTm9uZS4KCnYzLT52NDoKICogTm9uZS4KCnYyLT52MzoKICogTm9uZS4KCnYx
LT52MjoKICogTm9uZS4KCiBpbmNsdWRlL2xpbnV4L21mZC9zeXNjb24vaW14NnEtaW9tdXhjLWdw
ci5oIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L21mZC9zeXNjb24vaW14NnEtaW9tdXhjLWdwci5oIGIvaW5jbHVkZS9saW51
eC9tZmQvc3lzY29uL2lteDZxLWlvbXV4Yy1ncHIuaAppbmRleCBjODc3Y2FkLi5kMTZmNGM4IDEw
MDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21mZC9zeXNjb24vaW14NnEtaW9tdXhjLWdwci5oCisr
KyBiL2luY2x1ZGUvbGludXgvbWZkL3N5c2Nvbi9pbXg2cS1pb211eGMtZ3ByLmgKQEAgLTIwNyw2
ICsyMDcsNyBAQAogI2RlZmluZSBJTVg2UV9HUFIzX0xWRFMwX01VWF9DVExfSVBVMV9ESTEJKDB4
MSA8PCA2KQogI2RlZmluZSBJTVg2UV9HUFIzX0xWRFMwX01VWF9DVExfSVBVMl9ESTAJKDB4MiA8
PCA2KQogI2RlZmluZSBJTVg2UV9HUFIzX0xWRFMwX01VWF9DVExfSVBVMl9ESTEJKDB4MyA8PCA2
KQorI2RlZmluZSBJTVg2UV9HUFIzX01JUElfTVVYX0NUTF9TSElGVAkJNAogI2RlZmluZSBJTVg2
UV9HUFIzX01JUElfTVVYX0NUTF9NQVNLCQkoMHgzIDw8IDQpCiAjZGVmaW5lIElNWDZRX0dQUjNf
TUlQSV9NVVhfQ1RMX0lQVTFfREkwCSgweDAgPDwgNCkKICNkZWZpbmUgSU1YNlFfR1BSM19NSVBJ
X01VWF9DVExfSVBVMV9ESTEJKDB4MSA8PCA0KQotLSAKMi4xLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
