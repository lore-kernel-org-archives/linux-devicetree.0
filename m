From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 6/8] arm64: dts: rockchip: Add power key to GeekBox
Date: Sun,  6 Mar 2016 20:53:55 +0100
Message-ID: <1457294038-14243-7-git-send-email-afaerber@suse.de>
References: <1457294038-14243-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1457294038-14243-1-git-send-email-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-rockchip@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Stuebner <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Julien Chauveau <chauveau.julien@gmail.com>, Will Deacon <will.deacon@arm.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, "moderated list:ARM64 PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgotLS0KIHYy
IC0+IHYzOgogKiBBZG9wdGVkIHdha2V1cC1zb3VyY2UgaW5zdGVhZCBvZiBncGlvLWtleSx3YWtl
dXAgKEp1bGllbikKICogRHJvcHBlZCBncGlvLWtleXMgI2FkZHJlc3MtY2VsbHMgYW5kICNzaXpl
LWNlbGxzIHByb3BlcnRpZXMgKEp1bGllbikKICogRHJvcHBlZCBwb3dlciBidXR0b24gcmVnIHBy
b3BlcnR5IChKdWxpZW4pCiAqIEFkb3B0ZWQgS0VZX1BPV0VSIChKdWxpZW4pCiAqIEZpeGVkIHBv
d2VyIGJ1dHRvbiBwaW5jdHJsIHB1bGwgc2V0dGluZyAoSnVsaWVuKQogCiB2MjogTmV3CiAKIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzY4LWdlZWtib3guZHRzIHwgMjAgKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMzNjgtZ2Vla2JveC5kdHMgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM2OC1nZWVrYm94LmR0cwppbmRleCAwOThi
ZTM3MDBhNmYuLjcwMzZiNDljOTIwNiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9y
b2NrY2hpcC9yazMzNjgtZ2Vla2JveC5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yb2Nr
Y2hpcC9yazMzNjgtZ2Vla2JveC5kdHMKQEAgLTQyLDYgKzQyLDcgQEAKIAogL2R0cy12MS87CiAj
aW5jbHVkZSAicmszMzY4LmR0c2kiCisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW5wdXQvaW5wdXQu
aD4KIAogLyB7CiAJbW9kZWwgPSAiR2Vla0JveCI7CkBAIC03MCw2ICs3MSwxOSBAQAogCQlwaW5j
dHJsLTAgPSA8JmlyX2ludD47CiAJfTsKIAorCWtleXM6IGdwaW8ta2V5cyB7CisJCWNvbXBhdGli
bGUgPSAiZ3Bpby1rZXlzIjsKKwkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwkJcGluY3Ry
bC0wID0gPCZwd3Jfa2V5PjsKKworCQlidXR0b25AMCB7CisJCQlncGlvcyA9IDwmZ3BpbzAgMiBH
UElPX0FDVElWRV9MT1c+OworCQkJbGFiZWwgPSAiR1BJTyBQb3dlciI7CisJCQlsaW51eCxjb2Rl
ID0gPEtFWV9QT1dFUj47CisJCQl3YWtldXAtc291cmNlOworCQl9OworCX07CisKIAlsZWRzOiBn
cGlvLWxlZHMgewogCQljb21wYXRpYmxlID0gImdwaW8tbGVkcyI7CiAKQEAgLTI2NSw2ICsyNzks
MTIgQEAKIAkJfTsKIAl9OwogCisJa2V5cyB7CisJCXB3cl9rZXk6IHB3ci1rZXkgeworCQkJcm9j
a2NoaXAscGlucyA9IDwwIDIgUktfRlVOQ19HUElPICZwY2ZnX3B1bGxfbm9uZT47CisJCX07CisJ
fTsKKwogCXBtaWMgewogCQlwbWljX3NsZWVwOiBwbWljLXNsZWVwIHsKIAkJCXJvY2tjaGlwLHBp
bnMgPSA8MCAwIFJLX0ZVTkNfMiAmcGNmZ19wdWxsX25vbmU+OwotLSAKMi42LjIKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVs
IG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
