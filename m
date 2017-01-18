From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v4] ARM64: dts: meson-gx: Add reserved memory zone and
 usable memory range
Date: Wed, 18 Jan 2017 01:27:16 +0100
Message-ID: <6bba535f-42bc-3e4b-129b-adc39152cfeb@suse.de>
References: <1484129414-23325-1-git-send-email-narmstrong@baylibre.com>
 <m21sw66828.fsf@baylibre.com> <d3a00788-c3c1-4b10-90bf-2a8bc6a138f8@suse.de>
 <7fcb8d94-840a-de2c-f43b-9123ccc65514@baylibre.com>
 <CAOesGMhYfhrd-hy=N-FYDEPmumR0=QNzn5xTLxFuKG7apo5qiw@mail.gmail.com>
 <ecb5ff50-f5d5-ffe6-0732-faf5e51906f8@baylibre.com>
 <04113569-e342-77ff-f79a-2c9c4dc4c602@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <04113569-e342-77ff-f79a-2c9c4dc4c602@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, xypron.glpk@gmx.de, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

QW0gMTguMDEuMjAxNyB1bSAwMTowMCBzY2hyaWViIEFuZHJlYXMgRsOkcmJlcjoKPiBBbSAxNy4w
MS4yMDE3IHVtIDA5OjIxIHNjaHJpZWIgTmVpbCBBcm1zdHJvbmc6Cj4+IFRoZSBzdHJlc3Mtbmcg
cGFja2FnZSBwcm92aWRlcyB0aGlzICJzdHJlc3MiIGNvbW1hbmQgYW5kIGlzIHVzZWQgdG8gZm9y
Y2UgdGhlIGtlcm5lbCB0byBtYXAgbW9yZSBtZW1vcnkKPj4gem9uZXMsIGJ1dCBJIGFsc28gZ290
IHRoZSBpc3N1ZSB3aGlsZSBydW5uaW5nIGEgZnVsbHkgZmxlZGdlZCBEZXNrdG9wIEVudmlyb25t
ZW50IHRoYW5rcyB0byB0aGUKPj4gcmVjZW50bHkgbWVyZ2VkIERSTSBkcml2ZXIuCj4+IFlvdSBt
YXkgbm90IGJlIGFibGUgdG8gdHJpZ2dlciB0aGUgaXNzdWUgc2luY2UgaXQgc2VlbXMgQW1sb2dp
YyByZWR1Y2VzIHRoaXMgcmVzZXJ2ZWQgc2l6ZSBvbiBHWEwvR1hNIDoKPj4gaHR0cHM6Ly9naXRo
dWIuY29tL2toYWRhcy9saW51eC9jb21taXQvNjk4ZGYyYzZjZmJiMGQxYTkzNTk3NDMyMDhlODM1
MTdiMzFkYTZjZQo+PiBCdXQgaXQgc2hvdWxkIGJlIGNvbmZpcm1lZC4KPiAKPiBDb25maXJtaW5n
IG5vIGlzc3VlcyBvbiB0aHJlZSBydW5zIG9uIG1lc29uLWd4bS1yYm94LXBybzoKPiAKPiBib3hl
cjp+ICMgc3RyZXNzLW5nIC0tdm0gNCAtLXZtLWJ5dGVzIDEyOE0gLS10aW1lb3V0IDEwcyAmCj4g
WzFdIDI1MjgKPiBib3hlcjp+ICMgc3RyZXNzLW5nOiBpbmZvOiAgWzI1MjhdIGRpc3BhdGNoaW5n
IGhvZ3M6IDQgdm0KPiBzdHJlc3Mtbmc6IGluZm86ICBbMjUyOF0gY2FjaGUgYWxsb2NhdGU6IGRl
ZmF1bHQgY2FjaGUgc2l6ZTogMjU2Swo+IHN0cmVzcy1uZzogaW5mbzogIFsyNTI4XSBzdWNjZXNz
ZnVsIHJ1biBjb21wbGV0ZWQgaW4gMTAuMDdzCj4gCj4gWzFdKyAgRG9uZSAgICAgICAgICAgICAg
ICAgICAgc3RyZXNzLW5nIC0tdm0gNCAtLXZtLWJ5dGVzIDEyOE0gLS10aW1lb3V0IDEwcwo+IGJv
eGVyOn4gIyBzdHJlc3MtbmcgLS12bSA0IC0tdm0tYnl0ZXMgMTI4TSAtLXRpbWVvdXQgMTBzCj4g
c3RyZXNzLW5nOiBpbmZvOiAgWzI1MzddIGRpc3BhdGNoaW5nIGhvZ3M6IDQgdm0KPiBzdHJlc3Mt
bmc6IGluZm86ICBbMjUzN10gY2FjaGUgYWxsb2NhdGU6IGRlZmF1bHQgY2FjaGUgc2l6ZTogMjU2
Swo+IHN0cmVzcy1uZzogaW5mbzogIFsyNTM3XSBzdWNjZXNzZnVsIHJ1biBjb21wbGV0ZWQgaW4g
MTAuMDdzCj4gYm94ZXI6fiAjIHN0cmVzcy1uZyAtLXZtIDQgLS12bS1ieXRlcyAxMjhNIC0tdGlt
ZW91dCAxMHMKPiBzdHJlc3Mtbmc6IGluZm86ICBbMjU0Nl0gZGlzcGF0Y2hpbmcgaG9nczogNCB2
bQo+IHN0cmVzcy1uZzogaW5mbzogIFsyNTQ2XSBjYWNoZSBhbGxvY2F0ZTogZGVmYXVsdCBjYWNo
ZSBzaXplOiAyNTZLCj4gc3RyZXNzLW5nOiBpbmZvOiAgWzI1NDZdIHN1Y2Nlc3NmdWwgcnVuIGNv
bXBsZXRlZCBpbiAxMC4wN3MKPiBib3hlcjp+ICMKClNpbWlsYXIgcmVzdWx0cyBvbiBtZXNvbi1n
eGJiLXZlZ2Etczk1LXRlbG9zIChleGNlcHQgNTEySyBjYWNoZSBzaXplKSwKd2l0aCBib3RoIG1h
aW5saW5lIEVGSSBhbmQgdmVuZG9yIFUtQm9vdC4KCkkgbm90aWNlIHRoYXQgSSBkb24ndCBoYXZl
IENPTkZJR19EUk0gZW5hYmxlZCAtIG1heWJlIHJlbGF0ZWQ/CgpSZWdhcmRzLApBbmRyZWFzCgot
LSAKU1VTRSBMaW51eCBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkKR0Y6IEZlbGl4IEltZW5kw7ZyZmZlciwgSmFuZSBTbWl0aGFyZCwgR3JhaGFtIE5vcnRvbgpI
UkIgMjEyODQgKEFHIE7DvHJuYmVyZykKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
