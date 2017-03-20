From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3 4/5] ASoC: sun8i-codec: Convert to use
	SND_SOC_DAPM_AIF_IN
Date: Mon, 20 Mar 2017 19:49:03 +0800
Message-ID: <CAGb2v6733y=UVXyhsSUK6whjWd_t_eXb1_aqnjyaj-_TFeGZqw@mail.gmail.com>
References: <20170318075509.3836-1-mylene.josserand@free-electrons.com>
 <20170318075509.3836-5-mylene.josserand@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20170318075509.3836-5-mylene.josserand@free-electrons.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>, linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gU2F0LCBNYXIgMTgsIDIwMTcgYXQgMzo1NSBQTSwgTXlsw6huZSBKb3NzZXJhbmQKPG15bGVu
ZS5qb3NzZXJhbmRAZnJlZS1lbGVjdHJvbnMuY29tPiB3cm90ZToKPiBVcGRhdGUgdGhlIGRyaXZl
ciB0byB1c2UgU05EX1NPQ19EQVBNX0FJRl9JTiBpbnN0ZWFkIG9mCj4gU05EX1NPQ19EQVBNX0RB
Qy4KPiBSZW5hbWUgdGhlIGludGVyZmFjZSdzIHdpZGdldHMgdG8gYmUgbW9yZSBwcmVjaXNlIG9u
IHdoaWNoIHNsb3QKPiB0aGUgaW50ZXJmYWNlIGlzIGNvbm5lY3RlZC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IE15bMOobmUgSm9zc2VyYW5kIDxteWxlbmUuam9zc2VyYW5kQGZyZWUtZWxlY3Ryb25zLmNv
bT4KPiAtLS0KPiAgc291bmQvc29jL3N1bnhpL3N1bjhpLWNvZGVjLmMgfCAyMCArKysrKysrKysr
Ky0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc3VueGkvc3VuOGktY29kZWMuYyBiL3Nv
dW5kL3NvYy9zdW54aS9zdW44aS1jb2RlYy5jCj4gaW5kZXggYWRiMTNmYmQyMDA2Li43NTI3YmEy
OWE1YTAgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29jL3N1bnhpL3N1bjhpLWNvZGVjLmMKPiArKysg
Yi9zb3VuZC9zb2Mvc3VueGkvc3VuOGktY29kZWMuYwoKWy4uLl0KCj4gQEAgLTMzMSwxNCArMzMz
LDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3JvdXRlIHN1bjhpX2NvZGVj
X2RhcG1fcm91dGVzW10gPSB7Cj4gICAgICAgICB7ICJEQUMiLCBOVUxMLCAiTU9EQ0xLIERBQyIg
fSwKPgo+ICAgICAgICAgLyogREFDIFJvdXRlcyAqLwo+IC0gICAgICAgeyAiRGlnaXRhbCBMZWZ0
IERBQyIsIE5VTEwsICJEQUMiIH0sCj4gLSAgICAgICB7ICJEaWdpdGFsIFJpZ2h0IERBQyIsIE5V
TEwsICJEQUMiIH0sCj4gKyAgICAgICB7ICJBSUYxIFNsb3QgMCBSaWdodCIsIE5VTEwsICJEQUMi
IH0sCj4gKyAgICAgICB7ICJBSUYxIFNsb3QgMCBMZWZ0IiwgTlVMTCwgIkRBQyIgfSwKCk5pdCBv
biB0aGUgb3JkZXIgKHNob3VsZCBiZSBsZWZ0IGJlZm9yZSByaWdodCksIGJ1dCBvdGhlcndpc2UK
CkFja2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cgo+Cj4gICAgICAgICAvKiBE
QUMgTWl4ZXIgUm91dGVzICovCj4gICAgICAgICB7ICJMZWZ0IERpZ2l0YWwgREFDIE1peGVyIiwg
IkFJRjEgU2xvdCAwIERpZ2l0YWwgREFDIFBsYXliYWNrIFN3aXRjaCIsCj4gLSAgICAgICAgICJE
aWdpdGFsIExlZnQgREFDIn0sCj4gKyAgICAgICAgICJBSUYxIFNsb3QgMCBMZWZ0In0sCj4gICAg
ICAgICB7ICJSaWdodCBEaWdpdGFsIERBQyBNaXhlciIsICJBSUYxIFNsb3QgMCBEaWdpdGFsIERB
QyBQbGF5YmFjayBTd2l0Y2giLAo+IC0gICAgICAgICAiRGlnaXRhbCBSaWdodCBEQUMifSwKPiAr
ICAgICAgICAgIkFJRjEgU2xvdCAwIFJpZ2h0In0sCj4gIH07Cj4KPiAgc3RhdGljIHN0cnVjdCBz
bmRfc29jX2RhaV9vcHMgc3VuOGlfY29kZWNfZGFpX29wcyA9IHsKPiAtLQo+IDIuMTEuMAo+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwg
bWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
