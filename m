From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] drm: adv7511: Add support for i2c_new_secondary_device
Date: Mon, 29 Jan 2018 14:12:54 -0600
Message-ID: <20180129201254.mqvwji4if5wl5r2n@rob-hp-laptop>
References: <1516625389-6362-1-git-send-email-kieran.bingham@ideasonboard.com>
 <1516625389-6362-3-git-send-email-kieran.bingham@ideasonboard.com>
 <1650729.pzuqXiNcLL@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1650729.pzuqXiNcLL@avalon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>, Hans Verkuil <hans.verkuil@cisco.com>, Bhumika Goyal <bhumirks@gmail.com>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBKYW4gMjksIDIwMTggYXQgMTI6MjY6MDBQTSArMDIwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBLaWVyYW4sCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4gCj4g
T24gTW9uZGF5LCAyMiBKYW51YXJ5IDIwMTggMTQ6NTA6MDAgRUVUIEtpZXJhbiBCaW5naGFtIHdy
b3RlOgo+ID4gVGhlIEFEVjc1MTEgaGFzIGZvdXIgMjU2LWJ5dGUgbWFwcyB0aGF0IGNhbiBiZSBh
Y2Nlc3NlZCB2aWEgdGhlIG1haW4gScKyQwo+ID4gcG9ydHMuIEVhY2ggbWFwIGhhcyBpdCBvd24g
ScKyQyBhZGRyZXNzIGFuZCBhY3RzIGFzIGEgc3RhbmRhcmQgc2xhdmUKPiA+IGRldmljZSBvbiB0
aGUgScKyQyBidXMuCj4gPiAKPiA+IEFsbG93IGEgZGV2aWNlIHRyZWUgbm9kZSB0byBvdmVycmlk
ZSB0aGUgZGVmYXVsdCBhZGRyZXNzZXMgc28gdGhhdAo+ID4gYWRkcmVzcyBjb25mbGljdHMgd2l0
aCBvdGhlciBkZXZpY2VzIG9uIHRoZSBzYW1lIGJ1cyBtYXkgYmUgcmVzb2x2ZWQgYXQKPiA+IHRo
ZSBib2FyZCBkZXNjcmlwdGlvbiBsZXZlbC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogS2llcmFu
IEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtQGlkZWFzb25ib2FyZC5jb20+Cj4gPiAtLS0KPiA+ICAu
Li4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYWRpLGFkdjc1MTEudHh0ICAgICAgICB8IDEwICsr
KysrLQo+IAo+IEkgZG9uJ3QgbWluZCBwZXJzb25hbGx5LCBidXQgZGV2aWNlIHRyZWUgbWFpbnRh
aW5lcnMgdXN1YWxseSBhc2sgZm9yIERUIAo+IGJpbmRpbmdzIGNoYW5nZXMgdG8gYmUgc3BsaXQg
dG8gYSBzZXBhcmF0ZSBwYXRjaC4KCk9yIHBlcmZlY3QgYmluZGluZ3MsIHRoZW4gSSB3b24ndCBh
c2sgdG8gc3BsaXQgaXQganVzdCBmb3IgdGhhdCAKKHVzdWFsbHkpLgoKPiA+ICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oICAgICAgICAgICB8ICA0ICsrKwo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jICAgICAgIHwgMzYgKysr
KysrKysrKysrLS0tLS0tLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwg
MTMgZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
