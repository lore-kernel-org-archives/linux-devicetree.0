From: Qiang Yu <yuq825@gmail.com>
Subject: Re: [PATCH RFC 12/24] drm/lima: add GP related functions
Date: Thu, 24 May 2018 08:38:31 +0800
Message-ID: <CAKGbVbsE7N=C3OwpFEQOmmD1urqWNbC-1hZiHGphiM8C6A4HXQ@mail.gmail.com>
References: <20180518092815.25280-1-yuq825@gmail.com>
 <20180518092815.25280-13-yuq825@gmail.com>
 <7b42a0c2-3737-327c-3829-0c322497b317@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <7b42a0c2-3737-327c-3829-0c322497b317@denx.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marek Vasut <marex@denx.de>
Cc: Simon Shields <simon@lineageos.org>, devicetree@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, Andrei Paulau <7134956@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBNYXkgMjQsIDIwMTggYXQgMToxMiBBTSwgTWFyZWsgVmFzdXQgPG1hcmV4QGRlbngu
ZGU+IHdyb3RlOgo+IE9uIDA1LzE4LzIwMTggMTE6MjggQU0sIFFpYW5nIFl1IHdyb3RlOgo+PiBH
UCBpcyBhIHByb2Nlc3NvciBmb3IgT3BlbkdMIHZlcnRleCBzaGFkZXIKPj4gcHJvY2Vzc2luZy4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogUWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5jb20+Cj4KPiBbLi4u
XQo+Cj4+ICtpbnQgbGltYV9ncF9pbml0KHN0cnVjdCBsaW1hX2lwICppcCkKPj4gK3sKPj4gKyAg
ICAgc3RydWN0IGxpbWFfZGV2aWNlICpkZXYgPSBpcC0+ZGV2Owo+PiArICAgICBpbnQgZXJyOwo+
PiArCj4+ICsgICAgIGxpbWFfZ3BfcHJpbnRfdmVyc2lvbihpcCk7Cj4+ICsKPj4gKyAgICAgaXAt
PmRhdGEuYXN5bmNfcmVzZXQgPSBmYWxzZTsKPj4gKyAgICAgbGltYV9ncF9zb2Z0X3Jlc2V0X2Fz
eW5jKGlwKTsKPj4gKyAgICAgZXJyID0gbGltYV9ncF9zb2Z0X3Jlc2V0X2FzeW5jX3dhaXQoaXAp
Owo+PiArICAgICBpZiAoZXJyKQo+PiArICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4+ICsKPj4g
KyAgICAgZXJyID0gZGV2bV9yZXF1ZXN0X2lycShkZXYtPmRldiwgaXAtPmlycSwgbGltYV9ncF9p
cnFfaGFuZGxlciwgMCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaW1hX2lwX25h
bWUoaXApLCBpcCk7Cj4KPiBJUlFGX1NIQVJFRCwgc2luY2UgdGhlcmUgYXJlIGRlc2lnbnMgKGxp
a2UgenlucW1wKSB3aGVyZSB0aGVyZSBpcyBvbmx5Cj4gb25lIElSUSBsaW5lIGZvciB0aGUgZW50
aXJlIEdQVS4KClJpZ2h0LCB3aWxsIGFkZCB0aGlzIGZsYWcuCgpSZWdhcmRzLApRaWFuZwoKPgo+
PiArICAgICBpZiAoZXJyKSB7Cj4+ICsgICAgICAgICAgICAgZGV2X2VycihkZXYtPmRldiwgImdw
ICVzIGZhaWwgdG8gcmVxdWVzdCBpcnFcbiIsCj4+ICsgICAgICAgICAgICAgICAgICAgICBsaW1h
X2lwX25hbWUoaXApKTsKPj4gKyAgICAgICAgICAgICByZXR1cm4gZXJyOwo+PiArICAgICB9Cj4+
ICsKPj4gKyAgICAgcmV0dXJuIDA7Cj4+ICt9Cj4KPgo+IFsuLi5dCj4KPiAtLQo+IEJlc3QgcmVn
YXJkcywKPiBNYXJlayBWYXN1dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
