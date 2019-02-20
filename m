From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 4/4] drm/panel: Add OSD101T2587-53TS driver
Date: Wed, 20 Feb 2019 14:06:34 +0200
Message-ID: <8d973bd7-3e8b-5d37-10c3-347a7328291f@ti.com>
References: <20190215140315.18046-1-peter.ujfalusi@ti.com>
 <20190215140315.18046-5-peter.ujfalusi@ti.com>
 <20190215180759.GA26944@ravnborg.org>
 <fefcd92c-4171-ed86-28d2-4145d409a73d@ti.com>
 <20190220115202.GA18603@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190220115202.GA18603@ravnborg.org>
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
To: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org, robh+dt@kernel.org, tomi.valkeinen@ti.com, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

SGkgU2FtLAoKT24gMjAvMDIvMjAxOSAxMy41MiwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IEhpIFBl
dGVyLgo+IAo+IE9uIFdlZCwgRmViIDIwLCAyMDE5IGF0IDEyOjM5OjExUE0gKzAyMDAsIFBldGVy
IFVqZmFsdXNpIHdyb3RlOgo+PiBIaSBTYW0sCj4+Cj4+IE9uIDE1LzAyLzIwMTkgMjAuMDcsIFNh
bSBSYXZuYm9yZyB3cm90ZToKPj4+PiArI2luY2x1ZGUgPGxpbnV4L2JhY2tsaWdodC5oPgo+Pj4+
ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPgo+
Pj4+ICsjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+Cj4+Pj4gKwo+Pj4+ICsj
aW5jbHVkZSA8ZHJtL2RybVAuaD4KPj4+IFBsZWFzZSBkbyBub3QgdXNlIGRybVAuaCBpbiBuZXcg
ZHJpdmVycyAtIHdlIHRyeSB0byBnZXQgcmlkIG9mIHRoaXMgZmlsZS4KPj4KPj4gLi4uCj4+Cj4+
Pj4gK3N0YXRpYyBpbnQgb3NkMTAxdDI1ODdfcGFuZWxfZ2V0X21vZGVzKHN0cnVjdCBkcm1fcGFu
ZWwgKnBhbmVsKQo+Pj4+ICt7Cj4+Pj4gKwlzdHJ1Y3Qgb3NkMTAxdDI1ODdfcGFuZWwgKm9zZDEw
MXQyNTg3ID0gdG9fb3NkMTAxdDI1ODdfcGFuZWwocGFuZWwpOwo+Pj4+ICsJc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm1vZGU7Cj4+Pj4gKwo+Pj4+ICsJbW9kZSA9IGRybV9tb2RlX2R1cGxpY2F0
ZShwYW5lbC0+ZHJtLCBvc2QxMDF0MjU4Ny0+ZGVmYXVsdF9tb2RlKTsKPj4+PiArCWlmICghbW9k
ZSkgewo+Pj4+ICsJCWRldl9lcnIocGFuZWwtPmRybS0+ZGV2LCAiZmFpbGVkIHRvIGFkZCBtb2Rl
ICV1eCV1eEAldVxuIiwKPj4KPj4gZHJtL2RybVAuaCBpcyBuZWVkZWQgZm9yIHRoaXMgZGV2X2Vy
ci4KPiBkcm1QLmggaXMgb25seSBhIHNldCBvZiBpbmNsdWRlIGZpbGVzIGFuZCBmb3J3YXJkcyB0
b2RheS4KPiBTbyB5b3UgbmVlZCB0byBmaWd1cmUgb3V0IHdoYXQgdG8gcmVwbGFjZSBpdCB3aXRo
Lgo+IAo+IE9mdGVuIHJlbW92aW5nIGRybVAuaCByZXF1aXJlcyB5b3UgdG8gYWRkIG1vcmUgdGhh
biBvbmUgZXh0cmEgaW5jbHVkZSBmaWxlLgoKUmVwbGFjaW5nIGl0IHdpdGgKI2luY2x1ZGUgPGRy
bS9kcm1fZGV2aWNlLmg+Cgp3b3JrcyBwZXJmZWN0bHkuCgpUaGFua3MsCi0gUMOpdGVyCgpUZXhh
cyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5r
aS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTog
SGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
