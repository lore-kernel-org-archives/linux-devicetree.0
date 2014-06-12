From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv4 5/5] mtd: gpmi: prevent creating a new BBT when blockmark
 swapping is disabled
Date: Thu, 12 Jun 2014 15:20:45 +0200
Message-ID: <1402579245-13377-6-git-send-email-LW@KARO-electronics.de>
References: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-2-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-3-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-4-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-5-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1402579245-13377-5-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Fabio Estevam <fabio.estevam@freescale.com>, Huang Shijie <b32955@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>, Boris BREZILLON <b.brezillon.dev@gmail.com>, Ezequie
List-Id: devicetree@vger.kernel.org

V2l0aG91dCBibG9ja21hcmsgc3dhcHBpbmcsIHRoZXJlIGlzIG5vIHVzZSBpbiBjcmVhdGluZyBh
IEJCVCBmcm9tCnNjcmF0Y2gsIHNvIHVzZSBhIEJCVCBkZXNjcmlwdG9yIHdpdGggTkFORF9CQlRf
Q1JFQVRFIHVuc2V0IGluIHRoaXMKY2FzZS4KClNpZ25lZC1vZmYtYnk6IExvdGhhciBXYcOfbWFu
biA8TFdAS0FSTy1lbGVjdHJvbmljcy5kZT4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL2dwbWktbmFu
ZC9ncG1pLW5hbmQuYyB8ICAgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL2dwbWktbmFuZC9ncG1pLW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQv
Z3BtaS1uYW5kL2dwbWktbmFuZC5jCmluZGV4IDM3NTM3YjQuLmZjNzEwZDcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRk
L25hbmQvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCkBAIC00Myw2ICs0MywyOSBAQCBzdGF0aWMgc3Ry
dWN0IG5hbmRfYmJ0X2Rlc2NyIGdwbWlfYmJ0X2Rlc2NyID0gewogCS5wYXR0ZXJuCT0gc2Nhbl9m
Zl9wYXR0ZXJuCiB9OwogCitzdGF0aWMgdWludDhfdCBiYnRfcGF0dGVybltdID0geydCJywgJ2In
LCAndCcsICcwJyB9Oworc3RhdGljIHVpbnQ4X3QgbWlycm9yX3BhdHRlcm5bXSA9IHsnMScsICd0
JywgJ2InLCAnQicgfTsKKworc3RhdGljIHN0cnVjdCBuYW5kX2JidF9kZXNjciBiYnRfbWFpbl9u
b19vb2JfZGVzY3IgPSB7CisJLm9wdGlvbnMgPSBOQU5EX0JCVF9MQVNUQkxPQ0sgfCBOQU5EX0JC
VF9XUklURSB8CisJTkFORF9CQlRfMkJJVCB8IE5BTkRfQkJUX1ZFUlNJT04gfCBOQU5EX0JCVF9Q
RVJDSElQIHwKKwlOQU5EX0JCVF9OT19PT0IsCisJLmxlbiA9IDQsCisJLnZlcm9mZnMgPSA0LAor
CS5tYXhibG9ja3MgPSBOQU5EX0JCVF9TQ0FOX01BWEJMT0NLUywKKwkucGF0dGVybiA9IGJidF9w
YXR0ZXJuLAorfTsKKworc3RhdGljIHN0cnVjdCBuYW5kX2JidF9kZXNjciBiYnRfbWlycm9yX25v
X29vYl9kZXNjciA9IHsKKwkub3B0aW9ucyA9IE5BTkRfQkJUX0xBU1RCTE9DSyB8IE5BTkRfQkJU
X1dSSVRFIHwKKwlOQU5EX0JCVF8yQklUIHwgTkFORF9CQlRfVkVSU0lPTiB8IE5BTkRfQkJUX1BF
UkNISVAgfAorCU5BTkRfQkJUX05PX09PQiwKKwkubGVuID0gNCwKKwkudmVyb2ZmcyA9IDQsCisJ
Lm1heGJsb2NrcyA9IE5BTkRfQkJUX1NDQU5fTUFYQkxPQ0tTLAorCS5wYXR0ZXJuID0gbWlycm9y
X3BhdHRlcm4sCit9OworCiAvKgogICogV2UgbWF5IGNoYW5nZSB0aGUgbGF5b3V0IGlmIHdlIGNh
biBnZXQgdGhlIEVDQyBpbmZvIGZyb20gdGhlIGRhdGFzaGVldCwKICAqIGVsc2Ugd2Ugd2lsbCB1
c2UgYWxsIHRoZSAocGFnZSArIE9PQikuCkBAIC0xNzI4LDggKzE3NTEsMTEgQEAgc3RhdGljIGlu
dCBncG1pX25hbmRfaW5pdChzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEgKnRoaXMpCiAJCQljaGlwLT5i
YnRfb3B0aW9ucyB8PSBOQU5EX0JCVF9OT19PT0JfQkJNOwogCiAJCWlmIChvZl9wcm9wZXJ0eV9y
ZWFkX2Jvb2wodGhpcy0+ZGV2LT5vZl9ub2RlLAotCQkJCQkJImZzbCxuby1ibG9ja21hcmstc3dh
cCIpKQorCQkJCQkJImZzbCxuby1ibG9ja21hcmstc3dhcCIpKSB7CiAJCQl0aGlzLT5zd2FwX2Js
b2NrX21hcmsgPSBmYWxzZTsKKwkJCWNoaXAtPmJidF90ZCA9ICZiYnRfbWFpbl9ub19vb2JfZGVz
Y3I7CisJCQljaGlwLT5iYnRfbWQgPSAmYmJ0X21pcnJvcl9ub19vb2JfZGVzY3I7CisJCX0KIAl9
CiAJZGV2X2RiZyh0aGlzLT5kZXYsICJCbG9ja21hcmsgc3dhcHBpbmcgJXNhYmxlZFxuIiwKIAkJ
dGhpcy0+c3dhcF9ibG9ja19tYXJrID8gImVuIiA6ICJkaXMiKTsKLS0gCjEuNy4xMC40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtl
cm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5l
bAo=
