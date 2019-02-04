From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH RESEND v2 08/12] dt-bindings: add binding for generic eDP
 panel
Date: Mon, 4 Feb 2019 14:34:19 -0600
Message-ID: <CAL_JsqKXi0iZG1sJ7zGR978X7WT9JJ6omrvCAL9P2sLuFXmFJg@mail.gmail.com>
References: <20190203185501.8958-1-anarsoul@gmail.com>
 <20190203185501.8958-9-anarsoul@gmail.com>
 <20190204074350.GC16448@ulmo>
 <CA+E=qVecudACOEXt74Kf=UA_F-uuHgEqHzKpYAq1ocMx3Sx+eQ@mail.gmail.com>
 <20190204082353.GE19087@ulmo>
 <CAL_JsqKt1kOXmRNvkYsQ6AL69+TPZURKpDbKkkEUb2+KZ5hKjQ@mail.gmail.com>
 <20190204165637.GA30876@ulmo>
 <CAL_JsqJx98DfHZSafiXA8QiO=bn1zy8g6keQ15L=cUmbVkTTOA@mail.gmail.com>
 <CA+E=qVdoOTj522hftrYp3fbH3zH4jD7GxtvOOH6RwCHx+nNwNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CA+E=qVdoOTj522hftrYp3fbH3zH4jD7GxtvOOH6RwCHx+nNwNQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>, dri-devel <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, arm-linux <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBGZWIgNCwgMjAxOSBhdCAyOjI2IFBNIFZhc2lseSBLaG9ydXpoaWNrIDxhbmFyc291
bEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBGZWIgNCwgMjAxOSBhdCAxMjoyMyBQTSBS
b2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPiB3cm90ZToKPgo+ID4gPiBzaW1wbGUtcGFu
ZWwgd291bGQgcHJvYmFibHkgd29yayBpZiB5b3Ugc3R1Y2sgaW4gc29tZSBtb3N0bHkgY29tcGF0
aWJsZQo+ID4gPiBzdHJpbmcgYW5kIHByb3ZpZGVkIGEgZGRjLWkyYy1idXMgcHJvcGVydHkgaW4g
dGhlIGRldmljZSB0cmVlIG5vZGUuIFRoZQo+ID4gPiBnZW5lcmljLWlzaCBmYWxsYmFjayBjYXNl
IGNvdWxkIGJlIGltcGxlbWVudGVkIGJ5IHByb3ZpZGluZyBhIGZhbGxiYWNrCj4gPiA+IGNvbXBh
dGlibGUgc3RyaW5nICh3ZSB1c2VkIHRvIGhhdmUgInNpbXBsZS1wYW5lbCIsIHdoaWNoIEkgdGhp
bmsgd291bGQKPiA+ID4gc3RpbGwgYmUgYWRlcXVhdGUgZm9yIHRoaXMgSSBzdXBwb3NlKSBhbmQg
YWRkaW5nIGEgZHVtbXkgZGVzY3JpcHRvciBpbgo+ID4gPiB0aGUgZHJpdmVyLCBwZXJoYXBzIG9u
ZSB3aXRoIHByZS1kZWZpbmVkIGRlbGF5cyB0aGF0IGNvdWxkIGJlIGFkanVzdGVkCj4gPiA+IHRv
IHdvcmsgZm9yIGFsbCBjYXNlcywgb3IgdGhleSBjb3VsZCBqdXN0IGJlIDAuIEF0IGxlYXN0IHRo
YXQgd2F5IHdlJ2QKPiA+ID4gYmUgZXhwbGljaXRseSBkb2N1bWVudGluZyB0aGF0IHdlIHN1cHBv
cnQgdGhpcyBhcyBhIGZhbGxiYWNrLgo+ID4KPiA+IEknZCBsaWtlIHNvbWV0aGluZyBtb3JlIHNw
ZWNpZmljIHRoYW4gJ3NpbXBsZS1wYW5lbCcgdGhhdCBhdCBsZWFzdAo+ID4gaW1wbGllcyBpdCBo
YXMgRURJRCBhbmQgd2hhdGV2ZXIgZWxzZSB3ZSB0aGluayBpdCBzaG91bGQgaW1wbHkuCj4gPgo+
ID4gTG9va2luZyBpbnRvIHRoaXMgYSBiaXQgbW9yZSwgd2h5IGRvbid0IHdlIGp1c3QgZG8gYSBj
b25uZWN0b3IgaGVyZT8KPiA+IGVEUCBoYXMgYSBzdGFuZGFyZCBjb25uZWN0b3IgKHdpdGggcG93
ZXIpLiBJdCdzIGp1c3QgbGlrZSBvdGhlcgo+ID4gY29ubmVjdG9ycywgYnV0IHdpdGggcG93ZXIg
YW5kIG5vIGhvdHBsdWcuIElmIHNvbWVvbmUgZG9lcyB0aGVpciBvd24KPiA+IGludGVyZmFjZSwg
dGhlbiB0aGV5IHNob3VsZCBkbyB0aGVpciBvd24gY29ubmVjdG9yIG9yIHBhbmVsIGJpbmRpbmcu
Cj4KPiBXaGVyZSBkbyB3ZSBwdXQgYmFja2xpZ2h0IGluIHRoaXMgY2FzZT8KCkluIHRoZSBjb25u
ZWN0b3Igbm9kZS4gWW91J2QgbmVlZCBhIGJhY2tsaWdodCBzdXBwbHksCidiYWNrbGlnaHQtZW5h
YmxlLWdwaW9zJyBhbmQgYmFja2xpZ2h0IHBoYW5kbGUgdG8gcHdtLWJhY2tsaWdodCBub2RlLgoK
Um9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
