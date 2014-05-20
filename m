From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 6/6] ARM: dts: STiH407: Add B2120 board support
Date: Tue, 20 May 2014 08:20:48 +0100
Message-ID: <20140520072048.GC20874@lee--X1>
References: <1394614210-15698-1-git-send-email-maxime.coquelin@st.com>
 <1394614210-15698-7-git-send-email-maxime.coquelin@st.com>
 <CAOesGMg5Jk_XB3zdfKz8VxRObYbFO8OMuRyo7Ba-kavANbci1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMg5Jk_XB3zdfKz8VxRObYbFO8OMuRyo7Ba-kavANbci1w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, kernel@stlinux.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stuart Menefy <stuart.menefy@st.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxime COQUELIN <maxime.coquelin@st.com>
List-Id: devicetree@vger.kernel.org

PiA+IEIyMTIwIEhESyBpcyB0aGUgcmVmZXJlbmNlIGJvYXJkIGZvciBTVGlINDA3IFNvQy4KPiA+
IEl0IGhhcyB0aGUgZm9sbG93aW5nIGNoYXJhY3RlcmlzdGljczoKPiA+ICAtIDFHQiBERFIzCj4g
PiAgLSA4R0IgZU1NQyAvIFNELUNhcmQgc2xvdAo+ID4gIC0gMzJNQiBOT1IgRmxhc2gKPiA+ICAt
IDEgeCBHYml0IEV0aGVybmV0Cj4gPiAgLSAxIHggVVNCIDMuMCBwb3J0Cj4gPiAgLSAxIHggTWlu
aS1QQ0llCj4gPiAgLSAxIHggU0FUQQo+ID4gIC0gMSB4IEhETUkgb3V0cHV0Cj4gPiAgLSAxIHgg
SERNSSBpbnB1dAo+ID4gIC0gMSB4IFNQRElGCj4gPgo+ID4gVGhpcyBwYXRjaCBvbmx5IGludHJv
ZHVjZXMgYmFzaWMgZnVuY3Rpb25uYWxpdGllcywgc3VjaCBhcyBJMkMgYW5kIFVBUlQuCj4gPgo+
ID4gQWNrZWQtYnk6IEdpdXNlcHBlIENhdmFsbGFybyA8cGVwcGUuY2F2YWxsYXJvQHN0LmNvbT4K
PiA+IEFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4gU2lnbmVk
LW9mZi1ieTogR2l1c2VwcGUgQ2F2YWxsYXJvIDxwZXBwZS5jYXZhbGxhcm9Ac3QuY29tPgo+ID4g
U2lnbmVkLW9mZi1ieTogTWF4aW1lIENvcXVlbGluIDxtYXhpbWUuY29xdWVsaW5Ac3QuY29tPgo+
ID4gLS0tCj4gPiAgYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUgICAgICAgICAgfCAgMyArLQo+
ID4gIGFyY2gvYXJtL2Jvb3QvZHRzL3N0aWg0MDctYjIxMjAuZHRzIHwgNzggKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgODAgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9i
b290L2R0cy9zdGloNDA3LWIyMTIwLmR0cwoKWy4uLl0KCj4gPiArLyB7Cj4gPiArICAgICAgIG1v
ZGVsID0gIlNUaUg0MDcgQjIxMjAiOwo+ID4gKyAgICAgICBjb21wYXRpYmxlID0gInN0LHN0aWg0
MDciLCAic3Qsc3RpaDQwNy1iMjEyMCI7Cj4gCj4gVGhpcyBzaG91bGQgZ28gZnJvbSBzcGVjaWZp
YyB0byBnZW5lcmljLCBzbyB0aGUgb3JkZXIgbmVlZHMgdG8gYmUgdGhlIG90aGVyIHdheS4KCkkg
ZGlkIGhhdmUgYSBwYXRjaC1zZXQgdGhhdCBjaGFuZ2VkIGFsbCBvZiB0aGVzZS4gIFdvbmRlciB3
aGVyZSB0aGF0IHdlbnQhCgpbLi4uXQoKPiA+ICsgICAgICAgc29jIHsKPiA+ICsgICAgICAgICAg
ICAgICBzYmNfc2VyaWFsMDogc2VyaWFsQDk1MzAwMDAgewo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gKyAgICAgICAgICAgICAgIH07Cj4gCj4gWW91IG1p
Z2h0IHdhbnQgdG8gY29uc2lkZXIgcmVmZXJlbmNlLWJhc2VkIHN5bnRheCBoZXJlIGluc3RlYWQs
IHNvIHlvdQo+IGRvbid0IGhhdmUgdG8gbWltaWMgdGhlIGhpZXJhcmNoeS4gVGhhdCdkIGJlIChh
dCB0aGUgcm9vdCBsZXZlbCBvZiB0aGUKPiBmaWxlLCBiZWxvdyB0aGlzIHNlY2lvbjoKPiAKPiAm
c2JjX3NlcmlhbDA6IHsKPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiB9OwoKSSdtIHBlcnNv
bmFsbHkgbm90IGtlZW4gb24gdGhpcyBzY2hlbWUuICBJdCdzIHNvbWV0aW1lcyBoZWxwZnVsIHRv
IGtub3cKdGhlIGhpZXJhcmNoeSBhbmQgSSBkb24ndCB0aGluayBpdCdzIGEgbGFyZ2Ugb3Zlcmhl
YWQgdG8gZm9ybWF0IHRoZQpzdWJvcmRpbmF0ZSBEVFMgZmlsZXMgaW4gdGhpcyB3YXkuCgpQbGVh
c2UgY29uc2lkZXIgbm90IGVuZm9yY2luZyB0aGlzLgoKLS0gCkxlZSBKb25lcwpMaW5hcm8gU1RN
aWNyb2VsZWN0cm9uaWNzIExhbmRpbmcgVGVhbSBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hcm0ta2VybmVsCg==
