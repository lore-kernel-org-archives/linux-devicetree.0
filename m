From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 2/2] drm: Add ASPEED GFX driver
Date: Tue, 2 Apr 2019 02:09:19 +0000
Message-ID: <CACPK8Xf8Vz+pfJd1jo4Mzce9=vNoKk_Osvi3Tbdu3KSTmgmBkA@mail.gmail.com>
References: <20190328054316.17939-1-joel@jms.id.au>
 <20190328054316.17939-3-joel@jms.id.au>
 <20190328075317.GR2665@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190328075317.GR2665@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org, Maxime Ripard <maxime.ripard@bootlin.com>, Andrew Jeffery <andrew@aj.id.au>, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyOCBNYXIgMjAxOSBhdCAwNzo1MywgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPiB3cm90ZToKCj4gPiArc3RhdGljIGludCBhc3BlZWRfZ2Z4X2dldF9tb2RlcyhzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ID4gK3sKPiA+ICsgICAgIHJldHVybiBkcm1fYWRk
X21vZGVzX25vZWRpZChjb25uZWN0b3IsIDgwMCwgNjAwKTsKPgo+IElzIHRoaXMgdGhlIG9ubHkg
bW9kZSB5b3UgZG8sIG9yIGp1c3QgYSBkZWZhdWx0PyBJaXJjIGlmIHlvdSByZXBvcnQKPiAiY29u
bmVjdGVkIiwgeW91J2xsIGdldCB0aGlzIGFzIG9uZSBvZiB0aGUgZmFsbGJhY2sgbW9kZXMgYWxy
ZWFkeS4KCkkgdGhpcyBpcyB0aGUgb25seSBtb2RlIHdlIGNhbiBkbyB3aXRoIHRoZSBjbG9jayB0
aGF0IHdlIGhhdmUgYXZhaWxhYmxlLgoKPiBWZXJ5IG5pY2UgZHJpdmVyIQo+Cj4gQWNrZWQtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CgpUaGFua3MhCgo+IEZvciBt
ZXJnaW5nL21haW50ZW5hbmNlLCBkbyB5b3Ugd2FudCB0byBwdXQgdGhpcyBpbnRvIGRybS1taXNj
Pwo+Cj4gaHR0cHM6Ly9kcm0ucGFnZXMuZnJlZWRlc2t0b3Aub3JnL21haW50YWluZXItdG9vbHMv
Y29tbWl0dGVyLWRybS1taXNjLmh0bWwjc21hbGwtZHJpdmVycwoKVGhhdCBtYWtlcyBzZW5zZS4g
SSdsbCBzZW5kIG91dCBhIHYyIHdpdGggdGhlIGNoYW5nZXMgeW91IGFuZCBOb3JhbGYKc3VnZ2Vz
dGVkLCBhbmQgYSBtYWludGFpbmVycyBwYXRjaCwgb25jZSBJJ3ZlIGdpdmVuIGl0IGEgc3BpbiBv
bgpoYXJkd2FyZS4KCj4gV2UgY291bGQgYWxzbyBvZmZpY2lhbGx5IHB1dCBkcm0vYXN0IGluIHRo
ZXJlLCBpZiB5b3Ugd2FudCB0byBtYWludGFpbgo+IHRoYXQgdG9vLgoKSSBoYXZlbid0IGhhZCBt
dWNoIHRvIGRvIHdpdGggdGhhdCBkcml2ZXIgKGl0J3MgcGh5c2ljYWxseSBpbnNpZGUgdGhlCkJN
QywgYnV0IGEgZGlmZmVyZW50IHBpZWNlIG9mIGhhcmR3YXJlKS4gSSBjYW4gcHJvYmFibHkgYmUg
aW5jbHVkZWQgc28KSSdtIG9uIGNjIGZvciBjaGFuZ2VzLgoKQ2hlZXJzLAoKSm9lbAoKCj4KPiBF
aXRoZXIgd2F5LCBwYXRjaCBhbHNvIG5lZWRzIGEgTUFJTlRBSU5FUlMgZW50cnkuCj4gLURhbmll
bAo+IC0tCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cj4g
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
