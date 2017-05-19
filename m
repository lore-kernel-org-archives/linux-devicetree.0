From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 01/21] clk: divider: Make divider_round_rate take the
 parent clock
Date: Thu, 18 May 2017 18:54:30 -0700
Message-ID: <20170519015430.GF20170@codeaurora.org>
References: <cover.463df61c38224ecbfb5bf1cf192deeb63718b693.1495006350.git-series.maxime.ripard@free-electrons.com>
 <af976be0ecc2ea335cd9694a83fb29174d87e17d.1495006350.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <af976be0ecc2ea335cd9694a83fb29174d87e17d.1495006350.git-series.maxime.ripard@free-electrons.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree@vger.kernel.org, Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gMDUvMTcsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4gU28gZmFyLCBkaXZpZGVyX3JvdW5kX3Jh
dGUgb25seSBjb25zaWRlcnMgdGhlIHBhcmVudCBjbG9jayByZXR1cm5lZCBieQo+IGNsa19od19n
ZXRfcGFyZW50Lgo+IAo+IFRoaXMgd29ya3MgZmluZSBvbiBjbG9ja3MgdGhhdCBoYXZlIGEgc2lu
Z2xlIHBhcmVudHMsIHRoaXMgZG9lc24ndCB3b3JrIG9uCj4gbXV4ZXMsIHNpbmNlIHdlIHdpbGwg
b25seSBjb25zaWRlciB0aGUgZmlyc3QgcGFyZW50LCB3aGlsZSBvdGhlciBwYXJlbnRzCj4gbWF5
IHRvdGFsbHkgYmUgYWJsZSB0byBwcm92aWRlIGEgYmV0dGVyIGNvbWJpbmF0aW9uLgo+IAo+IENs
b2NrcyBpbiB0aGF0IGNhc2UgY2Fubm90IHVzZSBkaXZpZGVyX3JvdW5kX3JhdGUsIHNvIHdvdWxk
IGhhdmUgdG8gY29tZSB1cAo+IHdpdGggYSB2ZXJ5IHNpbWlsYXIgbG9naWMgdG8gd29yayBhcm91
bmQgaXQuIEluc3RlYWQgb2YgaGF2aW5nIHRvIGRvCj4gc29tZXRoaW5nIGxpa2UgdGhpcywgYW5k
IGR1cGxpY2F0ZSB0aGF0IGxvZ2ljIGV2ZXJ5d2hlcmUsIGNyZWF0ZSBhCj4gZGl2aWRlcl9yb3Vu
ZF9yYXRlIHBhcmVudCB0byBhbGxvdyBjYWxsZXIgdG8gZ2l2ZSBhbiBhZGRpdGlvbmFsIHBhcmFt
ZXRlcgo+IGZvciB0aGUgcGFyZW50IGNsb2NrIHRvIGNvbnNpZGVyLgo+IAo+IFJldmlld2VkLWJ5
OiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJp
cGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+Cj4gLS0tCgpBY2tlZC1ieTog
U3RlcGhlbiBCb3lkIDxzYm95ZEBjb2RlYXVyb3JhLm9yZz4KCi0tIApRdWFsY29tbSBJbm5vdmF0
aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiBDb2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51
eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
