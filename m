From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 02/28] dt-bindings: arm: Document Actions Semi S500
Date: Tue,  6 Jun 2017 02:54:00 +0200
Message-ID: <20170606005426.26446-3-afaerber@suse.de>
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

VGhlIEFjdGlvbnMgU2VtaSBTNTAwIGlzIGEgcXVhZC1jb3JlIEFSTSBDb3J0ZXgtQTkgU29DLgpU
aGUgTGVNYWtlciBHdWl0YXIgaXMgYW4gU09ESU1NLWZvcm1hdCBtb2R1bGUgd2l0aCB0aGF0IFNv
Qy4KCkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5
OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Ci0tLQogdjIgLT4gdjMgLT4gdjQ6
IHVuY2hhbmdlZAogCiB2MSAtPiB2MjoKICogQWRvcHRlZCAiYWN0aW9ucyIgdmVuZG9yIHByZWZp
eAogKiBFeHRlbmRlZCB0ZXh0CiAKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vYWN0aW9ucy50eHQgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL2FjdGlvbnMudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hY3Rpb25zLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYWN0aW9ucy50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMDAwLi4xZDM3ODJlNDFiMDAKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FjdGlvbnMudHh0CkBAIC0wLDAgKzEs
MjQgQEAKK0FjdGlvbnMgU2VtaSBwbGF0Zm9ybXMgZGV2aWNlIHRyZWUgYmluZGluZ3MKKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKworCitTNTAwIFNvQworPT09
PT09PT0KKworUmVxdWlyZWQgcm9vdCBub2RlIHByb3BlcnRpZXM6CisKKyAtIGNvbXBhdGlibGUg
OiAgbXVzdCBjb250YWluICJhY3Rpb25zLHM1MDAiCisKKworTW9kdWxlczoKKworUm9vdCBub2Rl
IHByb3BlcnR5IGNvbXBhdGlibGUgbXVzdCBjb250YWluLCBkZXBlbmRpbmcgb24gbW9kdWxlOgor
CisgLSBMZU1ha2VyIEd1aXRhcjogImxlbWFrZXIsZ3VpdGFyIgorCisKK0JvYXJkczoKKworUm9v
dCBub2RlIHByb3BlcnR5IGNvbXBhdGlibGUgbXVzdCBjb250YWluLCBkZXBlbmRpbmcgb24gYm9h
cmQ6CisKKyAtIExlTWFrZXIgR3VpdGFyIEJhc2UgQm9hcmQgcmV2LiBCOiAibGVtYWtlcixndWl0
YXItYmItcmV2LWIiLCAibGVtYWtlcixndWl0YXIiCi0tIAoyLjEyLjMKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
