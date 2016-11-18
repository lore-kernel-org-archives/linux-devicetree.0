From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/2] DW DMAC: enable memory-to-memory transfers support
Date: Fri, 18 Nov 2016 19:46:58 +0200
Message-ID: <1479491218.22212.37.camel@linux.intel.com>
References: <1479487989-24543-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1479487989-24543-2-git-send-email-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1479487989-24543-2-git-send-email-Eugeniy.Paltsev@synopsys.com>
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
Cc: mark.rutland@arm.com, vinod.koul@intel.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, dmaengine@vger.kernel.org, linux-snps-arc@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAyMDE2LTExLTE4IGF0IDE5OjUzICswMzAwLCBFdWdlbml5IFBhbHRzZXYgd3JvdGU6
Cj4gQWxsIGtub3duIGRldmljZXMsIHdoaWNoIHVzZSBEVCBmb3IgY29uZmlndXJhdGlvbiwgc3Vw
cG9ydAo+IG1lbW9yeS10by1tZW1vcnkgdHJhbnNmZXJzLiBTbyBlbmFibGUgaXQgYnkgZGVmYXVs
dCwgaWYgd2UgcmVhZAo+IGNvbmZpZ3VyYXRpb24gZnJvbSBEVC4KPiAKCkFja2VkLWJ5OiBBbmR5
IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KCj4gU2lnbmVk
LW9mZi1ieTogRXVnZW5peSBQYWx0c2V2IDxFdWdlbml5LlBhbHRzZXZAc3lub3BzeXMuY29tPgo+
IC0tLQo+IMKgZHJpdmVycy9kbWEvZHcvcGxhdGZvcm0uYyB8IDYgKysrKysrCj4gwqAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hL2R3
L3BsYXRmb3JtLmMgYi9kcml2ZXJzL2RtYS9kdy9wbGF0Zm9ybS5jCj4gaW5kZXggNWJkYTBlYi4u
YWE3YTVjMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS9kdy9wbGF0Zm9ybS5jCj4gKysrIGIv
ZHJpdmVycy9kbWEvZHcvcGxhdGZvcm0uYwo+IEBAIC0xMjksNiArMTI5LDEyIEBAIGR3X2RtYV9w
YXJzZV9kdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+IMKgCWlmIChvZl9wcm9wZXJ0
eV9yZWFkX2Jvb2wobnAsICJpc19wcml2YXRlIikpCj4gwqAJCXBkYXRhLT5pc19wcml2YXRlID0g
dHJ1ZTsKPiDCoAo+ICsJLyoKPiArCcKgKiBBbGwga25vd24gZGV2aWNlcywgd2hpY2ggdXNlIERU
IGZvciBjb25maWd1cmF0aW9uLCBzdXBwb3J0Cj4gKwnCoCogbWVtb3J5LXRvLW1lbW9yeSB0cmFu
c2ZlcnMuIFNvIGVuYWJsZSBpdCBieSBkZWZhdWx0Lgo+ICsJwqAqLwo+ICsJcGRhdGEtPmlzX21l
bWNweSA9IHRydWU7Cj4gKwo+IMKgCWlmICghb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJjaGFu
X2FsbG9jYXRpb25fb3JkZXIiLCAmdG1wKSkKPiDCoAkJcGRhdGEtPmNoYW5fYWxsb2NhdGlvbl9v
cmRlciA9ICh1bnNpZ25lZCBjaGFyKXRtcDsKPiDCoAoKLS0gCkFuZHkgU2hldmNoZW5rbyA8YW5k
cml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPgpJbnRlbCBGaW5sYW5kIE95CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBt
YWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJj
