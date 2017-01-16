From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: add dt support for Everspin MRAMs
Date: Mon, 16 Jan 2017 17:08:02 +0100
Message-ID: <261f6372-ef71-8e6c-9b13-13e73140bb87@gmail.com>
References: <20170116133503.13887-1-u.kleine-koenig@pengutronix.de>
 <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Jagan Teki <jagan@openedev.com>
List-Id: devicetree@vger.kernel.org

T24gMDEvMTYvMjAxNyAwMjo1NSBQTSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IE9uIDE2IEph
bnVhcnkgMjAxNyBhdCAxNDozNSwgVXdlIEtsZWluZS1Lw7ZuaWcKPiA8dS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPj4gVGhlIE1SMjUgZmFtaWx5IGRvZXNuJ3Qgc3VwcG9y
dCBKRURFQywgc28gdGhleSBuZWVkIGV4cGxpY2l0IG1lbnRpb25pbmcKPj4gaW4gdGhlIGxpc3Qg
b2Ygc3VwcG9ydGVkIHNwaSBJRHMuIFRoaXMgbWFrZXMgaXQgcG9zc2libGUgdG8gYWRkIHRoZXNl
Cj4+IHVzaW5nIGZvciBleGFtcGxlOgo+Pgo+PiAgICAgICAgIGNvbXBhdGlibGUgPSAiZXZlcnNw
aW4sbXIyNWg0MCI7Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4+IC0tLQo+PiBIZWxsbywKPj4KPj4gaW5kZXBl
bmRlbnQgb2YgdGhlIGRlY2lzaW9uIGlmIC1ub25qZWRlYyBpcyBvayBmb3IgbTI1cCwgdGhpcyBp
cyBuZWVkZWQKPj4gdG8gbWFrZSBFdmVyc3BpbidzIE1SQU1zIHdvcmsuCj4+Cj4+IEJlc3QgcmVn
YXJkcwo+PiBVd2UKPj4KPj4gIGRyaXZlcnMvbXRkL2RldmljZXMvbTI1cDgwLmMgfCA1ICsrKysr
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9kZXZpY2VzL20yNXA4MC5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9tMjVwODAu
Ywo+PiAtLS0gYS9kcml2ZXJzL210ZC9kZXZpY2VzL20yNXA4MC5jCj4+ICsrKyBiL2RyaXZlcnMv
bXRkL2RldmljZXMvbTI1cDgwLmMKPj4gQEAgLTMwNSw2ICszMDUsMTEgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzcGlfZGV2aWNlX2lkIG0yNXBfaWRzW10gPSB7Cj4+ICAgICAgICAgeyJtMjVwNDAt
bm9uamVkZWMifSwgICAgeyJtMjVwODAtbm9uamVkZWMifSwgICAgeyJtMjVwMTYtbm9uamVkZWMi
fSwKPj4gICAgICAgICB7Im0yNXAzMi1ub25qZWRlYyJ9LCAgICB7Im0yNXA2NC1ub25qZWRlYyJ9
LCAgICB7Im0yNXAxMjgtbm9uamVkZWMifSwKPj4KPj4gKyAgICAgICAvKiBFdmVyc3BpbiBNUkFN
cyB3aXRob3V0IEpFREVDIHN1cHBvcnQgKi8KPj4gKyAgICAgICB7ICJtcjI1aDI1NiIgfSwgLyog
MjU2IGtpYiwgNDAgTUh6ICovCj4gCj4gQSB0cml2aWFsIHRoaW5nOiBJIHRoaW5rIGl0IHNob3Vs
ZCBiZSBLaWIKPiBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9CaW5hcnlfcHJlZml4Cj4g
CkV4Y2VwdCBmb3IgdGhhdCwgaXQgbG9va3MgZ29vZCBJTU8uCgotLSAKQmVzdCByZWdhcmRzLApN
YXJlayBWYXN1dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
