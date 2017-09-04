From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 3/3] arm64: dts: realtek: Add watchdog node for RTD1295
Date: Tue,  5 Sep 2017 01:16:02 +0200
Message-ID: <20170904231602.29787-4-afaerber@suse.de>
References: <20170904231602.29787-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170904231602.29787-1-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Roc He <hepeng@zidoo.tv>, =?UTF-8?q?=E8=92=8B=E4=B8=BD=E7=90=B4?= <jiang.liqin@geniatech.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

QWRkIHRoZSB3YXRjaGRvZyBub2RlIHRvIHRoZSBSVEQxMjk1IERldmljZSBUcmVlLgoKQWNrZWQt
Ynk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEFuZHJlYXMg
RsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4KLS0tCiBEZXBlbmRzIG9uIHRoZSBwZW5kaW5nIGNs
b2NrIG5vZGVzIHBhdGNoLgogCiB2MSAtPiB2MjogVW5jaGFuZ2VkCiAKIGFyY2gvYXJtNjQvYm9v
dC9kdHMvcmVhbHRlay9ydGQxMjk1LmR0c2kgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVhbHRlay9y
dGQxMjk1LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlYWx0ZWsvcnRkMTI5NS5kdHNpCmlu
ZGV4IGZiYmQ2NDU2MDc5ZS4uZjM5YWI2M2Y4NzlkIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlYWx0ZWsvcnRkMTI5NS5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVh
bHRlay9ydGQxMjk1LmR0c2kKQEAgLTEyMyw2ICsxMjMsMTIgQEAKIAkJCSNpbnRlcnJ1cHQtY2Vs
bHMgPSA8MT47CiAJCX07CiAKKwkJd2F0Y2hkb2dAOTgwMDc2ODAgeworCQkJY29tcGF0aWJsZSA9
ICJyZWFsdGVrLHJ0ZDEyOTUtd2F0Y2hkb2ciOworCQkJcmVnID0gPDB4OTgwMDc2ODAgMHgxMDA+
OworCQkJY2xvY2tzID0gPCZvc2MyN00+OworCQl9OworCiAJCXVhcnQwOiBzZXJpYWxAOTgwMDc4
MDAgewogCQkJY29tcGF0aWJsZSA9ICJzbnBzLGR3LWFwYi11YXJ0IjsKIAkJCXJlZyA9IDwweDk4
MDA3ODAwIDB4NDAwPjsKLS0gCjIuMTMuNQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
