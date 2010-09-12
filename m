From: =?ISO-8859-1?Q?Andr=E9?= Schwarz <andre.schwarz-P0pTl12WyEgpBod+wgzj8A@public.gmane.org>
Subject: Re: How to define an I2C-to-SPI bridge device ?
Date: Sun, 12 Sep 2010 17:10:35 +0200
Message-ID: <1284304235.2913.8.camel@swa-e6500>
References: <1283502979.17812.22.camel@swa-m460>
	<20100903120858.GA19380@oksana.dev.rtsoft.ru>
	<4C84D334.6060008@matrix-vision.de>
	<c843f864-2a5a-4146-bd95-13c2fb91f430@email.android.com>
	<1284106293.2267.42.camel@swa-m460>
	<20100910173706.GD11284@angua.secretlab.ca>
	<1284142484.2152.18.camel@swa-e6500>
	<20100910182815.GH11284@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100910182815.GH11284-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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
Cc: LinuxPPC List <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, DevTreeDiscuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

R3JhbnQsIEFudG9uLAoKW3NuaXBdCgo+ID4gCj4gPiBEb2luZyB0aGlzIGluIHBhcmFsbGVsIHdp
bGwgc3BlZWQgdGhpbmdzIHVwIHNpZ25pZmljYW50bHkuCj4gCj4gWWVhaDsgVGhlbiBJIHdvdWxk
IGhhbmRsZSBpdCBhcyBhIHNlcGFyYXRlIGNzIyBhbmQgbWFwIGl0IHRvIGVuYWJsaW5nCj4gbXVs
dGlwbGUgQ1MgbGluZXMgYXQgYSB0aW1lLgoKc291bmRzIHJlYXNvbmFibGUgLSB3aWxsIGRvIGl0
IHRoYXQgd2F5LgoKPiAKPiA+IEJUVzogd291bGQgImRyaXZlcnMvbWlzYyIgYmUgYSBwcm9wZXIg
bG9jYXRpb24gPwo+ID4gV2hvJ3Mgc3VwcG9zZWQgdG8gcGljayB0aGF0IGRyaXZlciB1cCBhbmQg
b24gd2hhdCBsaXN0IHNoYWxsIEkgcG9zdCBpdAo+ID4gZm9yIHJldmlldyA/Cj4gCj4gWW91IHNo
b3VsZCBjYyBzcGktZGV2ZWwtZ2VuZXJhbCwgYW5kIGZlZWwgZnJlZSB0byBjYyBtZS4gIGRyaXZl
cnMvbWlzYwo+IHdvdWxkIHByb2JhYmx5IGJlIGFuIG9rYXkgcGxhY2UgZm9yIGl0IHRvIGxpdmU7
IGJ1dCBpZiBpdCBvbmx5IGFwcGVhcnMKPiBvbiBhIHNpbmdsZSBtYWNoaW5lLCB0aGVuIGl0IG1h
eSBtYWtlIG1vcmUgc2Vuc2UgaW4KPiBhcmNoLyovPGJvYXJkLWRpcmVjdG9yeT4uICBXaGF0IGFy
Y2ggb3IgU29DIGlzIHRoaXMgcnVubmluZyBvbj8KCgpvayAtIGN1cnJlbnRseSBJJ20gcHJlcGFy
aW5nIGJyaW5nIHVwIG9mIGEgTVBDODM3NyBiYXNlZCBzeXN0ZW0uCkJ1dCB3ZSBoYXZlIHRoaXMg
Y2hpcHMgb24gbXVsdGlwbGUgYm9hcmRzIGFuZCBhbHNvIG9uIGdlbmVyaWMgUENJZQpncmFiYmVy
IGNhcmRzIHJ1bm5pbmcgb24gYW55IGRlc2t0b3AgUEMuCgpTaW5jZSB3ZSBjb3VsZCB1c2UgdGhl
IGRyaXZlciBkaXJlY3RseSBhZnRlciByZWdpc3RlcmluZyB0aGUgdmFyaW91cyBJMkMKbWFzdGVy
cyBJJ2QgcHJlZmVyIHRvIGdvIHdpdGggZHJpdmVycy9taXNjLiBBZnRlciBhbGwgaXQncyBhIHNp
bXBsZSBJMkMKc2xhdmUgZGV2aWNlIHVzYWJsZSBieSBhbnlvbmUgLi4uCgoKV2lsbCBzZW5kIGFu
IGluaXRpYWwgcGF0Y2ggZm9yIHJldmlldyBhZnRlciBiYXNpYyB2ZXJpZmljYXRpb24gd2l0aCBy
ZWFsCmhhcmR3YXJlLgoKClRoYW5rcyBmb3IgeW91ciBoZWxwLgoKQ2hlZXJzLApBbmRyw6kKCgoK
Ck1BVFJJWCBWSVNJT04gR21iSCwgVGFsc3RyYXNzZSAxNiwgREUtNzE1NzAgT3BwZW53ZWlsZXIK
UmVnaXN0ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodCBTdHV0dGdhcnQsIEhSQiAyNzEwOTAKR2VzY2hh
ZWZ0c2Z1ZWhyZXI6IEdlcmhhcmQgVGh1bGxuZXIsIFdlcm5lciBBcm1pbmdlb24sIFV3ZSBGdXJ0
bmVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRldmlj
ZXRyZWUtZGlzY3VzcyBtYWlsaW5nIGxpc3QKZGV2aWNldHJlZS1kaXNjdXNzQGxpc3RzLm96bGFi
cy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2RldmljZXRyZWUtZGlzY3Vz
cwo=
