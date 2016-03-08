From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv2 4/8] ARM: dts: imx6-tx6: disable the spi node by default
Date: Tue,  8 Mar 2016 09:04:00 +0100
Message-ID: <1457424244-14549-5-git-send-email-LW@KARO-electronics.de>
References: <1457424244-14549-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1457424244-14549-1-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dan Williams <dan.j.williams@intel.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

VGhlIHNwaWRldiBkcml2ZXIgZG9lc24ndCBsaWtlIHRvIGJlIGluc3RhbnRpYXRlZCB2aWEgYSBu
YWtlZCAnc3BpZGV2Jwpjb21wYXRpYmxlLCB0aG91Z2ggaXQgaXMgdmVyeSBjb252ZW5pZW50IHRv
IGludm9rZSBpdCB0aGlzIHdheSB3aXRob3V0CmEgZGVkaWNhdGVkIFNQSSBkZXZpY2UgZm9yIGJh
c2ljIGZ1bmN0aW9uYWwgdGVzdGluZy4KRGlzYWJsZSB0aGUgc3BpIG5vZGUgYnkgZGVmYXVsdCB0
byBzaWxlbmNlIHRoZSBXQVJOX09OKCkgZnJvbSB0aGUKc3BpZGV2IGRyaXZlciwgYnV0IGxlYXZl
IHRoZSBjb25maWd1cmF0aW9uIGludGFjdCBvdGhlcndpc2UuCgpTaWduZWQtb2ZmLWJ5OiBMb3Ro
YXIgV2HDn21hbm4gPExXQEtBUk8tZWxlY3Ryb25pY3MuZGU+Ci0tLQogYXJjaC9hcm0vYm9vdC9k
dHMvaW14NnFkbC10eDYuZHRzaSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwt
dHg2LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLXR4Ni5kdHNpCmluZGV4IGVjMzc0
ZjUuLjk1MDliNDQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwtdHg2LmR0
c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnFkbC10eDYuZHRzaQpAQCAtMjI0LDcgKzIy
NCw3IEBACiAJCSZncGlvMiAzMCBHUElPX0FDVElWRV9ISUdICiAJCSZncGlvMyAxOSBHUElPX0FD
VElWRV9ISUdICiAJPjsKLQlzdGF0dXMgPSAib2theSI7CisJc3RhdHVzID0gImRpc2FibGVkIjsK
IAogCXNwaWRldjA6IHNwaUAwIHsKIAkJY29tcGF0aWJsZSA9ICJzcGlkZXYiOwotLSAKMi4xLjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCg==
