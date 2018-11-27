From: Jan Tuerk <jan.tuerk@emtrion.com>
Subject: [PATCH v8 1/4] ARM: dts: imx: Add an cpu0 label for imx6dl devices.
Date: Tue, 27 Nov 2018 16:04:01 +0100
Message-ID: <20181127150407.15098-1-jan.tuerk@emtrion.com>
References: <20180829100811.55836-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180829100811.55836-1-jan.tuerk@emtrion.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Russell King <linux@armlinux.org.uk>, "GitAuthor: Jan Tuerk" <jan.tuerk@emtrion.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWRkaW5nIHRoZSBsYWJlbCBjcHUwIGFsbG93cyB0aGUgYWRqdXN0bWVudCBvZiBjcHUtcGFyYW1l
dGVycwpieSByZWZlcmVuY2UgaW4gb3ZlcmxheWluZyBkdHNpIGZpbGVzIGluIHRoZSBzYW1lIHdh
eSBhcyBpdAppcyBwb3NzaWJsZSBmb3IgaW14NnEgZGV2aWNlcy4KClNpZ25lZC1vZmYtYnk6IEph
biBUdWVyayA8amFuLnR1ZXJrQGVtdHJpb24uY29tPgpSZXZpZXdlZC1ieTogQW5kcmVhcyBGw6Ry
YmVyIDxhZmFlcmJlckBzdXNlLmRlPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDZkbC5kdHNp
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpV
bmNoYW5nZWQgc2luY2UgdjEgKHJlYmFzZWQpCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvaW14NmRsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2ZGwuZHRzaQppbmRleCBmMDYw
N2ViNDFkZjQuLjJlZDEwMzEwYTdiNyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14
NmRsLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NmRsLmR0c2kKQEAgLTE1LDcgKzE1
LDcgQEAKIAkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAJCSNzaXplLWNlbGxzID0gPDA+OwogCi0J
CWNwdUAwIHsKKwkJY3B1MDogY3B1QDAgewogCQkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWE5
IjsKIAkJCWRldmljZV90eXBlID0gImNwdSI7CiAJCQlyZWcgPSA8MD47Ci0tIAplbXRyaW9uIEdt
YkgKQWx0ZXIgU2NobGFjaHRob2YgNDUKNzYxMzEgS2FybHNydWhlCkdFUk1BTlkKaHR0cHM6Ly93
d3cuZW10cmlvbi5kZQoKQW10c2dlcmljaHQgTWFubmhlaW0KSFJCIDExMCAzMDAKR2VzY2jDpGZ0
c2bDvGhyZXI6IERpZXRlciBCYXVyLCBSYW1vbmEgTWF1cmVyCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
