From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [linux-sunxi] [PATCH v3 00/11] Add support for Orange Pi 3
Date: Fri, 12 Apr 2019 19:05:05 +0800
Message-ID: <CAGb2v64HgPePM=rk_kSdS7yFx4S4TR=tpGC2yQ6ruDCvBnosiA@mail.gmail.com>
References: <20190411101951.30223-1-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190411101951.30223-1-megous@megous.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-stm32@st-md-mailman.stormreply.com, brcm80211-dev-list@cypress.com, David Airlie <airlied@linux.ie>, Jose Abreu <joabreu@synopsys.com>, Naveen Gupta <naveen.gupta@cypress.com>, devicetree <devicetree@vger.kernel.org>, Arend van Spriel <arend.vanspriel@broadcom.com>, Alexandre Torgue <alexandre.torgue@st.com>, Hante Meuleman <hante.meuleman@broadcom.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Wright Feng <wright.feng@cypress.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Franky Lin <franky.lin@broadcom.com>, Maxime Coquelin <mcoquelin.stm32@g>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBBcHIgMTEsIDIwMTkgYXQgNjoxOSBQTSBtZWdvdXMgdmlhIGxpbnV4LXN1bnhpCjxs
aW51eC1zdW54aUBnb29nbGVncm91cHMuY29tPiB3cm90ZToKPgo+IEZyb206IE9uZHJlaiBKaXJt
YW4gPG1lZ291c0BtZWdvdXMuY29tPgo+Cj4gVGhpcyBzZXJpZXMgaW1wbGVtZW50cyBzdXBwb3J0
IGZvciBYdW5sb25nIE9yYW5nZSBQaSAzIGJvYXJkLgo+Cj4gVW5mb3J0dW5hdGVseSwgdGhpcyBi
b2FyZCBuZWVkcyBzb21lIHNtYWxsIGRyaXZlciBwYXRjaGVzLCBzbyBJIGhhdmUKPiBzcGxpdCB0
aGUgYm9hcmRzIERUIHBhdGNoIGludG8gY2h1bmtzIHRoYXQgcmVxdWlyZSBwYXRjaGVzIGZvciBk
cml2ZXJzCj4gaW4gdmFyaW91cyBzdWJzeXN0ZW1zLgo+Cj4gU3VnZ2VzdGVkIG1lcmdpbmcgcGxh
bi9kZXBlbmRlbmNpZXM6Cj4KPiAtIFBpbmN0cmwgYW5kIHN0bW1hYyBwYXRjaGVzIGFyZSBuZWVk
ZWQgZm9yIGV0aGVybmV0IHN1cHBvcnQuCj4gICAocGF0Y2hlcyAxLTUpCj4gLSBIRE1JIHN1cHBv
cnQgd2FzIGNoYW5nZWQsIHBsZWFzZSByZXZpZXcuIChwYXRjaGVzIDYtOCkKPiAtIGJyY21mbWFj
IHBhdGNoIDksIGZpeGluZyBmaXJtd2FyZSBmaWxlIHNlbGVjdGlvbiwgY2FuIGJlIG1lcmdlZAo+
ICAgbm93LCBhZnRlciByZXZpZXcsIGFzIGl0IGRvZXNuJ3QgZGVwZW5kIG9uIGFueXRoaW5nIChw
bGVhc2UKPiAgIHJldmlldyA6KSkKPiAtIG1tYzEgcGluY29uZiAocGF0Y2ggMTApIGNhbiBwcm9i
YWJseSBiZSBtZXJnZWQgbm93LCB0b28gKGl0IHdpbGwKPiAgIGNlcnRhaW5seSBiZSB1c2VkIHNv
b24gYnkgYWxsIHRoZSBvdGhlciBXaUZpIGZlYXR1cmluZyBib2FyZHMKPiAgIGJhc2VkIG9uIEg2
KQo+IC0gV2lGaSBkdHMgcGF0Y2ggd2lsbCBoYXZlIHRvIHdhaXQgZm9yIEg2IFJUQyBwYXRjaGVz
LCB3aGljaCBpbiB0dXJuCj4gICBkZXBlbmQgb24gQ2hlbll1J3MgUlRDIHNlcmllcywgdG8gYmUg
bWVyZ2VkLiBUaGF0IHdpbGwgdGFrZSBhCj4gICB3aGlsZSB5ZXQuIEknbSBqdXN0IGtlZXBpbmcg
aXQgaW4gdGhlIHNlcmllcyBmb3IgY29tcGxldG5lc3MuCj4gICAocGF0Y2ggMTEpCgpVbmZvcnR1
bmF0ZWx5IEkgd2lsbCBub3QgaGF2ZSB0aW1lIHRvIHRhY2tsZSB0aGlzIGZvciB0aGUgbmV4dCBy
ZWxlYXNlLgpGdXJ0aGVybW9yZSwgSSdkIGxpa2UgdG8gZG8gdGhpcyBhZnRlciB0aGUgbmV3IGNs
ayBwYXJlbnRpbmcgc3R1ZmYgbGFuZHMuCk90aGVyd2lzZSBpdCdzIGdvaW5nIHRvIGJlIGEgbWVz
cywgYXMgdGhlIGNsb2NrIHRyZWUgaXMgYSBiaXQgY29udm9sdXRlZApjb21wYXJlZCB0byBwcmV2
aW91cyBTb0NzLgoKQ2hlbll1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
