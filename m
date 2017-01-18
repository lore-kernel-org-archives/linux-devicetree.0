From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4] ARM64: dts: meson-gx: Add reserved memory zone and
 usable memory range
Date: Wed, 18 Jan 2017 11:58:08 +0100
Message-ID: <0d34e6b4-17cc-cfa3-4d10-6a4dc2afbf98@baylibre.com>
References: <1484129414-23325-1-git-send-email-narmstrong@baylibre.com>
 <m21sw66828.fsf@baylibre.com> <d3a00788-c3c1-4b10-90bf-2a8bc6a138f8@suse.de>
 <7fcb8d94-840a-de2c-f43b-9123ccc65514@baylibre.com>
 <CAOesGMhYfhrd-hy=N-FYDEPmumR0=QNzn5xTLxFuKG7apo5qiw@mail.gmail.com>
 <ecb5ff50-f5d5-ffe6-0732-faf5e51906f8@baylibre.com>
 <04113569-e342-77ff-f79a-2c9c4dc4c602@suse.de>
 <6bba535f-42bc-3e4b-129b-adc39152cfeb@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6bba535f-42bc-3e4b-129b-adc39152cfeb@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, xypron.glpk@gmx.de, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMDEvMTgvMjAxNyAwMToyNyBBTSwgQW5kcmVhcyBGw6RyYmVyIHdyb3RlOgo+IEFtIDE4LjAx
LjIwMTcgdW0gMDE6MDAgc2NocmllYiBBbmRyZWFzIEbDpHJiZXI6Cj4+IEFtIDE3LjAxLjIwMTcg
dW0gMDk6MjEgc2NocmllYiBOZWlsIEFybXN0cm9uZzoKPj4+IFRoZSBzdHJlc3MtbmcgcGFja2Fn
ZSBwcm92aWRlcyB0aGlzICJzdHJlc3MiIGNvbW1hbmQgYW5kIGlzIHVzZWQgdG8gZm9yY2UgdGhl
IGtlcm5lbCB0byBtYXAgbW9yZSBtZW1vcnkKPj4+IHpvbmVzLCBidXQgSSBhbHNvIGdvdCB0aGUg
aXNzdWUgd2hpbGUgcnVubmluZyBhIGZ1bGx5IGZsZWRnZWQgRGVza3RvcCBFbnZpcm9ubWVudCB0
aGFua3MgdG8gdGhlCj4+PiByZWNlbnRseSBtZXJnZWQgRFJNIGRyaXZlci4KPj4+IFlvdSBtYXkg
bm90IGJlIGFibGUgdG8gdHJpZ2dlciB0aGUgaXNzdWUgc2luY2UgaXQgc2VlbXMgQW1sb2dpYyBy
ZWR1Y2VzIHRoaXMgcmVzZXJ2ZWQgc2l6ZSBvbiBHWEwvR1hNIDoKPj4+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9raGFkYXMvbGludXgvY29tbWl0LzY5OGRmMmM2Y2ZiYjBkMWE5MzU5NzQzMjA4ZTgzNTE3
YjMxZGE2Y2UKPj4+IEJ1dCBpdCBzaG91bGQgYmUgY29uZmlybWVkLgo+Pgo+PiBDb25maXJtaW5n
IG5vIGlzc3VlcyBvbiB0aHJlZSBydW5zIG9uIG1lc29uLWd4bS1yYm94LXBybzoKPj4KPj4gYm94
ZXI6fiAjIHN0cmVzcy1uZyAtLXZtIDQgLS12bS1ieXRlcyAxMjhNIC0tdGltZW91dCAxMHMgJgo+
PiBbMV0gMjUyOAo+PiBib3hlcjp+ICMgc3RyZXNzLW5nOiBpbmZvOiAgWzI1MjhdIGRpc3BhdGNo
aW5nIGhvZ3M6IDQgdm0KPj4gc3RyZXNzLW5nOiBpbmZvOiAgWzI1MjhdIGNhY2hlIGFsbG9jYXRl
OiBkZWZhdWx0IGNhY2hlIHNpemU6IDI1NksKPj4gc3RyZXNzLW5nOiBpbmZvOiAgWzI1MjhdIHN1
Y2Nlc3NmdWwgcnVuIGNvbXBsZXRlZCBpbiAxMC4wN3MKPj4KPj4gWzFdKyAgRG9uZSAgICAgICAg
ICAgICAgICAgICAgc3RyZXNzLW5nIC0tdm0gNCAtLXZtLWJ5dGVzIDEyOE0gLS10aW1lb3V0IDEw
cwo+PiBib3hlcjp+ICMgc3RyZXNzLW5nIC0tdm0gNCAtLXZtLWJ5dGVzIDEyOE0gLS10aW1lb3V0
IDEwcwo+PiBzdHJlc3Mtbmc6IGluZm86ICBbMjUzN10gZGlzcGF0Y2hpbmcgaG9nczogNCB2bQo+
PiBzdHJlc3Mtbmc6IGluZm86ICBbMjUzN10gY2FjaGUgYWxsb2NhdGU6IGRlZmF1bHQgY2FjaGUg
c2l6ZTogMjU2Swo+PiBzdHJlc3Mtbmc6IGluZm86ICBbMjUzN10gc3VjY2Vzc2Z1bCBydW4gY29t
cGxldGVkIGluIDEwLjA3cwo+PiBib3hlcjp+ICMgc3RyZXNzLW5nIC0tdm0gNCAtLXZtLWJ5dGVz
IDEyOE0gLS10aW1lb3V0IDEwcwo+PiBzdHJlc3Mtbmc6IGluZm86ICBbMjU0Nl0gZGlzcGF0Y2hp
bmcgaG9nczogNCB2bQo+PiBzdHJlc3Mtbmc6IGluZm86ICBbMjU0Nl0gY2FjaGUgYWxsb2NhdGU6
IGRlZmF1bHQgY2FjaGUgc2l6ZTogMjU2Swo+PiBzdHJlc3Mtbmc6IGluZm86ICBbMjU0Nl0gc3Vj
Y2Vzc2Z1bCBydW4gY29tcGxldGVkIGluIDEwLjA3cwo+PiBib3hlcjp+ICMKPiAKPiBTaW1pbGFy
IHJlc3VsdHMgb24gbWVzb24tZ3hiYi12ZWdhLXM5NS10ZWxvcyAoZXhjZXB0IDUxMksgY2FjaGUg
c2l6ZSksCj4gd2l0aCBib3RoIG1haW5saW5lIEVGSSBhbmQgdmVuZG9yIFUtQm9vdC4KPiAKPiBJ
IG5vdGljZSB0aGF0IEkgZG9uJ3QgaGF2ZSBDT05GSUdfRFJNIGVuYWJsZWQgLSBtYXliZSByZWxh
dGVkPwoKWWVzLCBJdCBtYXkgYWRkIG1vcmUgcHJlc3N1cmUgb24gdGhlIG1lbW9yeSBhbGxvY2F0
aW9uLgoKTmVpbAoKPiAKPiBSZWdhcmRzLAo+IEFuZHJlYXMKPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcg
bGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
