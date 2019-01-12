From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 3/7] drm: rockchip: vop: add rk3066 vop definitions
Date: Sat, 12 Jan 2019 19:53:37 +0100
Message-ID: <2938788.qBnkOikdhP@phil>
References: <20181229133318.18128-1-jbx6244@gmail.com>
 <154632658.xpTMZOjgxT@phil> <20190111145424.GA21604@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190111145424.GA21604@bogus>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, airlied@linux.ie, mturquette@baylibre.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, sboyd@kernel.org, Johan Jonker <jbx6244@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW0gRnJlaXRhZywgMTEuIEphbnVhciAyMDE5LCAxNTo1NDoyNCBDRVQgc2NocmllYiBSb2IgSGVy
cmluZzoKPiBPbiBTdW4sIERlYyAzMCwgMjAxOCBhdCAwNjoyMjowMFBNICswMTAwLCBIZWlrbyBT
dHVlYm5lciB3cm90ZToKPiA+IEhpIEpvaGFuLAo+ID4gCj4gPiBBbSBTYW1zdGFnLCAyOS4gRGV6
ZW1iZXIgMjAxOCwgMTQ6MzM6MTQgQ0VUIHNjaHJpZWIgSm9oYW4gSm9ua2VyOgo+ID4gPiBGcm9t
OiBNYXJrIFlhbyA8bWFyay55YW9Acm9jay1jaGlwcy5jb20+Cj4gPiA+IAo+ID4gPiBUaGlzIHBh
dGNoIGFkZHMgdGhlIHJrMzA2NiBWT1AgZGVmaW5pdGlvbnMuCj4gPiA+IAo+ID4gPiBUaGUgVk9Q
IG9yIExDRCBDb250cm9sbGVyIHNlcnZlcyBhcyBpbnRlcmZhY2UgYmV0d2Vlbgo+ID4gPiBmcmFt
ZWJ1ZmZlciBtZW1vcnkgYW5kIGEgZGlzcGxheSBkZXZpY2UgKExDRCBwYW5lbCBvciBUViBzZXQp
Lgo+ID4gPiAKPiA+ID4gVGhpcyBTT0MgaGFzIHR3byBzeW1tZXRyaWNhbCBMQ0RDJ3MgZm9yIGEg
ZHVhbCBwYW5lbCBhcHBsaWNhdGlvbi4KPiA+ID4gCj4gPiA+IEEgTENEQyBoYXMgNSBkaXNwbGF5
IGxheWVycy4KPiA+ID4gT25seSAzIGFyZSB1c2VkIGhlcmUuCj4gPiA+IAo+ID4gPiAtIFZpZGVv
IGxheWVyIDAgKFdpbjApCj4gPiA+IC0gVmlkZW8gbGF5ZXIgMSAoV2luMSkKPiA+ID4gLSBPU0Qg
bGF5ZXIgICAgIChXaW4yKQo+ID4gCj4gPiBQYXRjaCBpdHNlbGYgbG9va3MgZ29vZCwgd2UnbGwg
bmVlZCB0byB3YWl0IGEgYml0IHRvIGdpdmUgUm9iIGEgY2hhbmNlCj4gPiB0byBsb29rIGF0IHRo
ZSAoc2ltcGxlKSBkdC1iaW5kaW5nIGNoYW5nZSBhbmQgSSdsbCBkcm9wIHRoZSBwYXJhZ3JhcGgK
PiA+IGFib3V0IHRoZSBkaXNwbGF5IGxheWVycyB3aGVuIGFwcGx5aW5nLgo+IAo+IERvbid0IHdh
aXQgb24gbWUgZm9yIHNpbXBsZSBvbmVsaW5lIGNvbXBhdGlibGUgYWRkaXRpb25zLgoKVGhpcyBt
b3JlIG9yIGxlc3Mgd2FzIHRoZSBmYXVsdCBvZiB0aGUgeWVhciBjaGFuZ2UgOi1EIC4uLiBtb3N0
IG9mCnRoZSB0aW1lIEknZCBhcHBseSBhIHNpbXBsZSBuZXcgY29tcGF0aWJsZSBlYXJsaWVyIGFu
ZCBwb3NzaWJseQp3aXRob3V0IEFjayA7LSkgLgoKQW5kIEkndmUgYXBwbGllZCB0aGUgcGF0Y2gg
dG8gZHJtLW1pc2MtbmV4dCBub3cgKGZvciA1LjEpLgoKSGVpa28KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
