From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/4] DW DMAC: rename is_private property as ordered by
 DT policy
Date: Wed, 16 Nov 2016 17:11:11 +0200
Message-ID: <1479309071.24056.41.camel@linux.intel.com>
References: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1479304615-11360-2-git-send-email-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1479304615-11360-2-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, vinod.koul@intel.com, vireshk@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, dmaengine@vger.kernel.org, dan.j.williams@intel.com, linux-snps-arc@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE2LTExLTE2IGF0IDE2OjU2ICswMzAwLCBFdWdlbml5IFBhbHRzZXYgd3JvdGU6
Cj4gUmVuYW1lIGlzX3ByaXZhdGUgdG8gaXMtcHJpdmF0ZSBhcyBvcmRlcmVkIGJ5IERUIHBvbGlj
eS4KPiBUaGUgY2hhbmdlIGxlYXZlcyB0aGUgc3VwcG9ydCBmb3IgdGhlIG9sZCBmb3JtYXQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogRXVnZW5peSBQYWx0c2V2IDxFdWdlbml5LlBhbHRzZXZAc3lub3Bz
eXMuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9kbWEvZHcvcGxhdGZvcm0uYyB8IDIgKysKPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9k
bWEvZHcvcGxhdGZvcm0uYyBiL2RyaXZlcnMvZG1hL2R3L3BsYXRmb3JtLmMKPiBpbmRleCA1YmRh
MGViLi40MTAzZjFkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1hL2R3L3BsYXRmb3JtLmMKPiAr
KysgYi9kcml2ZXJzL2RtYS9kdy9wbGF0Zm9ybS5jCj4gQEAgLTEyOCw2ICsxMjgsOCBAQCBkd19k
bWFfcGFyc2VfZHQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiDCoAo+IMKgCWlmIChv
Zl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJpc19wcml2YXRlIikpCj4gwqAJCXBkYXRhLT5pc19w
cml2YXRlID0gdHJ1ZTsKPiArCWVsc2UgaWYgKG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImlz
LXByaXZhdGUiKSkKPiArCQlwZGF0YS0+aXNfcHJpdmF0ZSA9IHRydWU7CgpGaXJzdCwgdHJ5IG5l
dyBvbmUsIHRoZW4gZmFsbCBiYWNrLgoKPiDCoAo+IMKgCWlmICghb2ZfcHJvcGVydHlfcmVhZF91
MzIobnAsICJjaGFuX2FsbG9jYXRpb25fb3JkZXIiLCAmdG1wKSkKPiDCoAkJcGRhdGEtPmNoYW5f
YWxsb2NhdGlvbl9vcmRlciA9ICh1bnNpZ25lZCBjaGFyKXRtcDsKCi0tIApBbmR5IFNoZXZjaGVu
a28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KSW50ZWwgRmlubGFuZCBPeQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25w
cy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYw==
