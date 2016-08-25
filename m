From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i: enable UART1 for iNet D978 Rev2 board
Date: Thu, 25 Aug 2016 22:12:35 +0800
Message-ID: <116041472134355@web12g.yandex.ru>
References: <20160823064451.25997-1-icenowy@aosc.xyz>
 <20160823064451.25997-3-icenowy@aosc.xyz>
 <20160824193600.GS8103@lukather> <43951472083107@web23m.yandex.ru>
 <CAGb2v66tFENk8QBw7D1+bwFN-zWaE2SGDrNyc-zdbJSRzENk4Q@mail.gmail.com>
 <97321472108244@web8m.yandex.ru> <20160825080334.GD7776@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160825080334.GD7776@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CgoyNS4wOC4yMDE2LCAxNjowMywgIk1heGltZSBSaXBhcmQiIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT46Cj4gSGksCj4KPiBPbiBUaHUsIEF1ZyAyNSwgMjAxNiBhdCAwMjo1Nzoy
NFBNICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+PiDCoD4+Pj4gwqDCoGRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9zdW44aS1hMzMtaW5ldC1kOTc4LXJldjIuZHRzIGIvYXJjaC9h
cm0vYm9vdC9kdHMvc3VuOGktYTMzLWluZXQtZDk3OC1yZXYyLmR0cwo+PiDCoD4+Pj4gwqDCoGlu
ZGV4IDc4ODIzZDguLjNhYzIyZDQgMTAwNjQ0Cj4+IMKgPj4+PiDCoMKgLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvc3VuOGktYTMzLWluZXQtZDk3OC1yZXYyLmR0cwo+PiDCoD4+Pj4gwqDCoCsrKyBi
L2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLWEzMy1pbmV0LWQ5NzgtcmV2Mi5kdHMKPj4gwqA+Pj4+
IMKgwqBAQCAtNDgsNiArNDgsMTAgQEAKPj4gwqA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBt
b2RlbCA9ICJJTmV0LUQ5NzggUmV2IDAyIjsKPj4gwqA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBjb21wYXRpYmxlID0gInByaW11eCxpbmV0LWQ5NzgtcmV2MiIsICJhbGx3aW5uZXIsc3VuOGkt
YTMzIjsKPj4gwqA+Pj4+Cj4+IMKgPj4+PiDCoMKgKyBhbGlhc2VzIHsKPj4gwqA+Pj4+IMKgwqAr
IHNlcmlhbDEgPSAmdWFydDE7Cj4+IMKgPj4+PiDCoMKgKyB9Owo+PiDCoD4+Pj4gwqDCoCsKPj4g
wqA+Pj4KPj4gwqA+Pj4gwqBJcyB0aGVyZSBhbnkgb3RoZXIgVUFSVCBpbiB0aGUgc3lzdGVtPwo+
PiDCoD4+Cj4+IMKgPj4gwqBzZXJpYWwwIGlzIGRlZmluZWQgaW4gc3VuOGktcmVmZXJlbmNlLWRl
c2lnbi10YWJsZXQuZHRzaSwgYXMgcl91YXJ0Lgo+PiDCoD4KPj4gwqA+IElmIHlvdXIgYm9hcmQg
ZG9lcyBub3QgaGF2ZSByX3VhcnQgcGFkcywgdGhlbiB0aGUgcmlnaHQgdGhpbmcgdG8gZG8KPj4g
wqA+IHdvdWxkIGJlIHRvIGRpc2FibGUgaXQuIFlvdSBjYW4gdGhlbiBoYXZlIHVhcnQxIGFzIHNl
cmlhbDAuCj4+Cj4+IMKgSSBkb24ndCBrbm93IGl0LiBUaGUgUlgvVFggaXMgd2lyZWQgb24gUEYy
L1BGNCBvbiB0aGUgYm9hcmQgKFVBUlQwIG11eGVkIHdpdGgKPj4gwqBNTUMpCj4KPiBUaGVuIHlv
dSBkb24ndCBzdXBwb3J0IGl0IGFuZCB5b3UgbmVlZCB0byBkaXNhYmxlIGl0Lgo+Cj4+IMKgQnV0
IG1hbnkgY29kZXMgd2lsbCByZXF1aXJlIGEgdHR5UzAgYXMgY29uc29sZS4uLiBTbyBJIHRoaW5r
IHRoZQo+PiDCoGJsdWV0b290aCBzaG91bGQgYmUgbG9jYXRlZCBhdCB0dHlTMS4uLgo+Cj4gTW9z
dCBvZiB0aGVtIHdvdWxkIHVzZSAvZGV2L2NvbnNvbGUgYW55d2F5LiBXaGF0IGRvIHlvdSBoYXZl
IGluIG1pbmQ/CgpBcyBhIGdlbmVyYWwgY29uZmlndXJhdGlvbiwgL2Rldi90dHlTMCB3aWxsIGJl
IGluZGljYXRlZCBhcyB0aGUgZGVmYXVsdCBjb25zb2xlPQp2YWx1ZS4uLiAoT3RoZXJ3aXNlIG1v
cmUgYm9hcmRzIHdpbGwgZmFpbCkKCk9yIG1heWJlIHdlIGNhbiBzcGVjaWZ5IHVhcnQwIGFzIHNl
cmlhbDAsIGFuZCBsZWF2ZSBpdCBhcyBkaXNhYmxlZD8gKFRodXMgaWYgdGhlCmRlYnVnIHBvcnQg
aXMgbmVlZGVkLCB3ZSBjYW4gZWFzaWx5IGFwcGx5IGEgb3ZlcmxheSB3aXRoICZtbWMwIHN0YXR1
cyBhcyBkaXNhYmxlZCwKYW5kICZ1YXJ0MCBzdGF0dXMgYXMgb2theSkKCk9uIGFsbCBteSBBMzMg
Ym9hcmRzLCB0aGUgb2ZmaWNpYWwgYm9vdDAsIHUtYm9vdCBhbGwgdXNlcyB1YXJ0MCBhcyBkZWJ1
Z2dpbmcgcG9ydC4KCj4KPiBNYXhpbWUKPgo+IC0tCj4gTWF4aW1lIFJpcGFyZCwgRnJlZSBFbGVj
dHJvbnMKPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cDovL2Zy
ZWUtZWxlY3Ryb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYXJtLWtlcm5lbAo=
