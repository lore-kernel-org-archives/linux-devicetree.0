From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 2/4] drm/tinydrm: add support for LEGO MINDSTORMS EV3
 LCD
Date: Wed, 2 Aug 2017 11:24:23 -0500
Message-ID: <3244660b-64f6-8202-b505-a9796b888db5@lechnology.com>
References: <1501625510-16727-1-git-send-email-david@lechnology.com>
 <1501625510-16727-3-git-send-email-david@lechnology.com>
 <32b134d1-84f3-8e3d-1d57-05c8b7c384bc@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <32b134d1-84f3-8e3d-1d57-05c8b7c384bc@tronnes.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gMDgvMDIvMjAxNyAwODowMyBBTSwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+IAo+IAo+IFBs
ZWFzZSB1c2UgdGlueWRybV94cmdiODg4OF90b19ncmF5OCgpLgoKSSBjb25zaWRlcmVkIHRoaXMs
IGJ1dCBpcyBzZWVtcyBleGNlc3NpdmUgdG8gbG9vcCB0aHJvdWdoIHRoZSBlbnRpcmUgZmIgCnR3
aWNlIGp1c3QgdG8gbWFrZSBhIDR4NiBjdXJzb3IgYmxpbmsuCgo+IFlvdSBzaG91bGQgdXNlIHRo
aXMgZnVuY3Rpb24gdG8gZW5hYmxlIHRoZSByZWd1bGF0b3IgYW5kIGluaXQgdGhlCj4gY29udHJv
bGxlci4gRG9uJ3QgbG9vayBhdCBtaTAyODNxdCBpdCBzaG91bGQgaGF2ZSBiZWVuIGZpeGVkLgoK
QUNLLiBCdXQgdGhpcyBpcyB3aHkgSSB3YXMgbm90IGtlZW4gb24gd3JpdGluZyBhIHN0YW5kYWxv
bmUgZHJpdmVyLiBJIAprbm93IHNvbWUgdGhpbmdzIGFib3V0IGtlcm5lbCBkZXZlbG9wbWVudCwg
YnV0IG5vdCBldmVyeXRoaW5nLiBIb3cgYW0gSSAKc3VwcG9zZWQgdG8ga25vdyB3aGF0IGlzIE9L
IHRvIGNvcHkgZnJvbSBvdGhlciBkcml2ZXJzIGFuZCB3aGF0IGlzIG5vdD8gCkFuZCBpZiBJIGFt
IGdvaW5nIHRvIGJlIHB1dCBkb3duIGFzIHRoZSBtYWludGFpbmVyIG9mIHRoaXMgZHJpdmVyLCBp
dCAKYm90aGVycyBtZSB0aGF0IEkgZG9uJ3Qga25vdyBzbyBtdWNoIGFib3V0IGhvdyBpdCBhbGwg
d29ya3MuCgo+IAo+IFdoeSAyIGVtdWxhdGlvbiBmb3JtYXRzPwo+IEkgY2hvc2UgRFJNX0ZPUk1B
VF9YUkdCODg4OCBzaW5jZSBJIGV4cGVjdGVkIGV2ZXJ5dGhpbmcgdG8gc3VwcG9ydCBpdC4KPiBQ
bGVhc2UgdXNlIG9ubHkgdGhhdC4KCkJlY2F1c2UgbXkgZ3JhcGhpY3MgbGlicmFyeSBjdXJyZW50
bHkgZG9lcyBub3Qgd29yayB3aXRoIFhSR0I4ODg4LiA7LSkKCkkgY2FuIGZpeCB0aGUgZ3JhcGhp
Y3MgbGlicmFyeSBhbmQgZHJvcCB0aGUgUkdCNTY1IGZvcm1hdCBpbiB0aGUga2VybmVsIApkcml2
ZXIuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
