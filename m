From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: Add doc for the Ingenic JZ47xx LCD
 controller driver
Date: Wed, 19 Jun 2019 14:18:46 +0200
Message-ID: <20190619121846.GA29084@ravnborg.org>
References: <20190603152331.23160-1-paul@crapouillou.net>
 <20190611215554.GA23791@bogus> <1560329392.1823.1@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1560329392.1823.1@crapouillou.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Artur Rojek <contact@artur-rojek.eu>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>, od@zcrc.me, Sean Paul <sean@poorly.run>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTA6NDk6NTJBTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3
cm90ZToKPiAKPiAKPiBMZSBtYXIuIDExIGp1aW4gMjAxOSDDoCAyMzo1NSwgUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz4gYSDDqWNyaXQgOgo+ID4gT24gTW9uLCAgMyBKdW4gMjAxOSAxNzoy
MzozMCArMDIwMCwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPiA+ID4gIEFkZCBkb2N1bWVudGF0aW9u
IGZvciB0aGUgZGV2aWNldHJlZSBiaW5kaW5ncyBvZiB0aGUgTENEIGNvbnRyb2xsZXIKPiA+ID4g
cHJlc2VudCBpbgo+ID4gPiAgdGhlIEpaNDd4eCBmYW1pbHkgb2YgU29DcyBmcm9tIEluZ2VuaWMu
Cj4gPiA+IAo+ID4gPiAgU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3Vp
bGxvdS5uZXQ+Cj4gPiA+ICBUZXN0ZWQtYnk6IEFydHVyIFJvamVrIDxjb250YWN0QGFydHVyLXJv
amVrLmV1Pgo+ID4gPiAgLS0tCj4gPiA+IAo+ID4gPiAgTm90ZXM6Cj4gPiA+ICAgICAgdjI6IFJl
bW92ZSBpbmdlbmljLHBhbmVsIHByb3BlcnR5Lgo+ID4gPiAKPiA+ID4gICAgICB2MzogLSBSZW5h
bWUgY29tcGF0aWJsZSBzdHJpbmdzIGZyb20gaW5nZW5pYyxqejQ3WFgtZHJtIHRvCj4gPiA+IGlu
Z2VuaWMsano0N1hYLWxjZAo+ID4gPiAgICAgICAgICAtIFRoZSBpbmdlbmljLGxjZC1tb2RlIHBy
b3BlcnR5IGlzIG5vdyByZWFkIGZyb20gdGhlIHBhbmVsCj4gPiA+IG5vZGUgaW5zdGVhZAo+ID4g
PiAgICAgIAkgIG9mIGZyb20gdGhlIGRyaXZlciBub2RlCj4gPiA+IAo+ID4gPiAgICAgIHY0OiBS
ZW1vdmUgaW5nZW5pYyxsY2QtbW9kZSBwcm9wZXJ0eSBjb21wbGV0ZWx5Lgo+ID4gPiAKPiA+ID4g
ICAgICB2NTogTm8gY2hhbmdlCj4gPiA+IAo+ID4gPiAgIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2lu
Z2VuaWMsbGNkLnR4dCAgICAgICAgICB8IDQ0Cj4gPiA+ICsrKysrKysrKysrKysrKysrKysKPiA+
ID4gICAxIGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQo+ID4gPiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NAo+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9p
bmdlbmljLGxjZC50eHQKPiA+ID4gCj4gPiAKPiA+IFBsZWFzZSBhZGQgQWNrZWQtYnkvUmV2aWV3
ZWQtYnkgdGFncyB3aGVuIHBvc3RpbmcgbmV3IHZlcnNpb25zLiBIb3dldmVyLAo+ID4gdGhlcmUn
cyBubyBuZWVkIHRvIHJlcG9zdCBwYXRjaGVzICpvbmx5KiB0byBhZGQgdGhlIHRhZ3MuIFRoZSB1
cHN0cmVhbQo+ID4gbWFpbnRhaW5lciB3aWxsIGRvIHRoYXQgZm9yIGFja3MgcmVjZWl2ZWQgb24g
dGhlIHZlcnNpb24gdGhleSBhcHBseS4KPiA+IAo+ID4gSWYgYSB0YWcgd2FzIG5vdCBhZGRlZCBv
biBwdXJwb3NlLCBwbGVhc2Ugc3RhdGUgd2h5IGFuZCB3aGF0IGNoYW5nZWQuCj4gCj4gU29ycnkg
Um9iLCBteSBtaXN0YWtlLiBJIHNpbXBseSBmb3Jnb3QgdGhhdCB5b3UgZXZlciByZXZpZXdlZCB0
aGF0IHBhdGNoLgpBZGRlZCBSb2IncyByLWIgYW5kIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0CgoJ
U2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
