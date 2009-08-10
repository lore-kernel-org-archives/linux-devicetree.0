From: Artem Bityutskiy <dedekind-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] mtd/maps: add mtd-ram support to physmap_of
Date: Mon, 10 Aug 2009 19:25:56 +0300
Message-ID: <1249921556.19638.16.camel@localhost>
References: <1247834363-28198-1-git-send-email-w.sang@pengutronix.de>
	<fa686aa40908072243x56d2160fk688149f4b7b912ae@mail.gmail.com>
	<1249795043.9157.37.camel@localhost>
	<20090810161942.GA27833@pengutronix.de>
Reply-To: dedekind-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20090810161942.GA27833-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Vitaly Wool <vwool-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, Albrecht =?ISO-8859-1?Q?Dre=DF?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ken MacLeod <ken-VbOJbV3qneKf+c8Povm/Gg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCAyMDA5LTA4LTEwIGF0IDE4OjE5ICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6Cj4g
T24gU3VuLCBBdWcgMDksIDIwMDkgYXQgMDg6MTc6MjNBTSArMDMwMCwgQXJ0ZW0gQml0eXV0c2tp
eSB3cm90ZToKPiA+IE9uIEZyaSwgMjAwOS0wOC0wNyBhdCAyMzo0MyAtMDYwMCwgR3JhbnQgTGlr
ZWx5IHdyb3RlOgo+ID4gPiBPbiBGcmksIEp1bCAxNywgMjAwOSBhdCA2OjM5IEFNLCBXb2xmcmFt
IFNhbmc8dy5zYW5nQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiA+ID4gPiBVc2UgcGh5c21hcF9v
ZiB0byBhY2Nlc3MgUkFNcyBhcyBtdGQgYW5kIGFkZCBkb2N1bWVuYXRpb24gZm9yIGl0LiBUaGlz
IGFwcHJvYWNoCj4gPiA+ID4gaXMgYSBsb3QgbGVzcyBpbnRydXNpdmUgYXMgYWRkaW5nIGFuIG9m
LXdyYXBwZXIgYXJvdW5kIHBsYXQtcmFtLmMuIEFzIG1vc3QKPiA+ID4gPiBleHRlbnNpb25zIG9m
IHBsYXQtcmFtLmMgKGUuZy4gY3VzdG9tIG1hcC1mdW5jdGlvbnMpIGNhbid0IGJlIG1hcHBlZCB0
byB0aGUKPiA+ID4gPiBkZXZpY2UgdHJlZSBhbnlob3csIGV4dGVuZGluZyBwaHlzbWFwX29mIHNl
ZW1zIHRvIGJlIHRoZSBjbGVhbmVzdCBhcHByb2FjaC4KPiA+ID4gPgo+ID4gPiA+IFRlc3RlZCB3
aXRoIGEgcGh5Q09SRS1NUEM1MTIxZS4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFdv
bGZyYW0gU2FuZyA8dy5zYW5nQHBlbmd1dHJvbml4LmRlPgo+ID4gPiAKPiA+ID4gTG9va3MgZ29v
ZCB0byBtZS4KPiA+ID4gCj4gPiA+IEFja2VkLWJ5OiBHcmFudCBMaWtlbHkgPGdyYW50Lmxpa2Vs
eUBzZWNyZXRsYWIuY2E+Cj4gPiAKPiA+IFRoaXMgcGF0Y2ggaXMgc2l0dGluZyBpbiBteSBsMi1t
dGQtMi42LmdpdCB0cmVlLgo+IAo+IEdyZWF0LCB0aGFua3MgYSBsb3QgKGFuZCBmb3IgeW91ciBs
Mi10cmVlIGluIGdlbmVyYWwhKS4gT25lIHF1ZXN0aW9uOiBBcmUgdGhlCj4gYWRkaXRpb25hbCBB
Y2tlZC1ieXMgYWRkZWQgbGF0ZXI/IEkgY291bGQgdGhpbmsgdGhleSBtaWdodCBiZSB1c2VmdWwg
Zm9yCj4gRGF2aWQncyByZXZpZXcuLi4KCldlbGwsIEkgZG8gbm90IGJvdGhlciBtYWludGFpbmlu
ZyBuaWNlIGhpc3RvcnkgdGhlcmUsIHNvIHJlYmFzZSBpdApmcmVlbHksIHdoaWNoIG1lYW5zIEkg
Y2FuIGFkZCB5b3VyIGFjay4gV2lsbCBkbyB0b21vcnJvdy4KCi0tIApCZXN0IFJlZ2FyZHMsCkFy
dGVtIEJpdHl1dHNraXkgKNCQ0YDRgtGR0Lwg0JHQuNGC0Y7RhtC60LjQuSkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRldmljZXRyZWUtZGlzY3VzcyBt
YWlsaW5nIGxpc3QKZGV2aWNldHJlZS1kaXNjdXNzQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9s
aXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2RldmljZXRyZWUtZGlzY3Vzcwo=
