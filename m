From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v2 2/3] ARM: dts: sunxi: add support for Orange Pi Zero
 board
Date: Fri, 02 Dec 2016 22:22:30 +0800
Message-ID: <11498641480688550@web2g.yandex.ru>
References: <20161121162421.800-1-icenowy@aosc.xyz>
 <20161121162421.800-2-icenowy@aosc.xyz>
 <5373671480239408@web31m.yandex.ru>
 <cdfd3c65-d473-badb-ea6a-035f7ab79217@arm.com>
 <20161201093619.gs6lmoxtlptp2jr6@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161201093619.gs6lmoxtlptp2jr6@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, =?utf-8?B?QW5kcsOpIFByenl3YXJh?= <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CgowMS4xMi4yMDE2LCAxNzozNiwgIk1heGltZSBSaXBhcmQiIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT46Cj4gT24gTW9uLCBOb3YgMjgsIDIwMTYgYXQgMTI6Mjk6MDdBTSArMDAw
MCwgQW5kcsOpIFByenl3YXJhIHdyb3RlOgo+PiDCoD4gU29tZXRoaW5nIG1vcmUgaW50ZXJlc3Rp
bmcgaGFwcGVuZWQuCj4+IMKgPgo+PiDCoD4gWHVubG9uZyBtYWRlIGEgYWRkLW9uIGJvYXJkIGZv
ciBPcmFuZ2UgUGkgWmVybywgd2hpY2ggZXhwb3NlcyB0aGUKPj4gwqA+IHR3byBVU0IgQ29udHJv
bGxlcnMgZXhwb3J0ZWQgYXQgZXhwYW5zaW9uIGJ1cyBhcyBVU0IgVHlwZS1BCj4+IMKgPiBjb25u
ZWN0b3JzLgo+PiDCoD4KPj4gwqA+IEFsc28gaXQgZXhwb3NlcyBhIGFuYWxvZyBBL1YgamFjayBh
bmQgYSBtaWNyb3Bob25lLgo+PiDCoD4KPj4gwqA+IFNob3VsZCBJIGVuYWJsZSB7ZSxvfWhjaXsy
LjN9IGluIHRoZSBkZXZpY2UgdHJlZT8KPj4KPj4gwqBBY3R1YWxseSB3ZSBzaG91bGQgZG8gdGhp
cyByZWdhcmRsZXNzIG9mIHRoaXMgZXh0ZW5zaW9uIGJvYXJkLiBUaGUgVVNCCj4+IMKgcGlucyBh
cmUgbm90IG11bHRpcGxleGVkIGFuZCBhcmUgZXhwb3NlZCBvbiB1c2VyIGFjY2Vzc2libGUgcGlu
cyAoanVzdAo+PiDCoG5vdCBzb2xkZXJlZCwgYnV0IHRoYXQncyBhIGRldGFpbCksIHNvIEkgdGhp
bmsgdGhleSBxdWFsaWZ5IGZvciBEVAo+PiDCoGVuYWJsZW1lbnQuIEFuZCBldmVuIGlmIGEgdXNl
ciBjYW4ndCB1c2UgdGhlbSwgaXQgZG9lc24ndCBodXJ0IHRvIGhhdmUKPj4gwqB0aGVtIChzaW5j
ZSB0aGV5IGFyZSBub3QgbXVsdGlwbGV4ZWQpLgo+Cj4gTXkgbWFpbiBjb25jZXJuIGFib3V0IHRo
aXMgaXMgdGhhdCB3ZSdsbCBsZWF2ZSByZWd1bGF0b3JzIGVuYWJsZWQgYnkKPiBkZWZhdWx0LCBm
b3IgYSBtaW5vcml0eSBvZiB1c2Vycy4gQW5kIHRoYXQgbWlub3JpdHkgd2lsbCBwcmV2ZW50IHRv
IGRvCj4gYSBwcm9wZXIgcG93ZXIgbWFuYWdlbWVudCB3aGVuIHRoZSB0aW1lcyBjb21lIHNpbmNl
IHdlJ2xsIGhhdmUgdG8ga2VlcAo+IHRoYXQgYmVoYXZpb3VyIGZvcmV2ZXIuCgpJIHRoaW5rIHRo
ZXNlIHVzZXJzIGNhbiBhZGQgYSAnZmR0IHNldCAveHh4L3h4eCBzdGF0dXMgImRpc2FibGVkIiAn
IC4KCj4KPiBNYXhpbWUKPgo+IC0tCj4gTWF4aW1lIFJpcGFyZCwgRnJlZSBFbGVjdHJvbnMKPiBF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cDovL2ZyZWUtZWxlY3Ry
b25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYXJtLWtlcm5lbAo=
