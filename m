From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: sunxi: add support for Orange Pi Zero
 board
Date: Fri, 2 Dec 2016 15:30:26 +0100
Message-ID: <efb30303-b9bb-7a7c-4478-af485991dd86@redhat.com>
References: <20161121162421.800-1-icenowy@aosc.xyz>
 <20161121162421.800-2-icenowy@aosc.xyz> <5373671480239408@web31m.yandex.ru>
 <cdfd3c65-d473-badb-ea6a-035f7ab79217@arm.com>
 <20161201093619.gs6lmoxtlptp2jr6@lukather>
 <11498641480688550@web2g.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <11498641480688550@web2g.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>, Maxime Ripard <maxime.ripard@free-electrons.com>, =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGksCgpPbiAwMi0xMi0xNiAxNToyMiwgSWNlbm93eSBaaGVuZyB3cm90ZToKPgo+Cj4gMDEuMTIu
MjAxNiwgMTc6MzYsICJNYXhpbWUgUmlwYXJkIiA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9u
cy5jb20+Ogo+PiBPbiBNb24sIE5vdiAyOCwgMjAxNiBhdCAxMjoyOTowN0FNICswMDAwLCBBbmRy
w6kgUHJ6eXdhcmEgd3JvdGU6Cj4+PiAgPiBTb21ldGhpbmcgbW9yZSBpbnRlcmVzdGluZyBoYXBw
ZW5lZC4KPj4+ICA+Cj4+PiAgPiBYdW5sb25nIG1hZGUgYSBhZGQtb24gYm9hcmQgZm9yIE9yYW5n
ZSBQaSBaZXJvLCB3aGljaCBleHBvc2VzIHRoZQo+Pj4gID4gdHdvIFVTQiBDb250cm9sbGVycyBl
eHBvcnRlZCBhdCBleHBhbnNpb24gYnVzIGFzIFVTQiBUeXBlLUEKPj4+ICA+IGNvbm5lY3RvcnMu
Cj4+PiAgPgo+Pj4gID4gQWxzbyBpdCBleHBvc2VzIGEgYW5hbG9nIEEvViBqYWNrIGFuZCBhIG1p
Y3JvcGhvbmUuCj4+PiAgPgo+Pj4gID4gU2hvdWxkIEkgZW5hYmxlIHtlLG99aGNpezIuM30gaW4g
dGhlIGRldmljZSB0cmVlPwo+Pj4KPj4+ICBBY3R1YWxseSB3ZSBzaG91bGQgZG8gdGhpcyByZWdh
cmRsZXNzIG9mIHRoaXMgZXh0ZW5zaW9uIGJvYXJkLiBUaGUgVVNCCj4+PiAgcGlucyBhcmUgbm90
IG11bHRpcGxleGVkIGFuZCBhcmUgZXhwb3NlZCBvbiB1c2VyIGFjY2Vzc2libGUgcGlucyAoanVz
dAo+Pj4gIG5vdCBzb2xkZXJlZCwgYnV0IHRoYXQncyBhIGRldGFpbCksIHNvIEkgdGhpbmsgdGhl
eSBxdWFsaWZ5IGZvciBEVAo+Pj4gIGVuYWJsZW1lbnQuIEFuZCBldmVuIGlmIGEgdXNlciBjYW4n
dCB1c2UgdGhlbSwgaXQgZG9lc24ndCBodXJ0IHRvIGhhdmUKPj4+ICB0aGVtIChzaW5jZSB0aGV5
IGFyZSBub3QgbXVsdGlwbGV4ZWQpLgo+Pgo+PiBNeSBtYWluIGNvbmNlcm4gYWJvdXQgdGhpcyBp
cyB0aGF0IHdlJ2xsIGxlYXZlIHJlZ3VsYXRvcnMgZW5hYmxlZCBieQo+PiBkZWZhdWx0LCBmb3Ig
YSBtaW5vcml0eSBvZiB1c2Vycy4gQW5kIHRoYXQgbWlub3JpdHkgd2lsbCBwcmV2ZW50IHRvIGRv
Cj4+IGEgcHJvcGVyIHBvd2VyIG1hbmFnZW1lbnQgd2hlbiB0aGUgdGltZXMgY29tZSBzaW5jZSB3
ZSdsbCBoYXZlIHRvIGtlZXAKPj4gdGhhdCBiZWhhdmlvdXIgZm9yZXZlci4KPgo+IEkgdGhpbmsg
dGhlc2UgdXNlcnMgY2FuIGFkZCBhICdmZHQgc2V0IC94eHgveHh4IHN0YXR1cyAiZGlzYWJsZWQi
ICcgLgoKSSBkb24ndCB0aGluayB0aGF0IHdpbGwgYmUgbmVjZXNzYXJ5IEknbSBwcmV0dHkgc3Vy
ZSB0aGVzZSBleHRyYSB1c2IKcG9ydHMgZG8gbm90IGhhdmUgYSByZWd1bGF0b3IgZm9yIHRoZSBW
YnVzLCB0aGV5IGp1c3QgaG9vayBkaXJlY3RseQp0byB0aGUgNVYgcmFpbCwgY2FuIHNvbWVvbmUg
d2l0aCBhIHNjaGVtYXRpYyBjaGVjayA/CgpSZWdhcmRzLAoKSGFucwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5n
IGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
