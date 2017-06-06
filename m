From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 03/28] dt-bindings: timer: Document Owl timer
Date: Tue,  6 Jun 2017 02:54:01 +0200
Message-ID: <20170606005426.26446-4-afaerber@suse.de>
References: <20170606005426.26446-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170606005426.26446-1-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, support@lemaker.org, =?UTF-8?q?=E5=BC=A0=E5=A4=A9=E7=9B=8A?= <tyzhang@actions-semi.com>, devicetree@vger.kernel.org, 96boards@ucrobotics.com, linux-kernel@vger.kernel.org, Thomas Liau <thomas.liau@actions-semi.com>, Rob Herring <robh+dt@kernel.org>, mp-cs@actions-semi.com, =?UTF-8?q?=E5=88=98=E7=82=9C?= <liuwei@actions-semi.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, =?UTF-8?q?=E5=BC=A0=E4=B8=9C=E9=A3=8E?= <zhangdf@actions-semi.com>
List-Id: devicetree@vger.kernel.org

VGhlIEFjdGlvbnMgU2VtaSBTNTAwIFNvQyBjb250YWlucyBhIHRpbWVyIGJsb2NrIHdpdGggdHdv
IDIgSHogYW5kIHR3bwozMi1iaXQgdGltZXJzLiBUaGUgUzkwMCBTb0MgdGltZXIgYmxvY2sgaGFz
IGZvdXIgMzItYml0IHRpbWVycy4KCkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Ci0t
LQogdjMgLT4gdjQ6CiAqIENoYW5nZWQgaW50ZXJydXB0IG5hbWVzIHRvIGxvd2VyLWNhc2UgKE1h
cmspCiAKIHYyIC0+IHYzOgogKiBBZG9wdGVkIGludGVycnVwdC1uYW1lcwogKiBDaGFuZ2VkIGNv
bXBhdGlibGUgZm9yIFM1MDAKICogQWRkZWQgUzkwMCBjb21wYXRpYmxlIGFuZCBpbnRlcnJ1cHQg
bmFtZXMKIAogdjI6IG5ldwogCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9hY3Rpb25z
LG93bC10aW1lci50eHQgIHwgMjAgKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyMCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3RpbWVyL2FjdGlvbnMsb3dsLXRpbWVyLnR4dAoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9hY3Rpb25zLG93bC10aW1l
ci50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvYWN0aW9ucyxv
d2wtdGltZXIudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZTNj
MjhkYTgwY2IyCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3RpbWVyL2FjdGlvbnMsb3dsLXRpbWVyLnR4dApAQCAtMCwwICsxLDIwIEBACitBY3Rp
b25zIFNlbWkgT3dsIFRpbWVyCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CistIGNvbXBhdGlibGUg
ICAgICA6ICAiYWN0aW9ucyxzNTAwLXRpbWVyIiBmb3IgUzUwMAorICAgICAgICAgICAgICAgICAg
ICAgImFjdGlvbnMsczkwMC10aW1lciIgZm9yIFM5MDAKKy0gcmVnICAgICAgICAgICAgIDogIE9m
ZnNldCBhbmQgbGVuZ3RoIG9mIHRoZSByZWdpc3RlciBzZXQgZm9yIHRoZSBkZXZpY2UuCistIGlu
dGVycnVwdHMgICAgICA6ICBTaG91bGQgY29udGFpbiB0aGUgaW50ZXJydXB0cy4KKy0gaW50ZXJy
dXB0LW5hbWVzIDogIFZhbGlkIG5hbWVzIGFyZTogIjJoejAiLCAiMmh6MSIsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ0aW1lcjAiLCAidGltZXIxIiwgInRpbWVyMiIs
ICJ0aW1lcjMiCisgICAgICAgICAgICAgICAgICAgICBTZWUgLi4vcmVzb3VyY2UtbmFtZXMudHh0
CisKK0V4YW1wbGU6CisKKwkJdGltZXJAYjAxNjgwMDAgeworCQkJY29tcGF0aWJsZSA9ICJhY3Rp
b25zLHM1MDAtdGltZXIiOworCQkJcmVnID0gPDB4YjAxNjgwMDAgMHgxMDA+OworCQkJaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDEwIElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJICAgICAgICAgICAg
IDxHSUNfU1BJIDExIElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJaW50ZXJydXB0LW5hbWVzID0g
InRpbWVyMCIsICJ0aW1lcjEiOworCQl9OwotLSAKMi4xMi4zCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
