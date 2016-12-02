From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v2 2/3] ARM: dts: sunxi: add support for Orange Pi Zero
 board
Date: Fri, 02 Dec 2016 22:32:07 +0800
Message-ID: <11535601480689127@web2g.yandex.ru>
References: <20161121162421.800-1-icenowy@aosc.xyz>
 <20161121162421.800-2-icenowy@aosc.xyz> <5373671480239408@web31m.yandex.ru>
 <cdfd3c65-d473-badb-ea6a-035f7ab79217@arm.com>
 <20161201093619.gs6lmoxtlptp2jr6@lukather>
 <11498641480688550@web2g.yandex.ru>
 <efb30303-b9bb-7a7c-4478-af485991dd86@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <efb30303-b9bb-7a7c-4478-af485991dd86@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, =?utf-8?B?QW5kcsOpIFByenl3YXJh?= <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CgowMi4xMi4yMDE2LCAyMjozMCwgIkhhbnMgZGUgR29lZGUiIDxoZGVnb2VkZUByZWRoYXQuY29t
PjoKPiBIaSwKPgo+IE9uIDAyLTEyLTE2IDE1OjIyLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+PiDC
oDAxLjEyLjIwMTYsIDE3OjM2LCAiTWF4aW1lIFJpcGFyZCIgPG1heGltZS5yaXBhcmRAZnJlZS1l
bGVjdHJvbnMuY29tPjoKPj4+IMKgT24gTW9uLCBOb3YgMjgsIDIwMTYgYXQgMTI6Mjk6MDdBTSAr
MDAwMCwgQW5kcsOpIFByenl3YXJhIHdyb3RlOgo+Pj4+IMKgwqA+IFNvbWV0aGluZyBtb3JlIGlu
dGVyZXN0aW5nIGhhcHBlbmVkLgo+Pj4+IMKgwqA+Cj4+Pj4gwqDCoD4gWHVubG9uZyBtYWRlIGEg
YWRkLW9uIGJvYXJkIGZvciBPcmFuZ2UgUGkgWmVybywgd2hpY2ggZXhwb3NlcyB0aGUKPj4+PiDC
oMKgPiB0d28gVVNCIENvbnRyb2xsZXJzIGV4cG9ydGVkIGF0IGV4cGFuc2lvbiBidXMgYXMgVVNC
IFR5cGUtQQo+Pj4+IMKgwqA+IGNvbm5lY3RvcnMuCj4+Pj4gwqDCoD4KPj4+PiDCoMKgPiBBbHNv
IGl0IGV4cG9zZXMgYSBhbmFsb2cgQS9WIGphY2sgYW5kIGEgbWljcm9waG9uZS4KPj4+PiDCoMKg
Pgo+Pj4+IMKgwqA+IFNob3VsZCBJIGVuYWJsZSB7ZSxvfWhjaXsyLjN9IGluIHRoZSBkZXZpY2Ug
dHJlZT8KPj4+Pgo+Pj4+IMKgwqBBY3R1YWxseSB3ZSBzaG91bGQgZG8gdGhpcyByZWdhcmRsZXNz
IG9mIHRoaXMgZXh0ZW5zaW9uIGJvYXJkLiBUaGUgVVNCCj4+Pj4gwqDCoHBpbnMgYXJlIG5vdCBt
dWx0aXBsZXhlZCBhbmQgYXJlIGV4cG9zZWQgb24gdXNlciBhY2Nlc3NpYmxlIHBpbnMgKGp1c3QK
Pj4+PiDCoMKgbm90IHNvbGRlcmVkLCBidXQgdGhhdCdzIGEgZGV0YWlsKSwgc28gSSB0aGluayB0
aGV5IHF1YWxpZnkgZm9yIERUCj4+Pj4gwqDCoGVuYWJsZW1lbnQuIEFuZCBldmVuIGlmIGEgdXNl
ciBjYW4ndCB1c2UgdGhlbSwgaXQgZG9lc24ndCBodXJ0IHRvIGhhdmUKPj4+PiDCoMKgdGhlbSAo
c2luY2UgdGhleSBhcmUgbm90IG11bHRpcGxleGVkKS4KPj4+Cj4+PiDCoE15IG1haW4gY29uY2Vy
biBhYm91dCB0aGlzIGlzIHRoYXQgd2UnbGwgbGVhdmUgcmVndWxhdG9ycyBlbmFibGVkIGJ5Cj4+
PiDCoGRlZmF1bHQsIGZvciBhIG1pbm9yaXR5IG9mIHVzZXJzLiBBbmQgdGhhdCBtaW5vcml0eSB3
aWxsIHByZXZlbnQgdG8gZG8KPj4+IMKgYSBwcm9wZXIgcG93ZXIgbWFuYWdlbWVudCB3aGVuIHRo
ZSB0aW1lcyBjb21lIHNpbmNlIHdlJ2xsIGhhdmUgdG8ga2VlcAo+Pj4gwqB0aGF0IGJlaGF2aW91
ciBmb3JldmVyLgo+Pgo+PiDCoEkgdGhpbmsgdGhlc2UgdXNlcnMgY2FuIGFkZCBhICdmZHQgc2V0
IC94eHgveHh4IHN0YXR1cyAiZGlzYWJsZWQiICcgLgo+Cj4gSSBkb24ndCB0aGluayB0aGF0IHdp
bGwgYmUgbmVjZXNzYXJ5IEknbSBwcmV0dHkgc3VyZSB0aGVzZSBleHRyYSB1c2IKPiBwb3J0cyBk
byBub3QgaGF2ZSBhIHJlZ3VsYXRvciBmb3IgdGhlIFZidXMsIHRoZXkganVzdCBob29rIGRpcmVj
dGx5Cj4gdG8gdGhlIDVWIHJhaWwsIGNhbiBzb21lb25lIHdpdGggYSBzY2hlbWF0aWMgY2hlY2sg
PwoKV2Ugc2VlbXMgdG8gaGF2ZSBzdGlsbCBubyBzY2hlbWF0aWNzIGZvciB0aGUgYWRkLW9uIGJv
YXJkLgoKQnV0IHNvbWV0aGluZyBpcyBzdXJlIGlzIHRoYXQgdGhlcmUncyBubyBhbnkgcmVndWxh
dG9yLXJlbGF0ZWQgcGlucwpvbiB0aGUgYWRkLW9uIHBpbm91dC4gVGhlcmUncyBvbmx5IFVTQiBE
TSBhbmQgRFAgcGlucy4KClNvIHRoZSBWYnVzIG11c3QgYmUgZGlyZWN0bHkgY29ubmVjdGVkIHRv
ICs1Vi4KCj4KPiBSZWdhcmRzLAo+Cj4gSGFucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
