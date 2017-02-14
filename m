From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 1/7] drm: Add DRM support for tiny LCD displays
Date: Tue, 14 Feb 2017 20:54:28 +0100
Message-ID: <CAKMK7uF1AYwZGXrpCk01Uy-n8-Wsnr7XX-SxbGgJnMhA28APSw@mail.gmail.com>
References: <20170211184858.26421-1-noralf@tronnes.org>
 <20170211184858.26421-2-noralf@tronnes.org>
 <CAHp75VeZke=JCosvc3xQ_AiOn64hth=PMJp4X0vLHMS14bkp4w@mail.gmail.com>
 <70190e71-4d5a-7102-418f-09896b57c084@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <70190e71-4d5a-7102-418f-09896b57c084@tronnes.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree <devicetree@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

T24gU3VuLCBGZWIgMTIsIDIwMTcgYXQgMjo1NyBQTSwgTm9yYWxmIFRyw7hubmVzIDxub3JhbGZA
dHJvbm5lcy5vcmc+IHdyb3RlOgo+IHRpbnlkcm0gd2lsbCBiZSBtZXJnZWQgdGhlIHdheSBpdCBp
cyBub3csIHVubGVzcyBzb21lb25lIHBvaW50cyB0bwo+IHNvbWV0aGluZyB0aGF0IGlzIGJyb2tl
bi4gQnV0IEkgY29sbGVjdCB5b3VyIGNvbW1lbnRzIGZvciBhIGxhdGVyCj4gY2xlYW51cCBwYXRj
aHNldC4gSXQgdGFrZXMgYSBsb3Qgb2YgZWZmb3J0IGZvciBtZSBhcyBhbiBhbWF0ZXVyIHRvCj4g
a2VlcHMgdGhpcyBjb2RlIHVwLXRvLWRhdGUgb3V0LW9mLXRyZWUgZm9yIG1vbnRocy4gSXQncyBu
b3QgZXZlbgo+IHN1cmUgdGhhdCBJJ3ZlIGhpdCB0aGUgbWFyayB3aXRoIHRoaXMsIHNvIHRoZXJl
IHdpbGwgbW9zdCBsaWtlbHkgYmUKPiBjaGFuZ2VzIHdoZW4gSSBzdGFydCBjb252ZXJ0aW5nIGZi
dGZ0IGRyaXZlcnMsIGFuZCBJJ2xsIGltcGxlbWVudCB0aGUKPiByZW1haW5pbmcgYml0cyBhbmQg
cGllY2VzIGFzIEkgbWFrZSBjaGFuZ2VzLiBUaGUgY29yZSBvZiB0aW55ZHJtIHdvbid0Cj4gY2hh
bmdlIGJlY2F1c2Ugb2YgdW5mb3JzZWVuIGZidGZ0IHF1aXJrcywgYnV0IG90aGVyIHBhcnRzIG1p
Z2h0LgoKKzEsIHBscyBzZW5kIHB1bGwgcmVxdWVzdCB0byBEYXZlIEFpcmxpZS4gRFQtYWNrcyBh
cmUgYWxsIHRoZXJlLCBhbmQKVGhpZXJyeSBjb25maXJtZWQgb24gaXJjIHRoYXQgaGlzIHJlcGx5
IG9uIHRoZSBsYXN0IHRocmVhZCB3YXMgaW5kZWVkCm1lYW50IGFzIGEgZnVsbCBhY2sgZm9yIGdv
aW5nIGFoZWFkIGFuZCBwb2xpc2hpbmcgbGF0ZXIuIEkgYWxzbwpjaGF0dGVkIHdpdGggRGF2ZSBk
aXJlY3RseSwgYW5kIGhlJ3MgcGVyZmVjdGx5IGhhcHB5IHRvIHRha2UgdGhpcyBpbgphcy1pcy4g
SWYgeW91IGRvIHRoaXMgc29vbiwgc2hvdWxkIHN0aWxsIGVhc2lseSBnZXQgaW50byA0LjExIChz
aW5jZQp0aGUgNC4xMCByZWxlYXNlIGlzIGRlbGF5ZWQpLgoKQ2hlZXJzLCBEYW5pZWwKLS0gCkRh
bmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkg
NzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
