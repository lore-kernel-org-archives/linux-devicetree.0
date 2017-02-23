From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add basic DT for Linksys EA9500
Date: Thu, 23 Feb 2017 14:03:23 +0100
Message-ID: <CACna6rxMH5zz+zLxrZ+6F_aaQ-sXMEMpHE-oGyZA5B6kzq-8cA@mail.gmail.com>
References: <20170223104025.5755-1-zajec5@gmail.com>
 <bd36df47-cefe-5736-e02c-621a21ae1b7a@openwrt.org>
 <CACna6rzN-OQv4UJoRso_Kyf1rCEtuU5Lu9LDjvTTt011UgrA=Q@mail.gmail.com>
 <5c57772b-71fd-d9e2-efe6-1175cf048e0b@openwrt.org>
 <CACna6rzeuy+-0cQCUCrXYBnLv-twrzVvd65L6LANPPejarWAWQ@mail.gmail.com>
 <e756072c-f633-2507-ec58-7dfbf037f582@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e756072c-f633-2507-ec58-7dfbf037f582@openwrt.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Imre Kaloz <kaloz@openwrt.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMjMgRmVicnVhcnkgMjAxNyBhdCAxMzo1OSwgSW1yZSBLYWxveiA8a2Fsb3pAb3BlbndydC5v
cmc+IHdyb3RlOgo+IE9uIDIwMTctMDItMjMgMTM6NTEsIFJhZmHFgiBNacWCZWNraSB3cm90ZToK
Pj4KPj4gT24gMjMgRmVicnVhcnkgMjAxNyBhdCAxMzo0NCwgSW1yZSBLYWxveiA8a2Fsb3pAb3Bl
bndydC5vcmc+IHdyb3RlOgo+Pj4KPj4+IE9uIDIwMTctMDItMjMgMTM6MjksIFJhZmHFgiBNacWC
ZWNraSB3cm90ZToKPj4+Pgo+Pj4+IE9uIDIzIEZlYnJ1YXJ5IDIwMTcgYXQgMTM6MjcsIEltcmUg
S2Fsb3ogPGthbG96QG9wZW53cnQub3JnPiB3cm90ZToKPj4+Pj4KPj4+Pj4gQXMgZGlzY3Vzc2Vk
IGZvciBvdGhlciBwbGF0Zm9ybXMgYXMgd2VsbCwgcGxlYXNlIHVzZSB0aGUgYm9hcmQncyBuYW1l
Cj4+Pj4+IGFzCj4+Pj4+IHRoZQo+Pj4+PiBzYW1lIGJvYXJkIGNhbiBlbmQgdXAgYmVpbmcgc29s
ZCB1bmRlciBtdWx0aXBsZSBtb2RlbCBudW1iZXJzLgo+Pj4+Pgo+Pj4+PiBTbyBwbGVhc2UgcmVu
YW1lIHRoZSBmaWxlIHRvIGJjbTQ3MDk0LWxpbmtzeXMtcGFuYW1lcmEuZHRzCj4+Pj4KPj4+PiBI
dWg/IFdoZXJlIGRpZCB5b3UgZ2V0IHBhbmFtZXJhIG5hbWUgZnJvbT8hCj4+Pgo+Pj4gWW91ciBt
YW5uZXJzIHNoaW5lIG9uIHRoZXNlIGRhcmsgZGF5cyBvZiB3aW50ZXIuIEZvciBhYm91dCBhIGRl
Y2FkZSBub3csCj4+PiBodHRwOi8vMTkyLjE2OC4xLjEvc3lzaW5mby5jZ2kgd2lsbCBzaG93IHlv
dSBxdWl0ZSBhIGJpdCBvZiBpbmZvcm1hdGlvbgo+Pj4gaWYKPj4+IHlvdSBhcmUgdG9vIGxhenkg
dG8gbG9vayBpbnRvIHRoZSBHUEwgdGFyYmFsbCBvciBhdCB0aGUgb3JpZ2luYWwKPj4+IGJvb3Rs
b2dzLgo+Pgo+PiBTYWRseSBMaW5rc3lzIGRvZXNuJ3Qgc3BvbnNvciBtZSBvciBwcm92aWRlIG1l
IGFueSBoYXJkd2FyZS4gVGhlCj4+IGJvb3Rsb2dzIEkgZm91bmQ6Cj4+IGh0dHBzOi8vd3d3LnNu
YmZvcnVtcy5jb20vdGhyZWFkcy9lYTk1MDAtc2VyaWFsLWNvbnNvbGUtdG8tY2ZlLjM1MjI4Lwo+
PiBodHRwOi8vd3d3LmRkLXdydC5jb20vcGhwQkIyL3ZpZXd0b3BpYy5waHA/dD0yODg0NzAmc3Rh
cnQ9MzAKPj4gZGlkbid0IGluY2x1ZGUgYm9hcmQgbmFtZS4gQXMgeW91IHByb2JhYmx5IGNhbiBn
dWVzcwo+PiBodHRwOi8vMTkyLjE2OC4xLjEvIHdhcyB1c2VmdWwgaW4gbXkgY2FzZSBhcyB3ZWxs
Lgo+Pgo+Cj4gSSd2ZSBndWVzc2VkIHlvdSBoYXZlIHRoZSBoYXJkd2FyZSAtIHNvIHlvdSdyZSBz
dWJtaXR0aW5nIGR0cyBmaWxlcyB3aXRob3V0Cj4gdGVzdGluZyBpdD8gSSBrbm93IHRoZXkgZG9u
J3QgZG8gbXVjaCwgYnV0IHN0aWxsLCB0aGlzIGlzIGFuIGludGVyZXN0aW5nCj4gY29uY2VwdC4K
CkknbSBzZW5kaW5nIHdoYXQgd2FzIHRlc3RlZCBieSBFQTk1MDAgdXNlcjoKaHR0cHM6Ly9mb3J1
bS5sZWRlLXByb2plY3Qub3JnL3QvbGVkZS10ZXN0ZWQtb24tbGlua3N5cy1lYTk1MDAvMTYxMgoK
SSdtIHBsYW5uaW5nIHRvIGFkZCBiZXR0ZXIgc3VwcG9ydCBmb3IgdGhpcyBkZXZpY2UsIGJ1dCBp
dCByZXF1aXJlcwpleHRyYSB0ZXN0aW5nIHdoaWNoIG1heSB0YWtlIHNvbWUgdGltZS4gU28gSSBq
dXN0IHN0YXJ0ZWQgd2l0aCB3aGF0IEkKY2FuIHByb3ZpZGUgc28gZmFyLgoKLS0gClJhZmHFggoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtl
cm5lbAo=
