From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] of: fix a build error to f_graph_get_endpoint_by_regs function
Date: Tue, 23 Jun 2015 15:14:53 +0900
Message-ID: <1435040094-22793-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: devicetree@vger.kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, sfr@canb.auug.org.au, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBmaXhlcyB0aGUgYmVsb3cgYnVpbGQgZXJyb3IgcmVwb3J0ZWQgYnkgU3RlcGhl
biwKCWh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE1LzYvMjIvNjY1CgpUbyBmaXggdGhlIGVycm9y
LCB0aGlzIHBhdGNoIGRlY2xhcmVzIG9mX2dyYXBoX2dldF9lbmRwb2ludF9ieV9yZWdzIGZ1bmN0
aW9uCndpdGggInN0YXRpYyBpbmxpbmUiLgoKU2lnbmVkLW9mZi1ieTogSW5raSBEYWUgPGlua2ku
ZGFlQHNhbXN1bmcuY29tPgotLS0KIGluY2x1ZGUvbGludXgvb2ZfZ3JhcGguaCB8ICAgIDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvb2ZfZ3JhcGguaCBiL2luY2x1ZGUvbGludXgvb2ZfZ3JhcGguaApp
bmRleCAxYzFkNWI5Li5mOGJjZDBlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L29mX2dyYXBo
LmgKKysrIGIvaW5jbHVkZS9saW51eC9vZl9ncmFwaC5oCkBAIC03MSw3ICs3MSw3IEBAIHN0YXRp
YyBpbmxpbmUgc3RydWN0IGRldmljZV9ub2RlICpvZl9ncmFwaF9nZXRfbmV4dF9lbmRwb2ludCgK
IAlyZXR1cm4gTlVMTDsKIH0KIAotc3RydWN0IGRldmljZV9ub2RlICpvZl9ncmFwaF9nZXRfZW5k
cG9pbnRfYnlfcmVncygKK3N0YXRpYyBpbmxpbmUgc3RydWN0IGRldmljZV9ub2RlICpvZl9ncmFw
aF9nZXRfZW5kcG9pbnRfYnlfcmVncygKIAkJY29uc3Qgc3RydWN0IGRldmljZV9ub2RlICpwYXJl
bnQsIGludCBwb3J0X3JlZywgaW50IHJlZykKIHsKIAlyZXR1cm4gTlVMTDsKLS0gCjEuNy45LjUK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
