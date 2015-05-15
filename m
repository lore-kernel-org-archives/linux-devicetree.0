From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Subject: [PATCH 2/2] ARM: imx_v6_v7_defconfig: updates for Armadeus Systems
 APF6 boards
Date: Fri, 15 May 2015 15:44:28 +0200
Message-ID: <1431697468-19363-2-git-send-email-sebastien.szymanski@armadeus.com>
References: <1431697468-19363-1-git-send-email-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431697468-19363-1-git-send-email-sebastien.szymanski@armadeus.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
List-Id: devicetree@vger.kernel.org

QVBGNiBEdWFsIGFuZCBRdWFkIFNvTSBoYXZlIGFuIHdsMTI3MSB3aWZpL2J0IGNoaXAuIFRoaXMg
Y2hpcCBuZWVkcwpDT05GSUdfQlRfSENJVUFSVF9MTC4KQVBGNkRldiBjYXJyaWVyIGJvYXJkIGhh
cyBhIFNYODY1NCBJMkMgdG91Y2hzY3JlZW4gY29udHJvbGxlci4KClNpZ25lZC1vZmYtYnk6IFPD
qWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KLS0t
CiBhcmNoL2FybS9jb25maWdzL2lteF92Nl92N19kZWZjb25maWcgfCA2ICsrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3Mv
aW14X3Y2X3Y3X2RlZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3MvaW14X3Y2X3Y3X2RlZmNvbmZp
ZwppbmRleCBmZGViMWM4Li4zYWQ1M2NlIDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdzL2lt
eF92Nl92N19kZWZjb25maWcKKysrIGIvYXJjaC9hcm0vY29uZmlncy9pbXhfdjZfdjdfZGVmY29u
ZmlnCkBAIC03Myw2ICs3Myw3IEBAIENPTkZJR19DQU49eQogQ09ORklHX0NBTl9GTEVYQ0FOPXkK
IENPTkZJR19CVD15CiBDT05GSUdfQlRfSENJVUFSVD15CitDT05GSUdfQlRfSENJVUFSVF9MTD15
CiBDT05GSUdfQlRfSENJVUFSVF8zV0lSRT15CiBDT05GSUdfQ0ZHODAyMTE9eQogQ09ORklHX01B
QzgwMjExPXkKQEAgLTEzOSw2ICsxNDAsMTAgQEAgQ09ORklHX1VTQl9SVEw4MTUyPW0KIENPTkZJ
R19VU0JfVVNCTkVUPW0KIENPTkZJR19VU0JfTkVUX0NEQ19FRU09bQogQ09ORklHX0JSQ01GTUFD
PW0KK0NPTkZJR19XTF9UST15CitDT05GSUdfV0wxMlhYPW0KK0NPTkZJR19XTENPUkVfU0RJTz1t
CisjIENPTkZJR19XSUxJTktfUExBVEZPUk1fREFUQSBpcyBub3Qgc2V0CiAjIENPTkZJR19JTlBV
VF9NT1VTRURFVl9QU0FVWCBpcyBub3Qgc2V0CiBDT05GSUdfSU5QVVRfRVZERVY9eQogQ09ORklH
X0lOUFVUX0VWQlVHPW0KQEAgLTE1MSw2ICsxNTYsNyBAQCBDT05GSUdfVE9VQ0hTQ1JFRU5fRUdB
TEFYPXkKIENPTkZJR19UT1VDSFNDUkVFTl9NQzEzNzgzPXkKIENPTkZJR19UT1VDSFNDUkVFTl9U
U0MyMDA3PXkKIENPTkZJR19UT1VDSFNDUkVFTl9TVE1QRT15CitDT05GSUdfVE9VQ0hTQ1JFRU5f
U1g4NjU0PXkKIENPTkZJR19JTlBVVF9NSVNDPXkKIENPTkZJR19JTlBVVF9NTUE4NDUwPXkKIENP
TkZJR19TRVJJT19TRVJQT1JUPW0KLS0gCjIuMC41CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
