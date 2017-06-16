From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 2/7] drm/vc4: Fix vblank handling
Date: Fri, 16 Jun 2017 09:47:58 +0200
Message-ID: <20170616094758.66b7ea29@bbrezillon>
References: <1496392332-8722-1-git-send-email-boris.brezillon@free-electrons.com>
 <1496392332-8722-3-git-send-email-boris.brezillon@free-electrons.com>
 <87fuf0u8ul.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <87fuf0u8ul.fsf@eliezer.anholt.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Eric Anholt <eric@anholt.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee@kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>, Florian Fainelli <f.fainelli@gmail.com>, Eben Upton <eben@raspberrypi.org>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, "Hollingworth, Gordon" <gordon@raspberrypi.org>, "Cobley,
 Dom" <dom@raspberrypi.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Scott Branden <sbranden@broadcom.com>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAxNSBKdW4gMjAxNyAxNjozMDo1OCAtMDcwMApFcmljIEFuaG9sdCA8ZXJpY0Bhbmhv
bHQubmV0PiB3cm90ZToKCj4gQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AZnJlZS1l
bGVjdHJvbnMuY29tPiB3cml0ZXM6Cj4gCj4gPiBUaGVyZSBhcmUgdHdvIHByb2JsZW1zIHJlbGF0
ZWQgdG8gVkJMQU5LIGhhbmRsaW5nIGluIHRoZSBjdXJyZW50IENSVEMKPiA+IGRyaXZlcjoKPiA+
Cj4gPiAqIFZCTEFOSyBldmVudHMgYXJlIG1pc3NlZCB3aGVuIHRoZSBDUlRDIGlzIGJlaW5nIGRp
c2FibGVkIGJlY2F1c2UgdGhlCj4gPiAgIGRyaXZlciBkb2VzIG5vdCB3YWl0IHRpbGwgdGhlIGVu
ZCBvZiB0aGUgZnJhbWUgYmVmb3JlIHN0b3BwaW5nIHRoZQo+ID4gICBIVlMgYW5kIFBWIGJsb2Nr
cy4gSW4gdGhpcyBjYXNlLCB3ZSBzaG91bGQgZXhwbGljaXRseSBpc3N1ZSBhIFZCTEFOSwo+ID4g
ICBldmVudCBpZiB0aGVyZSdzIG9uZSB3YWl0aW5nCj4gPiAqIHdoZW4gd2UgYXJlIGVuYWJsaW5n
IGEgQ1JUQywgZHJtX2NydGNfdmJsYW5rX2dldCgpIGlzIGNhbGxlZCBiZWZvcmUKPiA+ICAgZHJt
X2NydGNfdmJsYW5rX29uKCksIHdoaWNoIGlzIG5vdCBzdXBwb3NlZCB0byBoYXBwZW4gKGhlbmNl
IHRoZQo+ID4gICBXQVJOX09OKCkgaW4gdGhlIGNvZGUpLiBUbyBzb2x2ZSB0aGUgcHJvYmxlbSwg
d2UgZGVsYXkgdGhlICd1cGRhdGUKPiA+ICAgZGlzcGxheSBsaXN0JyBvcGVyYXRpb24gYWZ0ZXIg
dGhlIENSVEMgaXMgYWN0dWFsbHkgZW5hYmxlZC4gIAo+IAo+IERvZXMgZHJtX2NydGNfdmJsYW5r
X2dldCgpIGFjdHVhbGx5IGZhaWwgd2hlbiBkcm1fY3J0Y192Ymxhbmtfb24oKQo+IGhhc24ndCBi
ZWVuIGNhbGxlZD8gIFRoZSBjb2RlIGlzIGEgYml0IHR3aXN0eSwgYnV0IGl0IGxvb2tlZCBsaWtl
IHdlCj4gd291bGQgdHJhY2sgdGhlIGdldCByZWZjb3VudCBhbmQgdGhlbiB0dXJuIG9uIHRoZSBp
bnRlcnJ1cHQgb25jZQo+IGRybV9jcnRjX3ZibGFua19vbigpIHdhcyBjYWxsZWQuCgpJIHRob3Vn
aHQgSSBoYWQgZmFjZWQgdGhlIFdBUk5fT04oKSBiYWNrdHJhY2Ugd2hpbGUgZGV2ZWxvcGluZyB0
aGUgVFhQCmJsb2NrLCBidXQgSSBjYW4ndCByZXByb2R1Y2UgaXQgKGV2ZW4gYWZ0ZXIgcmV2ZXJ0
aW5nIHRoZXNlIGNoYW5nZXMpLApzbyBpdCB3YXMgcHJvYmFibHkgY2F1c2VkIGJ5IHNvbWV0aGlu
ZyBlbHNlLgoKPiAKPiBUaGUgZmlyc3QgY2hhbmdlIG9mIHRoZSB0d28gc2VlbXMgc3RyYWlnaHRm
b3J3YXJkIGFuZCBnb29kLCB0aG91Z2ggKGFuZAo+IHBvc3NpYmxlIHRvIHNlcGFyYXRlLCByaWdo
dD8pLgoKSSdsbCBwcmVwYXJlIGEgbmV3IHBhdGNoIGNvbnRhaW5pbmcgb25seSB0aGUgZmlyc3Qg
Y2hhbmdlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
