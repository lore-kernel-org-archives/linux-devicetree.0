From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 02/12] drm/etnaviv: add devicetree bindings
Date: Sat, 5 Dec 2015 11:02:09 +0000
Message-ID: <20151205110209.GG8644@n2100.arm.linux.org.uk>
References: <20151204162956.GA14978@rob-hp-laptop>
 <1449247305.8275.104.camel@pengutronix.de>
 <CAL_JsqLcwk=h10zNvt1o=EKJZ58QvMyWnsTCNfkht-055X8Taw@mail.gmail.com>
 <1449251760.8275.116.camel@pengutronix.de>
 <CAL_Jsq+oaJxD3vbDWzn_4ghpqi=RZ1o+8nOcepWYjzcu5Hwpjg@mail.gmail.com>
 <20151204203101.GD8644@n2100.arm.linux.org.uk>
 <CAKb7UviPhoiY-YP2aBHm0BHbeEjSF2wTguQScVXMBve-kZc16Q@mail.gmail.com>
 <20151204220533.GE8644@n2100.arm.linux.org.uk>
 <CAKb7UvgzYMxPxtt8iPars13n4sAJ5Z4Hva1KHO+k4yNumDb+DQ@mail.gmail.com>
 <20151205101208.GP10243@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20151205101208.GP10243@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, patchwork-lst@pengutronix.de, "kernel@pengutronix.de" <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

T24gU2F0LCBEZWMgMDUsIDIwMTUgYXQgMTE6MTI6MDhBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBHaXZlbiB0aGF0IEkgdGhpbmsgdGhlIGN1cnJlbnQgZXRuYXZpdiBpcyBhIHNvdW5k
IGFyY2hpdGVjdHVyZS4gQW5kIEknbQo+IG5vdCBzYXlpbmcgdGhhdCBiZWNhdXNlIGRybSByZXF1
aXJlcyBldmVyeXRoaW5nIHRvIGJlIHNtYXNoZWQgaW50byBvbmUKPiBkcml2ZXIsIHNpbmNlIHRo
YXQncyBzaW1wbGUgbm90IHRoZSBjYXNlLgoKVGhlcmUncyBvdGhlciByZWFzb25zIGFzIHdlbGws
IG1vc3RseSBmcm9tIHRoZSBwZXJmb3JtYW5jZSBwb2ludCBvZiB2aWV3LgpIYXZpbmcgc2VwYXJh
dGUgRFJNIGRldmljZXMgZm9yIGVhY2ggR1BVIG1lYW5zIHlvdSBuZWVkIHRvIHVzZSBkbWFidWYg
dG8Kc2hhcmUgYnVmZmVycyBhY3Jvc3MgdGhlIEdQVXMuICBUaGlzIGJyaW5ncyB3aXRoIGl0IHNl
dmVyYWwga2luZHMgb2YKb3ZlcmhlYWQ6CgoxLiBoYXZpbmcgbW9yZSBmZCB1c2FnZSBpbiB0aGUg
Y2xpZW50IHByb2dyYW1zLgoyLiBoYXZpbmcgbW9yZSBtZW1vcnkgdXNhZ2UgYXMgYSByZXN1bHQu
CjMuIGhhdmluZyBtb3JlIGxvY2tzLCBkdWUgdG8gbW9yZSBvYmplY3QgbGlzdHMuCjQuIGhhdmlu
ZyB0aGUgb3ZlcmhlYWQgZnJvbSB0aGUgRE1BIEFQSSB3aGVuIGltcG9ydGluZyBidWZmZXJzIGJl
dHdlZW4KICAgZGlmZmVyZW50IEdQVSBub2Rlcy4KCkZyb20gbXkgcGVyZm9ybWFuY2UgbWVhc3Vy
ZW1lbnRzIG92ZXIgdGhlIGxhc3QgbW9udGgsIHRoZSB0b3AgaGl0IGlzCmN1cnJlbnRseSBmcm9t
IHRoZSBETUEgQVBJLCBzbyBoYXZpbmcgdG8gZXhwb3J0IGFuZCBpbXBvcnQgYnVmZmVycwpiZXR3
ZWVuIGRpZmZlcmVudCBHUFUgZGV2aWNlcyBpcyBqdXN0IGdvaW5nIHRvIG1ha2UgdGhhdCB3b3Jz
ZS4KCi0tIApGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5lOiBjdXJyZW50bHkgYXQgOS42
TWJwcyBkb3duIDQwMGticHMgdXAKYWNjb3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
