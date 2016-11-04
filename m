From: Meng Yi <meng.yi@nxp.com>
Subject: RE: [PATCH v5] drm/fsl-dcu: Implement gamma_lut atomic crtc properties
Date: Fri, 4 Nov 2016 06:42:04 +0000
Message-ID: <DB6PR0401MB26313384936AF862EC5A8D10ECA20@DB6PR0401MB2631.eurprd04.prod.outlook.com>
References: <1475051069-24452-1-git-send-email-meng.yi@nxp.com>
 <2e4a55f00c57b094e376a743d7b056f7@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2e4a55f00c57b094e376a743d7b056f7@agner.ch>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stefan Agner <stefan@agner.ch>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgU3RlZmFuLAoKPiAKPiBIb3cgZGlkIHlvdSBhY3R1YWxseSB0ZXN0IHRoYXQ/IEkgaGF2ZSBh
IGhhcmQgdGltZSB0byBnZXQgYW55dGhpbmcgdXNlYWJsZSB3aXRoCj4gdGhpcyBjb2RlLgo+IAo+
IFRoZSBkaXNwbGF5IGxvb2tzIGNvbXBsZXRlbHkgYm9ya2VkIChjb2xvcnMgYXJlIHdheSBvZmYs
IGFuZCBhdCByYW5kb20gZWl0aGVyCj4gdG9vIGRhcmsgb3IgdG9vIGJyaWdodCkuCj4gCj4gSSB0
aGVuIGFsc28gYWRkZWQgR2FtbWEgMS4wIChhbmQgZGlmZmVyZW50IHZhbHVlcykgdG8gdGhlIE1v
bml0b3Igc2VjdGlvbiBvZgo+IHhvcmcuY29uZiwgYnV0IHN0aWxsIG5vdCByZWFsbHkgdXNhYmxl
Lgo+IAoKSSBqdXN0IGRpZCBmZXcgbW9yZSB0ZXN0IHVzaW5nIGxpYmRybSB3aGljaCBoYWQgYmVl
biBtb2RpZmllZCBmb3IgdGVzdGluZyBnYW1tYS4gCkFuZCBJIGZpbmQgeW91IGFyZSByaWdodC4g
SXQncyBteSBuZWdsaWdlbmNlIHRoYXQganVzdCB0ZXN0ZWQgb25lIGNhc2UgZm9yIGdhbW1hIHVz
aW5nIGFsbCAweGZmOwoKCi4uLi4uCgo+ID4gIAkJCWRybV9jcnRjX3NlbmRfdmJsYW5rX2V2ZW50
KGNydGMsIGV2ZW50KTsKPiA+ICAJCXNwaW5fdW5sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9s
b2NrKTsKPiA+ICAJfQo+ID4gKwo+ID4gKwlpZiAoY3J0Yy0+c3RhdGUtPmNvbG9yX21nbXRfY2hh
bmdlZCAmJiBjcnRjLT5zdGF0ZS0+Z2FtbWFfbHV0KQo+ID4gKwkJZnNsX2NydGNfZ2FtbWFfc2V0
KGNydGMsIChzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqKQo+ID4gKwkJCQkgICBjcnRjLT5zdGF0ZS0+
Z2FtbWFfbHV0LT5kYXRhLCAyNTYpOwo+IAo+IFNvIHRoaXMgaXMgY2FsbGVkIHdoaWxlIHRoZSBD
UlRDIGlzIGVuYWJsZWQuIE90aGVycyBkbyBpdCB0aGVyZSB0b28sIGJ1dCBJIHRoaW5rIGluCj4g
b3VyIGNhc2Ugd2Ugc2hvdWxkIG5vdC4gVGhlIHJlZmVyZW5jZSBtYW51YWwgc2F5czoKPiAKPiAi
VGhlIGdhbW1hIHRhYmxlIGNhbiBvbmx5IGJlIHJlYWQgb3Igd3JpdHRlbiB3aGVuIHRoZSAyRC1B
Q0UgaXMgbm90IGVuYWJsZWQKPiBvciBkdXJpbmcgdGhlIHZlcnRpY2FsIGJsYW5raW5nIHBlcmlv
ZC4iCj4gCgpZZXMsIG5vdyBnYW1tYSBjb3JyZWN0aW9uIGZ1bmN0aW9uIGJlaGF2aW9yIHdlaXJk
LgpXaGVuIHNldHRpbmcgZ2FtbWEgdGFibGUgd2l0aGluIGNydGMgZW5hYmxlIGR1cmluZyBpbml0
aWFsaXppbmcsIGl0IHdvcmtzIGNvcnJlY3RseS4gQW5kIG5vdCByaWdodCBkdXJpbmcgcnVudGlt
ZSBzbyBmYXIuCgoKVGhhbmtzLApNZW5nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
