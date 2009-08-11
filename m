From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd/maps: add mtd-ram support to physmap_of
Date: Tue, 11 Aug 2009 08:55:31 +0300
Message-ID: <4A8107D3.4000406@gmail.com>
References: <1247834363-28198-1-git-send-email-w.sang@pengutronix.de>	<fa686aa40908072243x56d2160fk688149f4b7b912ae@mail.gmail.com>	<1249795043.9157.37.camel@localhost>
	<20090810161942.GA27833@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20090810161942.GA27833@pengutronix.de>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: devicetree-discuss@ozlabs.org, Vitaly Wool <vwool@ru.mvista.com>, Artem Bityutskiy <dedekind@infradead.org>, =?UTF-8?B?QWxicmVjaHQgRHJlw58=?= <albrecht.dress@arcor.de>, linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org, Ken MacLeod <ken@bitsko.slc.ut.us>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMDgvMTAvMjAwOSAwNzoxOSBQTSwgV29sZnJhbSBTYW5nIHdyb3RlOgo+IE9uIFN1biwgQXVn
IDA5LCAyMDA5IGF0IDA4OjE3OjIzQU0gKzAzMDAsIEFydGVtIEJpdHl1dHNraXkgd3JvdGU6Cj4+
IE9uIEZyaSwgMjAwOS0wOC0wNyBhdCAyMzo0MyAtMDYwMCwgR3JhbnQgTGlrZWx5IHdyb3RlOgo+
Pj4gT24gRnJpLCBKdWwgMTcsIDIwMDkgYXQgNjozOSBBTSwgV29sZnJhbSBTYW5nPHcuc2FuZ0Bw
ZW5ndXRyb25peC5kZT4gIHdyb3RlOgo+Pj4+IFVzZSBwaHlzbWFwX29mIHRvIGFjY2VzcyBSQU1z
IGFzIG10ZCBhbmQgYWRkIGRvY3VtZW5hdGlvbiBmb3IgaXQuIFRoaXMgYXBwcm9hY2gKPj4+PiBp
cyBhIGxvdCBsZXNzIGludHJ1c2l2ZSBhcyBhZGRpbmcgYW4gb2Ytd3JhcHBlciBhcm91bmQgcGxh
dC1yYW0uYy4gQXMgbW9zdAo+Pj4+IGV4dGVuc2lvbnMgb2YgcGxhdC1yYW0uYyAoZS5nLiBjdXN0
b20gbWFwLWZ1bmN0aW9ucykgY2FuJ3QgYmUgbWFwcGVkIHRvIHRoZQo+Pj4+IGRldmljZSB0cmVl
IGFueWhvdywgZXh0ZW5kaW5nIHBoeXNtYXBfb2Ygc2VlbXMgdG8gYmUgdGhlIGNsZWFuZXN0IGFw
cHJvYWNoLgo+Pj4+Cj4+Pj4gVGVzdGVkIHdpdGggYSBwaHlDT1JFLU1QQzUxMjFlLgo+Pj4+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogV29sZnJhbSBTYW5nPHcuc2FuZ0BwZW5ndXRyb25peC5kZT4KPj4+
IExvb2tzIGdvb2QgdG8gbWUuCj4+Pgo+Pj4gQWNrZWQtYnk6IEdyYW50IExpa2VseTxncmFudC5s
aWtlbHlAc2VjcmV0bGFiLmNhPgo+PiBUaGlzIHBhdGNoIGlzIHNpdHRpbmcgaW4gbXkgbDItbXRk
LTIuNi5naXQgdHJlZS4KPgo+IEdyZWF0LCB0aGFua3MgYSBsb3QgKGFuZCBmb3IgeW91ciBsMi10
cmVlIGluIGdlbmVyYWwhKS4gT25lIHF1ZXN0aW9uOiBBcmUgdGhlCj4gYWRkaXRpb25hbCBBY2tl
ZC1ieXMgYWRkZWQgbGF0ZXI/IEkgY291bGQgdGhpbmsgdGhleSBtaWdodCBiZSB1c2VmdWwgZm9y
Cj4gRGF2aWQncyByZXZpZXcuLi4KCkFkZGVkIEFja2VkLWJ5OiBHcmFudCBMaWtlbHk8Z3JhbnQu
bGlrZWx5QHNlY3JldGxhYi5jYT4KCi0tIApCZXN0IFJlZ2FyZHMsCkFydGVtIEJpdHl1dHNraXkg
KNCQ0YDRgtGR0Lwg0JHQuNGC0Y7RhtC60LjQuSkKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXhwcGMtZGV2IG1haWxpbmcgbGlzdApMaW51eHBwYy1k
ZXZAbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vbGlu
dXhwcGMtZGV2
