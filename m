From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [linux-sunxi] Re: [PATCH 02/12] drm: sun4i: Add support for
 enabling DDC I2C bus to dw_hdmi glue
Date: Mon, 8 Apr 2019 15:28:24 +0800
Message-ID: <CAGb2v65W_H5HrnY9+DuW-noshXLHgErJhEpHHhzcG15n1u=8iw@mail.gmail.com>
References: <20190405234514.6183-1-megous@megous.com>
 <20190405234514.6183-3-megous@megous.com>
 <20190408072338.3urcotemju3qi2un@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190408072338.3urcotemju3qi2un@flea>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-stm32@st-md-mailman.stormreply.com, brcm80211-dev-list@cypress.com, Jose Abreu <joabreu@synopsys.com>, Naveen Gupta <naveen.gupta@cypress.com>, devicetree <devicetree@vger.kernel.org>, Arend van Spriel <arend.vanspriel@broadcom.com>, Alexandre Torgue <alexandre.torgue@st.com>, Hante Meuleman <hante.meuleman@broadcom.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Wright Feng <wright.feng@cypress.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Franky Lin <franky.lin@broadcom.com>, Maxime Coquelin <mcoquelin>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBBcHIgOCwgMjAxOSBhdCAzOjIzIFBNIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBh
cmRAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBBcHIgMDYsIDIwMTkgYXQgMDE6NDU6
MDRBTSArMDIwMCwgbWVnb3VzQG1lZ291cy5jb20gd3JvdGU6Cj4gPiBGcm9tOiBPbmRyZWogSmly
bWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KPiA+Cj4gPiBPcmFuZ2UgUGkgMyBib2FyZCByZXF1aXJl
cyBlbmFibGluZyBEREMgSTJDIGJ1cyB2aWEgc29tZSBHUElPIGNvbm5lY3RlZAo+ID4gdHJhbnNp
c3RvcnMsIGJlZm9yZSBpdCBjYW4gYmUgdXNlZC4gTW9kZWwgdGhpcyBhcyBhIHBvd2VyIHN1cHBs
eSBmb3IgRERDCj4gPiAodmlhIHJlZ3VsYXRvciBmcmFtZXdvcmspLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IE9uZHJlaiBKaXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgo+Cj4gVGhlIEREQyBidXMg
aXRzZWxmIGlzIHVzdWFsbHkgYXR0YWNoZWQgdG8gdGhlIEhETUkgY29ubmVjdG9yLCBzbyBpdAo+
IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gbWFrZSB0aGUgc3VwcGx5IGFsc28gYSBwcm9wZXJ0eSBvZiB0
aGUgY29ubmVjdG9yLgoKSSBiZWxpZXZlIHRoZXNlIGFyZSBzZXBhcmF0ZSB0aGluZ3MuIFdoYXQg
dGhpcyBwYXRjaCBjb3ZlcnMgaXMgcG93ZXIgZm9yCmEgdm9sdGFnZSBzaGlmdGVyIGJldHdlZW4g
dGhlIFNvQyBhbmQgSERNSSBEREMgcGlucy4gVGhlIEhETUkgY29ubmVjdG9yJ3MKNVYgc3VwcGx5
IHRvIHBvd2VyIHRoZSByZW1vdGUgRERDIGNoaXAgaXMgc29tZXRoaW5nIGVsc2UuIEFuZCBvbiB0
aGUKT3JhbmdlIFBpIDMgdGhleSBhcmUgaW5kZWVkIHNlcGFyYXRlIHN1cHBsaWVzLgoKQ2hlbll1
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
