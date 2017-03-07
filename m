From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/15] clk: divider: Make divider_round_rate take the
 parent clock
Date: Tue, 7 Mar 2017 06:11:57 -0800
Message-ID: <20170307141157.GC10239@codeaurora.org>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <7ebd073b4941e4b7c619f15ff0a375ff7919d403.1488876832.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <7ebd073b4941e4b7c619f15ff0a375ff7919d403.1488876832.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org, David Brown <david.brown@linaro.org>, linux-sunxi@googlegroups.com, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Chen-Yu Tsai <wens@csie.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, rtc-linux@googlegroups.com, linux-arm-msm@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org, Carlo Caione <carlo@caione.org>
List-Id: devicetree@vger.kernel.org

T24gMDMvMDcsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4gU28gZmFyLCBkaXZpZGVyX3JvdW5kX3Jh
dGUgb25seSBjb25zaWRlcnMgdGhlIHBhcmVudCBjbG9jayByZXR1cm5lZCBieQo+IGNsa19od19n
ZXRfcGFyZW50Lgo+IAo+IFRoaXMgd29ya3MgZmluZSBvbiBjbG9ja3MgdGhhdCBoYXZlIGEgc2lu
Z2xlIHBhcmVudHMsIHRoaXMgZG9lc24ndCB3b3JrIG9uCj4gbXV4ZXMsIHNpbmNlIHdlIHdpbGwg
b25seSBjb25zaWRlciB0aGUgZmlyc3QgcGFyZW50LCB3aGlsZSBvdGhlciBwYXJlbnRzCj4gbWF5
IHRvdGFsbHkgYmUgYWJsZSB0byBwcm92aWRlIGEgYmV0dGVyIGNvbWJpbmF0aW9uLgo+IAo+IENs
b2NrcyBpbiB0aGF0IGNhc2UgY2Fubm90IHVzZSBkaXZpZGVyX3JvdW5kX3JhdGUsIHNvIHdvdWxk
IGhhdmUgdG8gY29tZSB1cAo+IHdpdGggYSB2ZXJ5IHNpbWlsYXIgbG9naWMgdG8gd29yayBhcm91
bmQgaXQuIEluc3RlYWQgb2YgaGF2aW5nIHRvIGRvCj4gc29tZXRoaW5nIGxpa2UgdGhpcywgYW5k
IGR1cGxpY2F0ZSB0aGF0IGxvZ2ljIGV2ZXJ5d2hlcmUsIGdpdmUgYW4KPiBhZGRpdGlvbmFsIHBh
cmFtZXRlciBmb3IgdGhlIHBhcmVudCBjbG9jayB0byBjb25zaWRlci4KPiAKPiBDdXJyZW50IHVz
ZXJzIGhhdmUgYmVlbiBjb252ZXJ0ZWQgdXNpbmcgdGhlIGZvbGxvd2luZyBjb2NjaW5lbGxlIHNj
cmlwdAo+IAo+IEBACj4gaWRlbnRpZmllciBodywgcmF0ZSwgcHJhdGUsIHRhYmxlLCB3aWR0aCwg
ZmxhZ3M7Cj4gQEAKPiAKPiAtbG9uZyBkaXZpZGVyX3JvdW5kX3JhdGUoc3RydWN0IGNsa19odyAq
aHcsCj4gK2xvbmcgZGl2aWRlcl9yb3VuZF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LCBzdHJ1Y3Qg
Y2xrX2h3ICpwYXJlbnQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBy
YXRlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKnByYXRlLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBjbGtfZGl2X3RhYmxlICp0YWJsZSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICB1OCB3aWR0aCwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIGZsYWdzKSB7IC4uLiB9Cj4gCj4gQEAKPiBpZGVudGlmaWVyIGZu
LCBodzsKPiBleHByZXNzaW9uIEUyLCBFMywgRTQsIEU1LCBFNjsKPiBAQAo+ICBmbiAoc3RydWN0
IGNsa19odyAqaHcsIC4uLikgewo+ICA8Li4uCj4gLWRpdmlkZXJfcm91bmRfcmF0ZShodywgRTIs
IEUzLCBFNCwgRTUsIEU2KQo+ICtkaXZpZGVyX3JvdW5kX3JhdGUoaHcsIGNsa19od19nZXRfcGFy
ZW50KGh3KSwgRTIsIEUzLCBFNCwgRTUsIEU2KQo+ICAuLi4+Cj4gfQoKV2h5IG5vdCBpbnRyb2R1
Y2UgYW5vdGhlciBmdW5jdGlvbiBsaWtlIAoKCWRpdmlkZXJfcm91bmRfcmF0ZV9wYXJlbnQoKQoJ
ZGl2aWRlcl9yb3VuZF9yYXRlX211eCgpCgp0aGF0IHRha2VzIHRoZSBleHRyYSBwYXJlbnQgYXJn
dW1lbnQ/IFRlY2huaWNhbGx5LCBhIGRpdmlkZXIgaXMKY29uc2lkZXJlZCB0byBvbmx5IGhhdmUg
b25lIHBhcmVudCwgYW5kIGlmIGl0IGhhcyBtb3JlIHRoYW4gb25lCnBhcmVudCwgdGhlbiBpdCBp
cyBhIG11eCBhbmQgYSBkaXZpZGVyLgoKLS0gClF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJ
bmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVyb3JhIEZvcnVtLAphIExpbnV4IEZvdW5kYXRpb24g
Q29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
