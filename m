From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH] ARM: dts: BCM53573: Relicense SoC file to the GPL 2.0+ / MIT
Date: Thu, 20 Sep 2018 13:39:28 +0200
Message-ID: <20180920113928.27048-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jon Mason <jonmason@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBtYXRjaGVzIGxp
Y2Vuc2luZyB1c2VkIGJ5IG1vc3Qgb2YgQkNNNTMwMVggZmlsZXMgYW5kIGlzIHByZWZlcnJlZCBh
czoKMSkgR1BMIDIuMCsgbWFrZXMgaXQgY2xlYXJseSBjb21wYXRpYmxlIHdpdGggTGludXgga2Vy
bmVsCjIpIE1JVCBpcyBhbHNvIHBlcm1pc3NpdmUgYnV0IHByZWZlcnJlZCBvdmVyIElTQwoKVGhp
cyBmaWxlIGhhcyBiZWVuIGRldmVsb3BlZCBieSBtZSAmIG9uY2UgbW9kaWZpZWQgYnkgUm9iIGRy
b3BwaW5nIGEKc2luZ2xlIGxlYWRpbmcgemVybyBpbiBhbiBVQVJUIGFkZHJlc3MuCgpTaWduZWQt
b2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Ci0tLQpSb2I6IHlvdSBt
b2RpZmllZCB0aGlzIGZpbGUgYnkgY29tbWl0IDhkY2NhZmFhMjgxYSAoImFybTogZHRzOiBmaXgK
dW5pdC1hZGRyZXNzIGxlYWRpbmcgMHMiKSB3aXRoIGEgdHJpdmlhbCBjaGFuZ2UgZ2VuZXJhdGVk
IGJ5IGEgc2ltcGxlCnBlcmwgY29tbWFuZC4KCkknbSBub3Qgc3VyZSBpZiBJIGV2ZW4gbmVlZCB5
b3VyIEFjaywgYnV0IEknbSBub3QgYSBsYXd5ZXIgYWZ0ZXIgYWxsLgpNYXliZSB5b3UgY291bGQg
YWNrIHRoaXMgcGF0Y2gsIGp1c3QgdG8ga2VlcCBpdCAxMDAlIGxlZ2FsbHkgY2xlYXI/Ci0tLQog
YXJjaC9hcm0vYm9vdC9kdHMvYmNtNTM1NzMuZHRzaSB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9v
dC9kdHMvYmNtNTM1NzMuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2JjbTUzNTczLmR0c2kKaW5k
ZXggNDUzYTJhMzdkYWJkLi41MDU0ZmE5ZWIwZDAgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2JjbTUzNTczLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYmNtNTM1NzMuZHRzaQpA
QCAtMSw3ICsxLDYgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxh
dGVyIE9SIE1JVAogLyoKICAqIENvcHlyaWdodCAoQykgMjAxNiBSYWZhxYIgTWnFgmVja2kgPHJh
ZmFsQG1pbGVja2kucGw+Ci0gKgotICogTGljZW5zZWQgdW5kZXIgdGhlIElTQyBsaWNlbnNlLgog
ICovCiAKICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KLS0gCjIuMTMuNwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1r
ZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJu
ZWwK
