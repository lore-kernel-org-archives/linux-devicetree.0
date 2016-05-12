From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [linux-sunxi] Re: [PATCH v4 01/11] clk: sunxi: Add display and
 TCON0 clocks driver
Date: Thu, 12 May 2016 14:47:02 -0700
Message-ID: <20160512214702.GL3492@codeaurora.org>
References: <1461590572-4027-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160506223002.GE3492@codeaurora.org>
 <20160508200308.GF6167@lukather>
 <20160509223238.GW3492@codeaurora.org>
 <20160509223924.GX3492@codeaurora.org>
 <1462907459.9981.0.camel@plaes.org>
 <20160511221541.GG3492@codeaurora.org>
 <1463024360.16747.4.camel@plaes.org>
 <20160512065943.GX3733@lukather> <20160512083047.GY3733@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20160512083047.GY3733@lukather>
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree@vger.kernel.org, Priit Laes <plaes@plaes.org>, Mike Turquette <mturquette@baylibre.com>, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexander Kaplan <alex@nextthing.co>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gMDUvMTIsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y2xrL3N1bnhpL2Nsay1zdW40aS1kaXNwbGF5LmMgYi9kcml2ZXJzL2Nsay9zdW54aS9jbGstc3Vu
NGktZGlzcGxheS5jCj4gaW5kZXggNzA4MDNhYTcwMjhjLi45NzgwZmFjNmQwMjkgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9jbGsvc3VueGkvY2xrLXN1bjRpLWRpc3BsYXkuYwo+ICsrKyBiL2RyaXZl
cnMvY2xrL3N1bnhpL2Nsay1zdW40aS1kaXNwbGF5LmMKPiBAQCAtMTI4LDggKzEyOCw4IEBAIHN0
YXRpYyB2b2lkIF9faW5pdCBzdW40aV9hMTBfZGlzcGxheV9pbml0KHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbm9kZSwKPiAgCQlyZXR1cm47Cj4gIAl9Cj4gIAo+IC0JcmV0ID0gb2ZfY2xrX3BhcmVudF9m
aWxsKG5vZGUsIHBhcmVudHMsIEFSUkFZX1NJWkUocGFyZW50cykpOwo+IC0JaWYgKHJldCAhPSBB
UlJBWV9TSVpFKHBhcmVudHMpKSB7Cj4gKwlyZXQgPSBvZl9jbGtfcGFyZW50X2ZpbGwobm9kZSwg
cGFyZW50cywgZGF0YS0+cGFyZW50cyk7Cj4gKwlpZiAocmV0ICE9IGRhdGEtPnBhcmVudHMpIHsK
PiAgCQlwcl9lcnIoIiVzOiBDb3VsZCBub3QgcmV0cmlldmUgdGhlIHBhcmVudHNcbiIsIGNsa19u
YW1lKTsKPiAgCQlnb3RvIHVubWFwOwo+ICAJfQoKQWggb2suIFRoYW5rcyBmb3IgY2F0Y2hpbmcg
dGhhdCB0aGlua28gYW5kIHNlbmRpbmcgYSBwYXRjaC4KCi0tIApRdWFsY29tbSBJbm5vdmF0aW9u
IENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiBDb2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51eCBG
b3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
