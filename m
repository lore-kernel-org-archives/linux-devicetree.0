From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 02/25] dt-bindings: arm: Document Actions Semi S500
Date: Tue, 28 Feb 2017 07:35:12 +0100
Message-ID: <20170228063535.32069-3-afaerber@suse.de>
References: <20170228063535.32069-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170228063535.32069-1-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, support@lemaker.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, mp-cs@actions-semi.com, 96boards@ucrobotics.com, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIEFjdGlvbnMgU2VtaSBTNTAwIGlzIGEgcXVhZC1jb3JlIEFSTSBDb3J0ZXgtQTkgU29DLgpU
aGUgTGVNYWtlciBHdWl0YXIgaXMgYW4gU09ESU1NLWZvcm1hdCBtb2R1bGUgd2l0aCB0aGF0IFNv
Qy4KCkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5
OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Ci0tLQogdjIgLT4gdjM6IHVuY2hh
bmdlZAogCiB2MSAtPiB2MjoKICogQWRvcHRlZCAiYWN0aW9ucyIgdmVuZG9yIHByZWZpeAogKiBF
eHRlbmRlZCB0ZXh0CiAKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYWN0
aW9ucy50eHQgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI0
IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL2FjdGlvbnMudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hY3Rpb25zLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vYWN0aW9ucy50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMC4uMWQzNzgyZQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vYWN0aW9ucy50eHQKQEAgLTAsMCArMSwyNCBAQAorQWN0aW9ucyBT
ZW1pIHBsYXRmb3JtcyBkZXZpY2UgdHJlZSBiaW5kaW5ncworLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCisKK1M1MDAgU29DCis9PT09PT09PQorCitSZXF1aXJl
ZCByb290IG5vZGUgcHJvcGVydGllczoKKworIC0gY29tcGF0aWJsZSA6ICBtdXN0IGNvbnRhaW4g
ImFjdGlvbnMsczUwMCIKKworCitNb2R1bGVzOgorCitSb290IG5vZGUgcHJvcGVydHkgY29tcGF0
aWJsZSBtdXN0IGNvbnRhaW4sIGRlcGVuZGluZyBvbiBtb2R1bGU6CisKKyAtIExlTWFrZXIgR3Vp
dGFyOiAibGVtYWtlcixndWl0YXIiCisKKworQm9hcmRzOgorCitSb290IG5vZGUgcHJvcGVydHkg
Y29tcGF0aWJsZSBtdXN0IGNvbnRhaW4sIGRlcGVuZGluZyBvbiBib2FyZDoKKworIC0gTGVNYWtl
ciBHdWl0YXIgQmFzZSBCb2FyZCByZXYuIEI6ICJsZW1ha2VyLGd1aXRhci1iYi1yZXYtYiIsICJs
ZW1ha2VyLGd1aXRhciIKLS0gCjIuMTAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
