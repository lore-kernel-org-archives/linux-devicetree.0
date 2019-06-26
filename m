From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 0/7] drm/panel: simple: Add mode support to devicetree
Date: Wed, 26 Jun 2019 07:41:25 -0700
Message-ID: <CAD=FV=U4UU8q+CS76uuuGUP=EVnE6+BTUf8U=j7uwfczNgkrZw@mail.gmail.com>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190626130007.GE23428@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190626130007.GE23428@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, Boris Brezillon <boris.brezillon@collabora.com>, =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Ezequiel Garcia <ezequiel@collabora.com>, Matthias Kaehlcke <mka@chromium.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

SGksCgpPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCA2OjAwIEFNIFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4gd3JvdGU6Cj4KPiBIaSBEb3VnbGFzLgo+Cj4gT24gTW9uLCBBcHIgMDEsIDIw
MTkgYXQgMTA6MTc6MTdBTSAtMDcwMCwgRG91Z2xhcyBBbmRlcnNvbiB3cm90ZToKPiA+IEknbSBy
ZXZpdmluZyBTZWFuIFBhdWwncyBvbGQgcGF0Y2hzZXQgdG8gZ2V0IG1vZGUgc3VwcG9ydCBpbiBk
ZXZpY2UKPiA+IHRyZWUuICBUaGUgY292ZXIgbGV0dGVyIGZvciBoaXMgdjMgaXMgYXQ6Cj4gPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOC1GZWJy
dWFyeS8xNjUxNjIuaHRtbAo+ID4KPiA+IE5vIGNvZGUgaXMgZGlmZmVyZW50IGJldHdlZW4gdjQg
YW5kIHY1LCBqdXN0IGNvbW1pdCBtZXNzYWdlcyBhbmQgdGV4dAo+ID4gaW4gdGhlIGJpbmRpbmdz
Lgo+ID4KPiA+IEkndmUgcHVsbGVkIHRvZ2V0aGVyIHRoZSBwYXRjaGVzIHRoYXQgZGlkbid0IGxh
bmQgaW4gdjMsIGFkZHJlc3NlZAo+ID4gb3V0c3RhbmRpbmcgZmVlZGJhY2ssIGFuZCByZXBvc3Rl
ZC4gIEF0b3AgdGhlbSBJJ3ZlIGFkZGVkIHBhdGNoZXMgZm9yCj4gPiByazMyODgtdmV5cm9uLWNo
cm9tZWJvb2sgKHVzZWQgZm9yIGphcSwgamVycnksIG1pZ2h0eSwgc3BlZWR5KSBhbmQKPiA+IHJr
MzI4OC12ZXJ5b24tbWlubmllLgo+ID4KPiA+IFBsZWFzZSBsZXQgbWUga25vdyBob3cgdGhleSBs
b29rLgo+ID4KPiA+IEluIGdlbmVyYWwgSSBoYXZlIGFkZGVkIHBlb3BsZSB0byB0aGUgd2hvbGUg
c2VyaWVzIHdobyBJIHRoaW5rIHdvdWxkCj4gPiBsaWtlIHRoZSB3aG9sZSBzZXJpZXMgYW5kIHRo
ZW4gbGV0IGdldF9tYWludGFpbmVyIHBpY2sgZXh0cmEgcGVvcGxlIGl0Cj4gPiB0aGlua3MgYXJl
IHJlbGV2YW50IHRvIGVhY2ggaW5kaXZpZHVhbCBwYXRjaC4gIElmIEkgc2VlIHlvdSByZXNwb25k
IHRvCj4gPiBhbnkgb2YgdGhlIHBhdGNoZXMgaW4gdGhlIHNlcmllcywgdGhvdWdoLCBJJ2xsIGFk
ZCB5b3UgdG8gdGhlIHdob2xlCj4gPiBzZXJpZXMgQ2MgbGlzdCBuZXh0IHRpbWUuCj4gPgo+ID4g
Q2hhbmdlcyBpbiB2NToKPiA+IC0gUmVtb3ZlZCBiaXQgYWJvdXQgT1MgbWF5IGlnbm9yZSAoUm9i
L0V6ZXF1aWVsKQo+ID4gLSBBZGRlZCBIZWlrbydzIFRlc3RlZC1ieQo+ID4gLSBJdCdzIG5vdCBq
dXN0IGplcnJ5LCBpdCdzIG1vc3QgcmszMjg4IENocm9tZWJvb2tzIChIZWlrbykKPgo+IFdoYXQg
YXJlIHRoZSBwbGFucyB0byBtb3ZlIGZvcndhcmQgd2l0aCB0aGlzPwo+IE9yIGRpZCB5b3UgZHJv
cCB0aGUgd2hvbGUgaWRlYSBhZ2Fpbj8KCkF0IHRoZSBtb21lbnQgSSdtIGJsb2NrZWQgb24gVGhp
ZXJyeSByZXNwb25kaW5nLCBlaXRoZXIgdGFraW5nIHRoZQpwYXRjaCBvciB0ZWxsaW5nIG1lIHdo
YXQgSSBuZWVkIHRvIGRvIHRvIGZpeCBpdC4gIEkgc2F3IFNlYW4gUGF1bCBwaW5nClRoaWVycnkg
b24gSVJDIG9uIEp1bmUgM3JkIGFuZCBhcyBmYXIgYXMgSSBjb3VsZCB0ZWxsIHRoZXJlIHdhcyBu
bwpyZXNwb25zZS4KCmh0dHBzOi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+Y2JyaWxsL2RyaS1s
b2cvP2NoYW5uZWw9ZHJpLWRldmVsJmhpZ2hsaWdodF9uYW1lcz0mZGF0ZT0yMDE5LTA2LTAzJnNo
b3dfaHRtbD10cnVlCgouLi5hbmQgYXMgeW91IGNhbiBzZWUgSGVpa28gcGluZ2VkIHRoaXMgdGhy
ZWFkIG9uIEp1bmUgMTR0aC4KClRoaWVycnk6IGNhbiB5b3UgaGVscCBnaXZlIHVzIHNvbWUgZGly
ZWN0aW9uPyAgQXJlIHlvdSB1bmludGVyZXN0ZWQgaW4KcmV2aWV3aW5nIHRoZW0gYW5kIHdvdWxk
IHByZWZlciB0aGF0IEkgZmluZCBzb21lb25lIHRvIGxhbmQgdGhlbSBpbgpkcm0tbWlzYyBkaXJl
Y3RseT8KCgotRG91ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
