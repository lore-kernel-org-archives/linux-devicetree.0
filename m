From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v5 2/3] drm/arm: Add support for Mali Display Processors
Date: Wed, 15 Jun 2016 19:13:15 +0200
Message-ID: <CAKMK7uENW3cU8LccHcqffX3cbzax2-5mzY0101yLfR7vtD4CoA@mail.gmail.com>
References: <1466002295-24813-1-git-send-email-Liviu.Dudau@arm.com>
 <1466002295-24813-3-git-send-email-Liviu.Dudau@arm.com>
 <20160615152309.GI1338@phenom.ffwll.local>
 <20160615161758.GF9711@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160615161758.GF9711@e106497-lin.cambridge.arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: devicetree <devicetree@vger.kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, DRI devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBKdW4gMTUsIDIwMTYgYXQgNjoxNyBQTSwgTGl2aXUgRHVkYXUgPExpdml1LkR1ZGF1
QGFybS5jb20+IHdyb3RlOgo+IE9uIFdlZCwgSnVuIDE1LCAyMDE2IGF0IDA1OjIzOjEwUE0gKzAy
MDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE9uIFdlZCwgSnVuIDE1LCAyMDE2IGF0IDAzOjUx
OjM0UE0gKzAxMDAsIExpdml1IER1ZGF1IHdyb3RlOgo+PiA+IEFkZCBzdXBwb3J0IGZvciB0aGUg
bmV3IGZhbWlseSBvZiBEaXNwbGF5IFByb2Nlc3NvcnMgZnJvbSBBUk0gTHRkLgo+PiA+IFRoaXMg
Y29tbWl0IGFkZHMgYmFzaWMgc3VwcG9ydCBmb3IgTWFsaSBEUDUwMCwgRFA1NTAgYW5kIERQNjUw
Cj4+ID4gcGFydHMsIHdpdGggb25seSB0aGUgZGlzcGxheSBlbmdpbmUgYmVpbmcgc3VwcG9ydGVk
IGF0IHRoZSBtb21lbnQuCj4+ID4KPj4gPiBDYzogRGF2aWQgQnJvd24gPERhdmlkLkJyb3duQGFy
bS5jb20+Cj4+ID4gQ2M6IEJyaWFuIFN0YXJrZXkgPEJyaWFuLlN0YXJrZXlAYXJtLmNvbT4KPj4g
Pgo+PiA+IFNpZ25lZC1vZmYtYnk6IExpdml1IER1ZGF1IDxMaXZpdS5EdWRhdUBhcm0uY29tPgo+
Pgo+PiBTbWFsbCB0aGluZyBJIG5vdGljZWQ6IGRybV9kZXZfcmVnaXN0ZXIvY29ubmVjdG9yX3Jl
Z2lzdGVyX2FsbCBzaG91bGQgYmUKPj4gdGhlIGxhc3Qgc3RlcCBpbiB5b3VyIGluaXQgY29kZSwg
YW5kIHVucmVnaXN0ZXIgdGhlIGZpcnN0LiBBdG0gaXQncwo+PiBzb21ld2hlcmUgaW4gdGhlIG1p
ZGRsZS4gQnV0IHBlcmZlY3RseSBmaW5lIHRvIGRvIHRoYXQgYXMgYSBmb2xsb3ctdXAuCj4KPiBJ
J3ZlIHRyaWVkIHRoYXQsIGJ1dCB0aGUgY29ubmVjdG9yIGFuZCBlbmNvZGVyIHRoYXQgZ2V0cyBy
ZWdpc3RlcmVkIGFzIHBhcnQKPiBvZiB0aGUgY29tcG9uZW50X2JpbmRfYWxsKCkgZmFpbHMgaWYg
dGhlcmUgaXMgbm8gZHJtIGRldiByZWdpc3RlcmVkLiBZb3UgZGlkCj4gY29tbWVudCBvbiB0aGUg
djQgdmVyc2lvbiBhYm91dCB0aGF0IGFuZCBJIGRpZCB0ZXN0IHlvdXIgaWRlYSwgc29ycnkgZm9y
Cj4gZm9yZ2V0aW5nIHRvIHVwZGF0ZSB5b3Ugb24gdGhhdC4KCldoeSBkb2VzIGl0IGZhaWw/IFRo
YXQgc2hvdWxkbid0IGhhcHBlbiAuLi4gd2UgbmVlZCB0byBiZSBhYmxlIHRvIHNldAp1cCBldmVy
eXRoaW5nIGZpcnN0LCBiZWZvcmUgd2UgcmVnaXN0ZXIuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3
IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
