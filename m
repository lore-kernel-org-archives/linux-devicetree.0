From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 4/5] dt-bindings: interrupt-controller: Document RTD1195
Date: Tue, 17 Oct 2017 14:47:06 +0200
Message-ID: <20171017124708.6242-5-afaerber@suse.de>
References: <20171017124708.6242-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171017124708.6242-1-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Roc He <hepeng@zidoo.tv>, =?UTF-8?q?=E8=92=8B=E4=B8=BD=E7=90=B4?= <jiang.liqin@geniatech.com>, Bizon <bizongod@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

QWRkIGNvbXBhdGlibGUgc3RyaW5ncyBmb3IgUmVhbHRlayBSVEQxMTk1LgoKU2lnbmVkLW9mZi1i
eTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgotLS0KIHYzOiBOZXcKIAogQ291
bGQgYmUgc3F1YXNoZWQgaW50byAxLzUgaWYgYWNrZWQuCiAKIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2ludGVycnVwdC1jb250cm9sbGVyL3JlYWx0ZWsscnRkMTE5eC1tdXgudHh0ICAgIHwgMiAr
KwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yZWFsdGVrLHJ0
ZDExOXgtbXV4LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1
cHQtY29udHJvbGxlci9yZWFsdGVrLHJ0ZDExOXgtbXV4LnR4dAppbmRleCBmMzljZTM0MWFkYmQu
LjY3YmUwNjUzNTI4YiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2ludGVycnVwdC1jb250cm9sbGVyL3JlYWx0ZWsscnRkMTE5eC1tdXgudHh0CisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yZWFs
dGVrLHJ0ZDExOXgtbXV4LnR4dApAQCAtNCw2ICs0LDggQEAgUmVhbHRlayBSVEQxMTl4LzEyOXgg
SVJRIE11eCBDb250cm9sbGVyCiBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogCiAtIGNvbXBhdGlibGUg
ICAgICAgICAgIDogIFNob3VsZCBiZSBvbmUgb2YgdGhlIGZvbGxvd2luZzoKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgLSAicmVhbHRlayxydGQxMTk1LW1pc2MtaXJxLW11eCIKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgLSAicmVhbHRlayxydGQxMTk1LWlzby1pcnEtbXV4IgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAtICJyZWFsdGVrLHJ0ZDEyOTUtbWlzYy1pcnEtbXV4IgogICAg
ICAgICAgICAgICAgICAgICAgICAgICAtICJyZWFsdGVrLHJ0ZDEyOTUtaXNvLWlycS1tdXgiCiAt
IHJlZyAgICAgICAgICAgICAgICAgIDogIFNwZWNpZmllcyBiYXNlIHBoeXNpY2FsIGFkZHJlc3Mg
YW5kIHNpemUgb2YgdGhlIHJlZ2lzdGVycy4KLS0gCjIuMTMuNgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBs
aXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
