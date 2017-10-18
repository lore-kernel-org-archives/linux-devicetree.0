From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [linux-sunxi] [PATCH 08/10] ARM: dts: sun4i: Enable HDMI support
 on some A10 devices
Date: Wed, 18 Oct 2017 09:42:05 +0800
Message-ID: <CAGb2v67tqq7WF7X=xbVOc0_YqBnRTWLF-UyDDmFyRjdYUgbC2A@mail.gmail.com>
References: <20171017121807.2994-1-wens@csie.org>
 <20171017121807.2994-9-wens@csie.org>
 <CAGb2v65Z2N24AZp=Y-_YgKuZiT1uSDX5pzMrceU3+TY=+Zdf7g@mail.gmail.com>
 <20171017181005.7x6wwuidzsm7kep3@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20171017181005.7x6wwuidzsm7kep3@flea.lan>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBPY3QgMTgsIDIwMTcgYXQgMjoxMCBBTSwgTWF4aW1lIFJpcGFyZAo8bWF4aW1lLnJp
cGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+IHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDE3LCAyMDE3IGF0
IDEwOjM4OjQ1UE0gKzA4MDAsIENoZW4tWXUgVHNhaSB3cm90ZToKPj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvc3VuNGktYTEwLW9saW51eGluby1saW1lLmR0cyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3N1bjRpLWExMC1vbGludXhpbm8tbGltZS5kdHMKPj4gPiBpbmRleCAyZDFiNDMy
OWY1NGEuLmUzOWVjOWJlZWY3NSAxMDA2NDQKPj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9z
dW40aS1hMTAtb2xpbnV4aW5vLWxpbWUuZHRzCj4+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMv
c3VuNGktYTEwLW9saW51eGluby1saW1lLmR0cwo+PiA+IEBAIC01OCw2ICs1OCwxNyBAQAo+PiA+
ICAgICAgICAgICAgICAgICBzdGRvdXQtcGF0aCA9ICJzZXJpYWwwOjExNTIwMG44IjsKPj4gPiAg
ICAgICAgIH07Cj4+ID4KPj4gPiArICAgICAgIGhkbWktY29ubmVjdG9yIHsKPj4gPiArICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJoZG1pLWNvbm5lY3RvciI7Cj4+ID4gKyAgICAgICAgICAg
ICAgIHR5cGUgPSAiYSI7Cj4+ID4gKwo+PiA+ICsgICAgICAgICAgICAgICBwb3J0IHsKPj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBoZG1pX2Nvbl9pbjogZW5kcG9pbnQgewo+PiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pX291dF9j
b24+Owo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH07Cj4+ID4gKyAgICAgICAgICAgICAg
IH07Cj4+ID4gKyAgICAgICB9Owo+PiA+ICsKPj4gPiAgICAgICAgIGxlZHMgewo+PiA+ICAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gImdwaW8tbGVkcyI7Cj4+ID4gICAgICAgICAgICAgICAg
IHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+ID4gQEAgLTEwNiw2ICsxMTcsMTYgQEAKPj4g
PiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPj4gPiAgfTsKPj4KPj4gVGhlIExJTUUncyBkdHMg
Y2hhbmdlIGlzIG1pc3NpbmcgdGhlICZkZSBwYXJ0LiA6KAo+PiBJIGNhbiBmaXggdGhpcyB3aGVu
IGFwcGx5aW5nLgo+Cj4gSSd2ZSBhcHBsaWVkIGFsbCBvZiByZXN0LCBJJ2xsIGxlYXZlIHRoYXQg
b25lIHVwIHRvIHlvdSwgd2l0aCBteQo+IEFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUu
cmlwYXJkQGZyZWUtZWxlY3Ryb25zLmNvbT4KCkRvbmUuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
