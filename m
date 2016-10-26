From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/8] drm: bridge: Add LVDS encoder driver
Date: Wed, 26 Oct 2016 16:32:14 -0500
Message-ID: <20161026213214.46ev2pa6zacjajyh@rob-hp-laptop>
References: <1476887143-24831-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1476887143-24831-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1476887143-24831-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBPY3QgMTksIDIwMTYgYXQgMDU6MjU6MzZQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBUaGUgTFZEUyBlbmNvZGVyIGRyaXZlciBpcyBhIERSTSBicmlkZ2UgZHJpdmVy
IHRoYXQgc3VwcG9ydHMgdGhlCj4gcGFyYWxsZWwgdG8gTFZEUyBlbmNvZGVycyB0aGF0IGRvbid0
IHJlcXVpcmUgYW55IGNvbmZpZ3VyYXRpb24uIFRoZQo+IGRyaXZlciB0aHVzIGRvZXNuJ3QgaW50
ZXJhY3Qgd2l0aCB0aGUgZGV2aWNlLCBidXQgY3JlYXRlcyBhbiBMVkRTCj4gY29ubmVjdG9yIGZv
ciB0aGUgcGFuZWwgYW5kIGV4cG9zZXMgaXRzIHNpemUgYW5kIHRpbWluZyBiYXNlZCBvbgo+IGlu
Zm9ybWF0aW9uIHJldHJpZXZlZCBmcm9tIERULgo+IAo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci50eHQgICB8ICA2NCArKysrKysrCgpJdCdzIHByZWZl
cnJlZCB0aGF0IGJpbmRpbmdzIGFyZSBzZXBhcmF0ZSBwYXRjaGVzLiBUaGF0IG1ha2VzIHRoZSAK
ZmlsdGVyZWQgRFQgb25seSByZXBvIGNvbW1pdHMgbW9yZSBzYW5lLgoKQWNrZWQtYnk6IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cgo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICB8ICAgOCArCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9sdmRzLWVuY29kZXIuYyAgICAgICAgICAgICAgfCAyMDMgKysrKysrKysrKysrKysrKysr
KysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjc2IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9s
dmRzLXRyYW5zbWl0dGVyLnR4dAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9sdmRzLWVuY29kZXIuYwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
