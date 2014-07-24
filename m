From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 04/11] ARM: dts: zynq: Update deprecated xuartps clock names
Date: Fri, 25 Jul 2014 01:00:13 +0200
Message-ID: <1406242820-20140-5-git-send-email-afaerber@suse.de>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1406242820-20140-1-git-send-email-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Andreas Olofsson <andreas@adapteva.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QXZvaWRzIGRlcHJlY2F0aW9uIHdhcm5pbmcgbWVzc2FnZXMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Ci0tLQogdjI6IE5ldwogCiBhcmNoL2FybS9i
b290L2R0cy96eW5xLTcwMDAuZHRzaSB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy96
eW5xLTcwMDAuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3p5bnEtNzAwMC5kdHNpCmluZGV4IDc2
MGJiYzQuLjhmZDgyNmEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3p5bnEtNzAwMC5k
dHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3p5bnEtNzAwMC5kdHNpCkBAIC0xMDgsNyArMTA4
LDcgQEAKIAkJCWNvbXBhdGlibGUgPSAieGxueCx4dWFydHBzIjsKIAkJCXN0YXR1cyA9ICJkaXNh
YmxlZCI7CiAJCQljbG9ja3MgPSA8JmNsa2MgMjM+LCA8JmNsa2MgNDA+OwotCQkJY2xvY2stbmFt
ZXMgPSAicmVmX2NsayIsICJhcGVyX2NsayI7CisJCQljbG9jay1uYW1lcyA9ICJ1YXJ0X2NsayIs
ICJwY2xrIjsKIAkJCXJlZyA9IDwweEUwMDAwMDAwIDB4MTAwMD47CiAJCQlpbnRlcnJ1cHRzID0g
PDAgMjcgND47CiAJCX07CkBAIC0xMTcsNyArMTE3LDcgQEAKIAkJCWNvbXBhdGlibGUgPSAieGxu
eCx4dWFydHBzIjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQljbG9ja3MgPSA8JmNsa2Mg
MjQ+LCA8JmNsa2MgNDE+OwotCQkJY2xvY2stbmFtZXMgPSAicmVmX2NsayIsICJhcGVyX2NsayI7
CisJCQljbG9jay1uYW1lcyA9ICJ1YXJ0X2NsayIsICJwY2xrIjsKIAkJCXJlZyA9IDwweEUwMDAx
MDAwIDB4MTAwMD47CiAJCQlpbnRlcnJ1cHRzID0gPDAgNTAgND47CiAJCX07Ci0tIAoxLjkuMwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK
