From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v9 14/14] drm/mediatek: Add interface to allocate Mediatek
 GEM buffer.
Date: Tue, 12 Jan 2016 23:40:10 +0100
Message-ID: <CAKMK7uGHWT0TTc2Y5fmCALn2fzQPrTMGymJK4etYjXMcPGE61Q@mail.gmail.com>
References: <1452611750-16283-1-git-send-email-p.zabel@pengutronix.de>
 <1452611750-16283-15-git-send-email-p.zabel@pengutronix.de>
 <CAL_JsqJ4pEDSeEopDuMUGbi5sdv=Cva42Bj=QSpnMjMw_LmzaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAL_JsqJ4pEDSeEopDuMUGbi5sdv=Cva42Bj=QSpnMjMw_LmzaA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, dri-devel <dri-devel@lists.freedesktop.org>, Nicolas Boichat <drinkcat@chromium.org>, Jie Qiu <jie.qiu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tfiga@chromium.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBKYW4gMTIsIDIwMTYgYXQgMTE6MDIgUE0sIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtl
cm5lbC5vcmc+IHdyb3RlOgo+IE9uIFR1ZSwgSmFuIDEyLCAyMDE2IGF0IDk6MTUgQU0sIFBoaWxp
cHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+PiBGcm9tOiBDSyBIdSA8
Y2suaHVAbWVkaWF0ZWsuY29tPgo+Pgo+PiBBZGQgYW4gaW50ZXJmYWNlIHRvIGFsbG9jYXRlIE1l
ZGlhdGVrIEdFTSBidWZmZXJzLCBhbGxvdyB0aGUgSU9DVExzCj4+IHRvIGJlIHVzZWQgYnkgcmVu
ZGVyIG5vZGVzLgo+PiBUaGlzIHBhdGNoIGFsc28gc2V0cyB0aGUgUkVOREVSIGRyaXZlciBmZWF0
dXJlLgo+Cj4gQnV0IGl0IHNob3VsZCBub3QgYSBiZSByZW5kZXIgbm9kZSB1bmxlc3MgaXQgaGFz
IGEgR1BVIEFGQUlLLiBUaGVuCj4gYWdhaW4sIEkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCB0aGUg
bWFkbmVzcyBvZiBldmVyeSBkcml2ZXIgZGVmaW5pbmcKPiB0aGVpciBvd24gYnVmZmVyIGlvY3Rs
cyBlaXRoZXIuIFRoZSBvbmx5IGxpbmUgcmVtb3RlbHkgaC93IHNwZWNpZmljCj4gaGVyZSBpcyBt
dGtfZHJtX2dlbV9jcmVhdGUgY2FsbC4KClN1cHBvcnQgZ2VtX2NyZWF0ZS9tbWFwX29mZmV0IGFs
b25lIGlzIGluZGVlZCBwb2ludGxlc3Mgd2l0aG91dCBzb21lCnJlYWwgc3VwcG9ydCBmb3IgZ3B1
IHdvcmtsb2Fkcy4gRm9yIHBsYWluIGRpc3BsYXkgZHJpdmVycyB0aGUgZHVtYgpidWZmZXIgYXBp
LCBwbHVzIHByaW1lL2RtYS1idWYgaW1wb3J0IHNob3VsZCBiZSBwbGVudHkgZW5vdWdoLgoKVGhl
IHVzdWFsIHJlYXNvbiBmb3IgZG9pbmcgdGhpcyBpcyBzb21lIGJsb2IgZHJpdmVyIGZvciBvcGVu
Z2wgdGhhdApjYW4ndCBiZSBvcGVuLXNvdXJjZSwgd2hpY2ggaXMgYSBiaWcgbm8tZ28gZm9yIHVw
c3RyZWFtLgoKSW1vIGJlc3QgdG8ganVzdCByaXAgdGhpcyBvdXQsIGNvbnNpZGVyIGl0IG5hY2tl
ZCB3aXRob3V0IGZ1bGwtYmxvd24KdXNlcnNwYWNlIGFuZCB3aGF0ZXZlciBlbHNlIGlzIG5lZWRp
bmcgdGhlc2UgYnVmZmVycy4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
