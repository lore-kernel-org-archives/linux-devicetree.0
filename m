From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v4 1/5] fsl-diu-fb: fix issue with re-enabling DIU area
	descriptor
Date: Wed, 28 Jul 2010 09:56:55 +0200
Message-ID: <20100728095655.0e1c81eb@wker>
References: <1279893639-24333-1-git-send-email-agust@denx.de>
	<1279893639-24333-2-git-send-email-agust@denx.de>
	<AANLkTikkLVCxU4ZC_nmUhKTQogUNeQzxOX6KqgZcxiYr@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTikkLVCxU4ZC_nmUhKTQogUNeQzxOX6KqgZcxiYr-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyOCBKdWwgMjAxMCAwMTowMjo1OSAtMDYwMApHcmFudCBMaWtlbHkgPGdyYW50Lmxp
a2VseUBzZWNyZXRsYWIuY2E+IHdyb3RlOgouLi4KPiA+IMKgZHJpdmVycy92aWRlby9mc2wtZGl1
LWZiLmMgfCDCoCAzOCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ID4g
wqAxIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZzbC1kaXUtZmIuYyBiL2RyaXZlcnMvdmlk
ZW8vZnNsLWRpdS1mYi5jCj4gPiBpbmRleCAyNzQ1NWNlLi45YjhjOTkxIDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy92aWRlby9mc2wtZGl1LWZiLmMKPiA+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZnNs
LWRpdS1mYi5jCj4gPiBAQCAtMzE3LDYgKzMxNywxNyBAQCBzdGF0aWMgdm9pZCBmc2xfZGl1X2Zy
ZWUodm9pZCAqdmlydCwgc2l6ZV90IHNpemUpCj4gPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZy
ZWVfcGFnZXNfZXhhY3QodmlydCwgc2l6ZSk7Cj4gPiDCoH0KPiA+Cj4gPiArLyoKPiA+ICsgKiBX
b3JrYXJvdW5kIGZvciBmYWlsZWQgd3JpdGluZyBkZXNjIHJlZ2lzdGVyIG9mIHBsYW5lcy4KPiA+
ICsgKiBOZWVkZWQgd2l0aCBNUEM1MTIxIERJVSByZXYgMi4wIHNpbGljb24uCj4gPiArICovCj4g
PiArdm9pZCB3cl9yZWdfd2EodTMyICpyZWcsIHUzMiB2YWwpCj4gPiArewo+ID4gKyDCoCDCoCDC
oCBkbyB7Cj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG91dF9iZTMyKHJlZywgdmFsKTsKPiA+
ICsgwqAgwqAgwqAgfSB3aGlsZSAoaW5fYmUzMihyZWcpICE9IHZhbCk7Cj4gPiArfQo+IAo+IEkn
bGwgYXBwbHkgdGhpcyBvbmUsIGJ1dCBpdCBsb29rcyBsaWtlIGEgcG90ZW50aWFsIHByb2JsZW0u
ICBXaGF0Cj4gaGFwcGVucyBpZiB0aGUgd3JpdGUgbmV2ZXIgc3VjY2VlZHM/ICBUaGUga2VybmVs
IHRoZW4gZ2V0cyBzdHVjayBpbiBhCj4gZm9yZXZlciBidXN5IGxvb3AuICBZb3Ugc2hvdWxkIGxv
b2sgYXQgcmV3b3JraW5nIGl0LgoKSSdsbCBzdWJtaXQgYW4gaW5jcmVtZW50YWwgcGF0Y2ggdGhh
dCBwcmV2ZW50cyBsb29waW5nIGZvcmV2ZXIgaW4KdGhlIGNhc2UgaWYgdGhlIHdyaXRlIG5ldmVy
IHN1Y2NlZWRzLiBUaGFua3MhCgpBbmF0b2xpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkZXZpY2V0cmVlLWRpc2N1c3MgbWFpbGluZyBsaXN0CmRldmlj
ZXRyZWUtZGlzY3Vzc0BsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9kZXZpY2V0cmVlLWRpc2N1c3MK
