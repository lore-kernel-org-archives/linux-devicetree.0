From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 01/11] Documentation: devicetree: Add vendor prefix for
 Actions Semi
Date: Wed, 15 Feb 2017 17:55:18 +0100
Message-ID: <20170215165528.10052-2-afaerber@suse.de>
References: <20170215165528.10052-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170215165528.10052-1-afaerber@suse.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, support@lemaker.org, devicetree@vger.kernel.org, info@ucrobotics.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, mp-cs@actions-semi.com, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, contact@linux-xapple.org
List-Id: devicetree@vger.kernel.org

QWN0aW9ucyBTZW1pY29uZHVjdG9yIHdhcyBsaXN0ZWQgb24gTkFTREFRIGFzIEFDVFMgdW50aWwg
RGVjIDE2LCAyMDE2LgoKQ2M6IG1wLWNzQGFjdGlvbnMtc2VtaS5jb20KU2lnbmVkLW9mZi1ieTog
QW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgotLS0KIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMudHh0IHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMudHh0CmluZGV4IDFlNGU4NGUuLjMwNjljNmYgMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMu
dHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4
ZXMudHh0CkBAIC02LDYgKzYsNyBAQCB1c2luZyB0aGVtIHRvIGF2b2lkIG5hbWUtc3BhY2UgY29s
bGlzaW9ucy4KIGFiY24JQWJyYWNvbiBDb3Jwb3JhdGlvbgogYWJpbGlzCUFiaWxpcyBTeXN0ZW1z
CiBhY3RpdmUtc2VtaQlBY3RpdmUtU2VtaSBJbnRlcm5hdGlvbmFsIEluYworYWN0cwlBY3Rpb25z
IFNlbWljb25kdWN0b3IgQ28uLCBMdGQuCiBhZAlBdmlvbmljIERlc2lnbiBHbWJICiBhZGFwdGV2
YQlBZGFwdGV2YSwgSW5jLgogYWRoCUFEIEhvbGRpbmdzIFBsYy4KLS0gCjIuMTAuMgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
