From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH 0/2] Add backlight-pwm-passthru in analogix DP driver
Date: Fri, 16 Mar 2018 12:50:21 -0400
Message-ID: <20180316165021.GG223881@art_vandelay>
References: <20180316025659.217423-1-amstan@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180316025659.217423-1-amstan@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandru M Stan <amstan@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, dianders@chromium.org, zain wang <wzz@rock-chips.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, hoegsberg@chromium.org, Marek Szyprowski <m.szyprowski@samsung.com>, briannorris@chromium.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Jeffy Chen <jeffy.chen@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, marcheu@chromium.org, Thierry Escande <thierry.escande@collabora.com>, linux-kernel@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Yakir Yang <kuankuan.y@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBNYXIgMTUsIDIwMTggYXQgMDc6NTY6NTdQTSAtMDcwMCwgQWxleGFuZHJ1IE0gU3Rh
biB3cm90ZToKPiBJIG5vdGljZWQgdGhhdCB0aGUgYmFja2xpZ2h0IG9uIHRoZSBBU1VTIENocm9t
ZWJvb2sgRmxpcCBDMTAxIChib2IpIGlzCj4gZmxpY2tlcmluZy4KPiAKPiBXZSdyZSBzZW5kaW5n
IGl0IGEgaGlnaCBmcmVxdWVuY3kgcHdtIHNpZ25hbCwgYnV0IHRoZSBFRFAgcGFuZWwgZGVjaWRl
ZCB0bwo+ICJwYXJzZSIgdGhlIHNpZ25hbCwgcmVhZCB0aGUgZHV0eSBjeWNsZSwgdGhlbiBtYWtl
IGl0cyBvd24gc2lnbmFsIHRoYXQKPiBpdCBzZW5kcyB0byB0aGUgTEVEcy4KPiAKPiBTbyBldmVu
IHRob3VnaCB3ZSBzZW5kIGEgbmljZSBoaWdoIHJlZnJlc2ggcmF0ZSBhdCAxMjAwSHosIHRoZSBw
YW5lbCBiYWNrbGlnaHQKPiBmbGlja2VycyBhdCAyMDBIeiAod2hpY2ggaXMgbm90IGV2ZW4gZGl2
aXNpYmxlIGJ5IHRoZSA2MEh6IHJlZnJlc2ggcmF0ZSkuCj4gCj4gVGhlIGZpeCBmb3IgdGhhdCBp
cyB0byBlbmFibGUgdGhlIEVEUF9CQUNLTElHSFRfRlJFUV9QV01fUElOX1BBU1NUSFJVIGJpdCBm
cm9tCj4gdGhlIERQQ0QgRURQIHJlZ2lzdGVycy4gVGhpcyBtYWtlcyB0aGUgcGFuZWwgYWN0dWFs
bHkgZm9sbG93IHRoZSBzaWduYWwKPiB3ZSdyZSBnaXZpbmcgaXQuCj4gCj4gVGhpcyBzZXJpZXMg
aW5jbHVkZXMgdGhlIG9wdGlvbmFsIGR0IGJpbmRpbmcgdG8gZW5hYmxlIHRoaXMgZml4Cj4gKGJh
Y2tsaWdodC1wd20tcGFzc3RocnUpIGFuZCB0aGUgY29ycmVzcG9uZGluZyBjb2RlIGluIHRoZSBh
bmFsb2dpeAo+IGRybS9icmlkZ2UgZHJpdmVyLgo+IAoKVGhhbmtzIGZvciBzZW5kaW5nIHRoZXNl
IHBhdGNoZXMhCgpXaXRoIEFyY2hpdCBhbmQgRGFuaWVsJ3MgY29tbWVudHMgYWRkcmVzc2VkLCBm
ZWVsIGZyZWUgdG8gYWRkIG15IAoKUmV2aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hy
b21pdW0ub3JnPgoKPiAKPiBBbGV4YW5kcnUgTSBTdGFuICgyKToKPiAgIGR0LWJpbmRpbmdzOiBh
bmFsb2dpeC1kcDogQWRkIGJhY2tsaWdodC1wd20tcGFzc3RocnUKPiAgIGRybS9icmlkZ2U6IGFu
YWxvZ2l4OiBFbmFibGUgRURQX0JBQ0tMSUdIVF9GUkVRX1BXTV9QSU5fUEFTU1RIUlUKPiAKPiAg
Li4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FuYWxvZ2l4X2RwLnR4dCAgICAgICAgfCAgNCAr
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYyB8
IDQ4ICsrKysrKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC9hbmFsb2dpeF9kcF9jb3JlLmggfCAgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTMgaW5z
ZXJ0aW9ucygrKQo+IAo+IC0tIAo+IDIuMTMuNQo+IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUg
RW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
