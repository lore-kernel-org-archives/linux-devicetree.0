From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 2/8] Documentation: devicetree: amlogic: Document Meson GXBaby
Date: Tue,  1 Mar 2016 00:44:19 +0100
Message-ID: <1456789465-2962-3-git-send-email-afaerber@suse.de>
References: <1456789465-2962-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1456789465-2962-1-git-send-email-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-meson@googlegroups.com
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Matthias Brugger <mbrugger@suse.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Nicolas Saenz <nicolassaenzj@gmail.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Carlo Caione <carlo@caione.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VXNlICJhbWxvZ2ljLG1lc29uLWd4YmIiIGNvbXBhdGlibGUgc3RyaW5nLgoKU2lnbmVkLW9mZi1i
eTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgotLS0KIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy50eHQgfCA0ICsrKysKIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL2FtbG9naWMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9hbWxvZ2ljLnR4dAppbmRleCAxZGZlZTIwZWVlNzQuLjc3NmYwOGNhMjE1ZiAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2lj
LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMu
dHh0CkBAIC0xMyw2ICsxMywxMCBAQCBCb2FyZHMgd2l0aCB0aGUgQW1sb2dpYyBNZXNvbjhiIFNv
QyBzaGFsbCBoYXZlIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllczoKICAgUmVxdWlyZWQgcm9vdCBu
b2RlIHByb3BlcnR5OgogICAgIGNvbXBhdGlibGU6ICJhbWxvZ2ljLG1lc29uOGIiOwogCitCb2Fy
ZHMgd2l0aCB0aGUgQW1sb2dpYyBNZXNvbiBHWEJhYnkgU29DIHNoYWxsIGhhdmUgdGhlIGZvbGxv
d2luZyBwcm9wZXJ0aWVzOgorICBSZXF1aXJlZCByb290IG5vZGUgcHJvcGVydHk6CisgICAgY29t
cGF0aWJsZTogImFtbG9naWMsbWVzb24tZ3hiYiI7CisKIEJvYXJkIGNvbXBhdGlibGUgdmFsdWVz
OgogICAtICJnZW5pYXRlY2gsYXR2MTIwMCIgKE1lc29uNikKICAgLSAibWluaXgsbmVvLXg4IiAo
TWVzb244KQotLSAKMi42LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
