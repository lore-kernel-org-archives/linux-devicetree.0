From: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH 1/3 v3] mtd: physmap_of: Add multiple regions and
	concatenation support
Date: Thu, 16 Apr 2009 16:51:39 +0300
Message-ID: <1239889899.3390.216.camel@localhost.localdomain>
References: <1239883845-17804-1-git-send-email-sr@denx.de>
	<fa686aa40904160626k118cea3cvc0db38a2277e45b8@mail.gmail.com>
	<200904161537.59048.sr@denx.de>
	<fa686aa40904160646v75a98e02s446fd89c08cfebae@mail.gmail.com>
Reply-To: dedekind@infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org>
In-Reply-To: <fa686aa40904160646v75a98e02s446fd89c08cfebae@mail.gmail.com>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linuxppc-dev@ozlabs.org, Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDA5LTA0LTE2IGF0IDA3OjQ2IC0wNjAwLCBHcmFudCBMaWtlbHkgd3JvdGU6Cj4g
T24gVGh1LCBBcHIgMTYsIDIwMDkgYXQgNzozNyBBTSwgU3RlZmFuIFJvZXNlIDxzckBkZW54LmRl
PiB3cm90ZToKPiA+IE9uIFRodXJzZGF5IDE2IEFwcmlsIDIwMDksIEdyYW50IExpa2VseSB3cm90
ZToKPiA+PiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBSb2VzZSA8c3JAZGVueC5kZT4KPiA+PiA+
IFJldmlld2QtYnk6IEdyYW50IExpa2VseSA8Z3JhbnQubGlrZWx5QHNlY3JldGxhYi5jYT4KPiA+
Pgo+ID4+IFl1cCwgc3RpbGwgbG9va3MgZ29vZCB0byBtZS4gIFdoYXQgYm9hcmRzIGhhcyB0aGlz
IGJlZW4gdGVzdGVkIG9uPwo+ID4KPiA+IEkgdGVzdGVkIHRoaXMgdmVyc2lvbiBvbiBQUEM0MDVF
WCBLaWxhdWVhIGVxdWlwcGVkIG9ubHkgb25lICJzdGFuZGFyZCIKPiA+IFNwYW5zaW9uIFMyOUdM
NTEyIE5PUiBjaGlwLiBBbmQgYSBzbGlnaHRseSBtb2RpZmllZCB2ZXJzaW9uIG9uIGFuIE1QQzgz
NjAKPiA+IGJvYXJkIChrbWV0ZXIxKSB3aGljaCBpcyBlcXVpcHBlZCB3aXRoIHRoZSBJbnRlbCBQ
MzAgcGFydCBtZW50aW9uZWQgaW4gdGhlCj4gPiBiaW5kaW5ncyBkZXNjcmlwdGlvbi4gU2xpZ2h0
bHkgbW9kaWZpZWQgc2luY2UgdGhpcyBib2FyZCBzdXBwb3J0IGlzIG5vdCB5ZXQKPiA+IHB1c2hl
ZCB1cHN0cmVhbSBhbmQgY3VycmVudGx5IHVzaW5nIHYyLjYuMjggKHBoeXNtYXBfb2YuYyBoYXMg
cmVjZWl2ZWQgbWlub3IKPiA+IG1vZGlmaWNhdGlvbnMgYWZ0ZXIgMi42LjI4IHJlbGVhc2UpLgo+
IAo+IE9rYXkuICBJdCB3aWxsIGJlIGdvb2QgdG8gZ2V0IHRoaXMgb25lIGludG8gLW5leHQgZm9y
IHNvbWUgdGVzdGluZwo+IGV4cG9zdXJlLiAgVW5sZXNzIGhlIGFza3MgbWUgdG8gZG8gb3RoZXJ3
aXNlLCBJJ2xsIGxlYXZlIHRoaXMgb25lIHRvCj4gRGF2aWQgdG8gcGljayB1cC4KCkRhdmlkIHVz
dWFsbHkgcGlja3MgdXAgc3R1ZmYganVzdCBiZWZvcmUgb3IgZHVyaW5nIG1lcmdlIHdpbmRvdywK
c28gaWYgeW91IHdhbnQgbGludXgtbmV4dCBleHBvc3VyZSwgeW91IG5lZWQgdG8gaGF2ZSBzb21l
IGV4dHJhCmNhcmUuCgotLSAKQmVzdCByZWdhcmRzLApBcnRlbSBCaXR5dXRza2l5ICjQkdC40YLR
jtGG0LrQuNC5INCQ0YDRgtGR0LwpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eHBwYy1kZXYgbWFpbGluZyBsaXN0CkxpbnV4cHBjLWRldkBvemxh
YnMub3JnCmh0dHBzOi8vb3psYWJzLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4cHBjLWRldg==
