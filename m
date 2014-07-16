From: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>
Subject: [PATCH v3 03/12] ARM: Berlin: select the reset controller
Date: Wed, 16 Jul 2014 10:25:57 +0200
Message-ID: <1405499166-6726-4-git-send-email-antoine.tenart@free-electrons.com>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sebastian.hesselbarth@gmail.com, Peter.Chen@freescale.com, balbi@ti.com, p.zabel@pengutronix.de
Cc: thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIE1hcnZlbGwgQmVybGluIFNvQ3Mgbm93IGhhcyBhIHJlc2V0IGNvbnRyb2xsZXIuIEFkZCB0
aGUgbmVlZGVkCmNvbmZpZ3VyYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBBbnRvaW5lIFTDqW5hcnQg
PGFudG9pbmUudGVuYXJ0QGZyZWUtZWxlY3Ryb25zLmNvbT4KLS0tCiBhcmNoL2FybS9tYWNoLWJl
cmxpbi9LY29uZmlnIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtYmVybGluL0tjb25maWcgYi9hcmNoL2FybS9tYWNoLWJl
cmxpbi9LY29uZmlnCmluZGV4IDI2MzFjZmM1YWIwZC4uM2E0ZmQxZTQxODAxIDEwMDY0NAotLS0g
YS9hcmNoL2FybS9tYWNoLWJlcmxpbi9LY29uZmlnCisrKyBiL2FyY2gvYXJtL21hY2gtYmVybGlu
L0tjb25maWcKQEAgLTEsMTEgKzEsMTMgQEAKIG1lbnVjb25maWcgQVJDSF9CRVJMSU4KIAlib29s
ICJNYXJ2ZWxsIEJlcmxpbiBTb0NzIiBpZiBBUkNIX01VTFRJX1Y3CisJc2VsZWN0IEFSQ0hfSEFT
X1JFU0VUX0NPTlRST0xMRVIKIAlzZWxlY3QgQVJDSF9SRVFVSVJFX0dQSU9MSUIKIAlzZWxlY3Qg
QVJNX0dJQwogCXNlbGVjdCBHRU5FUklDX0lSUV9DSElQCiAJc2VsZWN0IERXX0FQQl9JQ1RMCiAJ
c2VsZWN0IERXX0FQQl9USU1FUl9PRgogCXNlbGVjdCBQSU5DVFJMCisJc2VsZWN0IFJFU0VUX0NP
TlRST0xMRVIKIAogaWYgQVJDSF9CRVJMSU4KIAotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcg
bGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
