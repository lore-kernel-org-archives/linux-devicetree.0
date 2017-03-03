From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH v2 1/3] ARM: dts: BCM5301X: Correct GIC_PPI interrupt flags
Date: Thu,  2 Mar 2017 19:21:32 -0500
Message-ID: <1488500494-20622-2-git-send-email-jon.mason@broadcom.com>
References: <1488500494-20622-1-git-send-email-jon.mason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488500494-20622-1-git-send-email-jon.mason@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

R0lDX1BQSSBmbGFncyB3ZXJlIG1pc2NvbmZpZ3VyZWQgZm9yIHRoZSB0aW1lcnMsIHJlc3VsdGlu
ZyBpbiBlcnJvcnMKbGlrZToKWyAgICAwLjAwMDAwMF0gR0lDOiBQUEkxMSBpcyBzZWN1cmUgb3Ig
bWlzY29uZmlndXJlZAoKQ2hhbmdpbmcgdGhlbSB0byBiZWluZyBlZGdlIHRyaWdnZXJlZCBjb3Jy
ZWN0cyB0aGUgaXNzdWUKClN1Z2dlc3RlZC1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPgpTaWduZWQtb2ZmLWJ5OiBKb24gTWFzb24gPGpvbi5tYXNvbkBicm9hZGNvbS5jb20+
CkZpeGVzOiBkMjc1MDlmMSAoIkFSTTogQkNNNTMwMVg6IGFkZCBkdHMgZmlsZXMgZm9yIEJDTTQ3
MDggU29DIikKLS0tCiBhcmNoL2FybS9ib290L2R0cy9iY201MzAxeC5kdHNpIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2JjbTUzMDF4LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9i
Y201MzAxeC5kdHNpCmluZGV4IDRmYmIwODkuLjAwZGU2MmQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2JjbTUzMDF4LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYmNtNTMwMXgu
ZHRzaQpAQCAtNjYsMTQgKzY2LDE0IEBACiAJCXRpbWVyQDIwMjAwIHsKIAkJCWNvbXBhdGlibGUg
PSAiYXJtLGNvcnRleC1hOS1nbG9iYWwtdGltZXIiOwogCQkJcmVnID0gPDB4MjAyMDAgMHgxMDA+
OwotCQkJaW50ZXJydXB0cyA9IDxHSUNfUFBJIDExIElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJ
aW50ZXJydXB0cyA9IDxHSUNfUFBJIDExIElSUV9UWVBFX0VER0VfUklTSU5HPjsKIAkJCWNsb2Nr
cyA9IDwmcGVyaXBoX2Nsaz47CiAJCX07CiAKIAkJbG9jYWwtdGltZXJAMjA2MDAgewogCQkJY29t
cGF0aWJsZSA9ICJhcm0sY29ydGV4LWE5LXR3ZC10aW1lciI7CiAJCQlyZWcgPSA8MHgyMDYwMCAw
eDEwMD47Ci0JCQlpbnRlcnJ1cHRzID0gPEdJQ19QUEkgMTMgSVJRX1RZUEVfTEVWRUxfSElHSD47
CisJCQlpbnRlcnJ1cHRzID0gPEdJQ19QUEkgMTMgSVJRX1RZUEVfRURHRV9SSVNJTkc+OwogCQkJ
Y2xvY2tzID0gPCZwZXJpcGhfY2xrPjsKIAkJfTsKIAotLSAKMi43LjQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
