From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/3] drm: rcar-du: use of_graph_get_remote_endpoint()
Date: Thu, 29 Jun 2017 14:26:56 +0300
Message-ID: <2319141.h6UJ5H9hiK@avalon>
References: <87mv8tez69.wl%kuninori.morimoto.gx@renesas.com>
 <2246315.6ZutvAkGUK@avalon>
 <CAMuHMdUF-y38M3R4=fhb547aiF=+qwOpjipAXaThkQiTMQz7fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAMuHMdUF-y38M3R4=fhb547aiF=+qwOpjipAXaThkQiTMQz7fg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgR2VlcnQsCgpPbiBUaHVyc2RheSAyOSBKdW4gMjAxNyAxMzoyMjoxNCBHZWVydCBVeXR0ZXJo
b2V2ZW4gd3JvdGU6Cj4gT24gVGh1LCBKdW4gMjksIDIwMTcgYXQgMTI6NDQgUE0sIExhdXJlbnQg
UGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBXZWRuZXNkYXkgMjggSnVuIDIwMTcgMDA6MzI6MTcgS3Vu
aW5vcmkgTW9yaW1vdG8gd3JvdGU6Cj4gPj4gRnJvbTogS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlu
b3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgo+ID4+IAo+ID4+IE5vdywgd2UgY2FuIHVzZSBv
Zl9ncmFwaF9nZXRfcmVtb3RlX2VuZHBvaW50KCkuIExldCdzIHVzZSBpdC4KPiA+PiAKPiA+PiBT
aWduZWQtb2ZmLWJ5OiBLdW5pbm9yaSBNb3JpbW90byA8a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVu
ZXNhcy5jb20+Cj4gPiAKPiA+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiAKPiA+PiAtLS0KPiA+PiBiYXNlZCBvbiA0
YzljM2Q1OTVmMWJhZDAyMWNjMTI2ZDIwODc5ZGY0MDE2ODAxNzM2Cj4gPj4gKCJvZl9ncmFwaDog
YWRkIG9mX2dyYXBoX2dldF9yZW1vdGVfZW5kcG9pbnQoKSIpCj4gPiAKPiA+IFRoaXMgY29tbWl0
IGlzbid0IHVwc3RyZWFtIHlldC4gSSd2ZSB0YWtlbiB0aGUgcGF0Y2ggaW4gbXkgdHJlZSBhbmQg
d2lsbAo+IAo+IEZUUiwgaXQgaXMgaW4gbGludXgtbmV4dCwgYnV0IHRoZSBmdW5jdGlvbiBoYXMg
YmVlbiBtb3ZlZCBmcm9tCj4gZHJpdmVycy9vZi9iYXNlLmMgdG8gZHJpdmVycy9vZi9wcm9wZXJ0
eS5jLgoKWWVzLCBJJ3ZlIHNlZW4gdGhlIHBhdGNoIGluIGxpbnV4LW5leHQuCgo+ID4gcmViYXNl
IGl0IG9uIHRvcCBvZiB2NC4xMy1yYzEgYmVmb3JlIHN1Ym1pdHRpbmcgaXQgZm9yIHY0LjE0Lgo+
IAo+IE5vdGUgdGhhdCBhIHNpbXBsZSByZWJhc2Ugd29uJ3QgbWFrZSBpdCBkaXNhcHBlYXIsIGR1
ZSB0byB0aGUgbW92ZS4KPiBTbyB5b3UnbGwgaGF2ZSB0byBkcm9wIGl0IGV4cGxpY2l0bHkuCgpJ
J20gbm90IHN1cmUgdG8gZm9sbG93IHlvdS4gVGhpcyBpcyBhIGRyaXZlciBwYXRjaCwgZGVwZW5k
aW5nIG9uIGEgZnVuY3Rpb24gCnRoYXQgd2lsbCBtYWtlIGl0IHRvIHY0LjEzLXJjMS4gQXQgdGhp
cyB0aW1lIGl0IHRodXMgZG9lc24ndCBjb21waWxlIGFnYWluc3QgCm1haW5saW5lLiBJJ2xsIHJl
YmFzZSBpdCBvbiB0b3Agb2YgdjQuMTMtcmMxLCB0aGUgZGVwZW5kZW5jeSB3aWxsIGJlIHRoZXJl
LCAKYW5kIEknbGwgc3VibWl0IGl0IGZvciB2NC4xNC4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQ
aW5jaGFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
