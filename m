From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 02/18] ARM64: dts: amlogic: Sort Makefile
Date: Fri, 20 Jan 2017 23:21:02 +0100
Message-ID: <20170120222118.21476-3-afaerber@suse.de>
References: <20170120222118.21476-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170120222118.21476-1-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-amlogic@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Carlo Caione <carlo@caione.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgotLS0KIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZSB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZpbGUgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9n
aWMvTWFrZWZpbGUKaW5kZXggM2Y5NGJjZTMzYjdmLi5lZmNkMTc2M2E4MmQgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZQorKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvTWFrZWZpbGUKQEAgLTcsMTMgKzcsMTMgQEAgZHRiLSQoQ09ORklHX0FS
Q0hfTUVTT04pICs9IG1lc29uLWd4YmItdmVnYS1zOTUtbWV0YS5kdGIKIGR0Yi0kKENPTkZJR19B
UkNIX01FU09OKSArPSBtZXNvbi1neGJiLXZlZ2Etczk1LXRlbG9zLmR0YgogZHRiLSQoQ09ORklH
X0FSQ0hfTUVTT04pICs9IG1lc29uLWd4YmItd2V0ZWstaHViLmR0YgogZHRiLSQoQ09ORklHX0FS
Q0hfTUVTT04pICs9IG1lc29uLWd4YmItd2V0ZWstcGxheTIuZHRiCitkdGItJChDT05GSUdfQVJD
SF9NRVNPTikgKz0gbWVzb24tZ3hsLXM5MDV4LW5leGJveC1hOTV4LmR0YgogZHRiLSQoQ09ORklH
X0FSQ0hfTUVTT04pICs9IG1lc29uLWd4bC1zOTA1eC1wMjEyLmR0YgogZHRiLSQoQ09ORklHX0FS
Q0hfTUVTT04pICs9IG1lc29uLWd4bC1zOTA1ZC1wMjMwLmR0YgogZHRiLSQoQ09ORklHX0FSQ0hf
TUVTT04pICs9IG1lc29uLWd4bC1zOTA1ZC1wMjMxLmR0YgotZHRiLSQoQ09ORklHX0FSQ0hfTUVT
T04pICs9IG1lc29uLWd4bC1zOTA1eC1uZXhib3gtYTk1eC5kdGIKK2R0Yi0kKENPTkZJR19BUkNI
X01FU09OKSArPSBtZXNvbi1neG0tbmV4Ym94LWExLmR0YgogZHRiLSQoQ09ORklHX0FSQ0hfTUVT
T04pICs9IG1lc29uLWd4bS1xMjAwLmR0YgogZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1l
c29uLWd4bS1xMjAxLmR0YgotZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWd4bS1u
ZXhib3gtYTEuZHRiCiAKIGFsd2F5cwkJOj0gJChkdGIteSkKIHN1YmRpci15CTo9ICQoZHRzLWRp
cnMpCi0tIAoyLjEwLjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hcm0ta2VybmVsCg==
