From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [linux-sunxi] [PATCH 00/12] Add support for Orange Pi 3
Date: Mon, 8 Apr 2019 11:31:22 +0530
Message-ID: <CAMty3ZDpppM5zBvxCBx3NjdVsRm4S93yz5kqi5Z5a0rhC-+zPg__32289.6407962375$1554703316$gmane$org@mail.gmail.com>
References: <20190405234514.6183-1-megous@megous.com>
 <CAJiuCcew10Q3PUOk4VPoiyFc7ZhXwJzxXHQHNeVBUvVAQ3BkbQ@mail.gmail.com>
 <20190407143237.2qyoef4r5e3qvbmh@core.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190407143237.2qyoef4r5e3qvbmh@core.my.home>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: megous@megous.com, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, linux-sunxi <linux-sunxi@googlegroups.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>, Naveen Gupta <naveen.gupta@cypress.com>
List-Id: devicetree@vger.kernel.org

T24gU3VuLCBBcHIgNywgMjAxOSBhdCA4OjAyIFBNICdPbmTFmWVqIEppcm1hbicgdmlhIGxpbnV4
LXN1bnhpCjxsaW51eC1zdW54aUBnb29nbGVncm91cHMuY29tPiB3cm90ZToKPgo+IE9uIFN1biwg
QXByIDA3LCAyMDE5IGF0IDAzOjM2OjIxUE0gKzAyMDAsIENsw6ltZW50IFDDqXJvbiB3cm90ZToK
PiA+IEhpLAo+ID4KPiA+IE9uIFNhdCwgNiBBcHIgMjAxOSBhdCAwMTo0NSwgbWVnb3VzIHZpYSBs
aW51eC1zdW54aQo+ID4gPGxpbnV4LXN1bnhpQGdvb2dsZWdyb3Vwcy5jb20+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBGcm9tOiBPbmRyZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KPiA+ID4KPiA+
ID4gVGhpcyBzZXJpZXMgaW1wbGVtZW50cyBzdXBwb3J0IGZvciBYdW5sb25nIE9yYW5nZSBQaSAz
IGJvYXJkLgo+ID4KPiA+IE9yYW5nZVBpIDMgTGl0ZTIgYW5kIE9uZSBQbHVzIGJvYXJkcyBzdXBw
b3J0IGhhcyBhbHJlYWR5IGJlZW4gbWVyZ2VkLgo+ID4gVGhlIHN1cHBvcnQgaXMgbm90IGNvbXBs
ZXRlIGJ1dCB5b3Ugc2hvdWxkIHJlYmFzZSB5b3VyIHBhdGNoZXMgb24gdG9wCj4gPiBvZiBzdW54
aS9mb3ItbmV4dAo+Cj4gSGksCj4KPiBPcmFuZ2VQaSAzIGlzIHNvbWV3aGF0IGRpZmZlcmVudCBm
cm9tIHRoZXNlIHR3byBib2FyZHMgKG1vc3RseSBpdCBoYXMgYSBkaWZmZXJudAo+IHBvd2VyIHRy
ZWUpLiBJdCBkb2Vzbid0IHVzZSB0aGUgQVhQIHJlZ3VsYXRvcnMgdGhhdCBhcmUgZGVmaW5lZCBp
biB0aGUKPiBzdW41MGktaDYtb3JhbmdlcGkuZHRzaSBpbiB0aGUgc2FtZSB3YXkuCj4KPiBGb3Ig
ZXhhbXBsZToKPgo+IC0gYmxkbzMgKGlzIHR1cm5lZCBhbHdheXMgb24gaW4gc3VuNTBpLWg2LW9y
YW5nZXBpLmR0c2kgYnV0IHVudXNlZCBmb3Igb3BpMykKPiAtIGNsZG8yIGFuZCBjbGRvMyBhcmUg
dW51c2VkIG9uIG9waTMgYW5kIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIFdpRmkKPiAtIGFsZG8z
IGlzIG5vdCBmb3IgZHJhbQo+IC0gYmxkbzEgb24gdGhlIG90aGVyIGhhbmQgaXMgZm9yIGRyYW0g
b24gb3BpMwo+IC0gc29tZSBvdGhlciByZWd1bGF0b3JzIGFyZSB1c2VkIGZvciBkaWZmZXJlbnQv
bW9yZSBmdW5jdGlvbnMgYW5kIHRodXMKPiAgIG5hbWVkIGRpZmZlcm50bHkKPiAtIFVTQiBpZC1k
ZXQgcGluIGlzIGRpZmZlcm50Cj4gLSAuLi4KCkJhc2VkIG9uIG15IGNvbW11bmljYXRpb24gd2l0
aCBPcmFuZ2VQSSwgT1BJLTMgaGFzIFBDSUUsIDQgVVNCLTMuMApwb3J0cyBhbmQgQVYgYXJlIHRo
ZSBrZXkgZGlmZmVyZW5jZXMgYW5kIHJlc3Qgc2VlbXMgdG8gYmUgc2ltaWxhci4gYnV0CmlmIHdl
IGhhdmUgYSBkaWZmIG9yIHVudXNlZCByZWd1bGF0b3JzIG1heSBiZSB3ZSBjYW4ndCBlbmFibGUg
dGhlbSBpbgpkdHNpIChJIG5ldmVyIGxvb2tlZCB0aGF0IGNsb3NlIGFzIG9mIG5vdykKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
