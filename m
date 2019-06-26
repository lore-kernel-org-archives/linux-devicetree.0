From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 0/7] drm/panel: simple: Add mode support to devicetree
Date: Wed, 26 Jun 2019 15:00:07 +0200
Message-ID: <20190626130007.GE23428@ravnborg.org>
References: <20190401171724.215780-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190401171724.215780-1-dianders@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org, Boris Brezillon <boris.brezillon@collabora.com>, Enric =?iso-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Ezequiel Garcia <ezequiel@collabora.com>, mka@chromium.org, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

SGkgRG91Z2xhcy4KCk9uIE1vbiwgQXByIDAxLCAyMDE5IGF0IDEwOjE3OjE3QU0gLTA3MDAsIERv
dWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gSSdtIHJldml2aW5nIFNlYW4gUGF1bCdzIG9sZCBwYXRj
aHNldCB0byBnZXQgbW9kZSBzdXBwb3J0IGluIGRldmljZQo+IHRyZWUuICBUaGUgY292ZXIgbGV0
dGVyIGZvciBoaXMgdjMgaXMgYXQ6Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJj
aGl2ZXMvZHJpLWRldmVsLzIwMTgtRmVicnVhcnkvMTY1MTYyLmh0bWwKPiAKPiBObyBjb2RlIGlz
IGRpZmZlcmVudCBiZXR3ZWVuIHY0IGFuZCB2NSwganVzdCBjb21taXQgbWVzc2FnZXMgYW5kIHRl
eHQKPiBpbiB0aGUgYmluZGluZ3MuCj4gCj4gSSd2ZSBwdWxsZWQgdG9nZXRoZXIgdGhlIHBhdGNo
ZXMgdGhhdCBkaWRuJ3QgbGFuZCBpbiB2MywgYWRkcmVzc2VkCj4gb3V0c3RhbmRpbmcgZmVlZGJh
Y2ssIGFuZCByZXBvc3RlZC4gIEF0b3AgdGhlbSBJJ3ZlIGFkZGVkIHBhdGNoZXMgZm9yCj4gcmsz
Mjg4LXZleXJvbi1jaHJvbWVib29rICh1c2VkIGZvciBqYXEsIGplcnJ5LCBtaWdodHksIHNwZWVk
eSkgYW5kCj4gcmszMjg4LXZlcnlvbi1taW5uaWUuCj4gCj4gUGxlYXNlIGxldCBtZSBrbm93IGhv
dyB0aGV5IGxvb2suCj4gCj4gSW4gZ2VuZXJhbCBJIGhhdmUgYWRkZWQgcGVvcGxlIHRvIHRoZSB3
aG9sZSBzZXJpZXMgd2hvIEkgdGhpbmsgd291bGQKPiBsaWtlIHRoZSB3aG9sZSBzZXJpZXMgYW5k
IHRoZW4gbGV0IGdldF9tYWludGFpbmVyIHBpY2sgZXh0cmEgcGVvcGxlIGl0Cj4gdGhpbmtzIGFy
ZSByZWxldmFudCB0byBlYWNoIGluZGl2aWR1YWwgcGF0Y2guICBJZiBJIHNlZSB5b3UgcmVzcG9u
ZCB0bwo+IGFueSBvZiB0aGUgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzLCB0aG91Z2gsIEknbGwgYWRk
IHlvdSB0byB0aGUgd2hvbGUKPiBzZXJpZXMgQ2MgbGlzdCBuZXh0IHRpbWUuCj4gCj4gQ2hhbmdl
cyBpbiB2NToKPiAtIFJlbW92ZWQgYml0IGFib3V0IE9TIG1heSBpZ25vcmUgKFJvYi9FemVxdWll
bCkKPiAtIEFkZGVkIEhlaWtvJ3MgVGVzdGVkLWJ5Cj4gLSBJdCdzIG5vdCBqdXN0IGplcnJ5LCBp
dCdzIG1vc3QgcmszMjg4IENocm9tZWJvb2tzIChIZWlrbykKCldoYXQgYXJlIHRoZSBwbGFucyB0
byBtb3ZlIGZvcndhcmQgd2l0aCB0aGlzPwpPciBkaWQgeW91IGRyb3AgdGhlIHdob2xlIGlkZWEg
YWdhaW4/CgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
