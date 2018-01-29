From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] drm: adv7511: Add support for i2c_new_secondary_device
Date: Mon, 29 Jan 2018 14:09:23 -0600
Message-ID: <20180129200923.dp5maqyfh2v3wlnd@rob-hp-laptop>
References: <1516625389-6362-1-git-send-email-kieran.bingham@ideasonboard.com>
 <1516625389-6362-3-git-send-email-kieran.bingham@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1516625389-6362-3-git-send-email-kieran.bingham@ideasonboard.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>, Hans Verkuil <hans.verkuil@cisco.com>, Bhumika Goyal <bhumirks@gmail.com>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBKYW4gMjIsIDIwMTggYXQgMTI6NTA6MDFQTSArMDAwMCwgS2llcmFuIEJpbmdoYW0g
d3JvdGU6Cj4gVGhlIEFEVjc1MTEgaGFzIGZvdXIgMjU2LWJ5dGUgbWFwcyB0aGF0IGNhbiBiZSBh
Y2Nlc3NlZCB2aWEgdGhlIG1haW4gScKyQwo+IHBvcnRzLiBFYWNoIG1hcCBoYXMgaXQgb3duIEnC
skMgYWRkcmVzcyBhbmQgYWN0cyBhcyBhIHN0YW5kYXJkIHNsYXZlCj4gZGV2aWNlIG9uIHRoZSBJ
wrJDIGJ1cy4KPiAKPiBBbGxvdyBhIGRldmljZSB0cmVlIG5vZGUgdG8gb3ZlcnJpZGUgdGhlIGRl
ZmF1bHQgYWRkcmVzc2VzIHNvIHRoYXQKPiBhZGRyZXNzIGNvbmZsaWN0cyB3aXRoIG90aGVyIGRl
dmljZXMgb24gdGhlIHNhbWUgYnVzIG1heSBiZSByZXNvbHZlZCBhdAo+IHRoZSBib2FyZCBkZXNj
cmlwdGlvbiBsZXZlbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLaWVyYW4gQmluZ2hhbSA8a2llcmFu
LmJpbmdoYW1AaWRlYXNvbmJvYXJkLmNvbT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkv
YnJpZGdlL2FkaSxhZHY3NTExLnR4dCAgICAgICAgfCAxMCArKysrKy0KClJldmlld2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
ZHY3NTExL2Fkdjc1MTEuaCAgICAgICAgICAgfCAgNCArKysKPiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMgICAgICAgfCAzNiArKysrKysrKysrKysrKy0tLS0t
LS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0p
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
