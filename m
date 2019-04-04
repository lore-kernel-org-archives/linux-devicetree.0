From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v5 0/3] drm/panel: Support Rocktech jh057n00900 DSI panel
Date: Wed, 03 Apr 2019 22:02:19 -0700
Message-ID: <a302abb662c8c9fae44b5555cb5c7e1bffc20540.camel@perches.com>
References: <cover.1554114302.git.agx@sigxcpu.org> <20190403161735.GN5238@ulmo>
 <1ed5eb3af4df6b2dd1544c7b696e034ed5c94f06.camel@perches.com>
 <c2f6a9f0ea59dc1491a8429a51afe56e488dfb3c.camel@perches.com>
 <20190403210738.GA9173@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190403210738.GA9173@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>, Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE5LTA0LTAzIGF0IDIzOjA3ICswMjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4g
SGkgSm9lLgo+IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaC4KPiAKPiA+IC0tLQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jIHwgMjEwICsrKysr
KysrKysrKystLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMzYgaW5zZXJ0aW9ucygrKSwg
NzQgZGVsZXRpb25zKC0pCj4gCj4gSG1tbSwgYWRkIG1vcmUgbGluZXMgdGhhbiBpdCBkZWxldGVz
LgoKWWVhaCwgSSBzYWlkIHRoYXQgdG9vLgoKPiA+IC0jZGVmaW5lIGRzaV9nZW5lcmljX3dyaXRl
X3NlcShkc2ksIHNlcS4uLikgZG8gewkJCQlcCj4gPiAtCQlzdGF0aWMgY29uc3QgdTggZFtdID0g
eyBzZXEgfTsJCQkJXAo+ID4gLQkJaW50IHJldDsJCQkJCQlcCj4gPiAtCQlyZXQgPSBtaXBpX2Rz
aV9nZW5lcmljX3dyaXRlKGRzaSwgZCwgQVJSQVlfU0laRShkKSk7CVwKPiA+IC0JCWlmIChyZXQg
PCAwKQkJCQkJCVwKPiA+IC0JCQlyZXR1cm4gcmV0OwkJCQkJXAo+ID4gLQl9IHdoaWxlICgwKQo+
IFRoZSBhYm92ZSBtYWNybyB3YXMgdGhlIG9uZSB0cmlnZ2VyaW5nIHRoaXMgcGF0Y2guCj4gQW5k
IGZyYW5rbHkgaXQgbG9va3MgbmljZSBhbmQgc2ltcGxlLgo+IAo+IFRoZSBvbGQgY29kZSBpcyBJ
TU8gbW9yZSByZWFkYWJsZS4KPiAtIFdlIGhhdmUgYWxsIHRoZSBjb21tYW5kcyBsaXN0ZWQgaW4g
dGhlIG9yZGVyIHRoZXkKPiAgIGFyZSB1c2VkIGFuZCBpbiBhIHJhaHRlciBjb21wYXRjaCBmb3Jt
YXQuCgpUaGlzIHRvby4KCj4gLSBJdCBpcyBvYnZpb3VzIHdoZW4gd2UgbmVlZCBkZWxheXMuCgpI
ZXJlIHRvbywgYWxzbyBpdCBhbGxvd3MgYW4gZWFzeSB3YXkgdG8gdXBkYXRlCmlmIHRoZXJlIGlz
IGFub3RoZXIgZGVsYXkgbmVlZGVkIGJldHdlZW4gMiB1c2VzLgoKPiAtIFdlIGhhdmUgdHJhZGl0
aW9uYWwgI2RlZmluZXMgZm9yIHRoZSBjb25zdGFudHMgd2Uga25vdwoKQW5kIHRoZSB2YWx1ZXMg
Zm9yIHRoZSBkYXRhIGZvciB0aG9zZSBjb25zdGFudHMgYXJlCnNlcGFyYXRlZCBmcm9tIHRoZSBj
b25zdGFudHMgdGhlbXNlbHZlcyBhcyB3ZWxsIGFzCmF0IGxlYXN0IDEgbWlzc2luZyBjb25zdGFu
dC4KCj4gVGhpcyBpcyBhbGwgdG8gc29tZSBleHRlbnQgYmlrZXNoZWRkaW5nLAoKWXVwLiAgU3Rp
bGwsIEkgdGhpbmsgd2hhdCBJIHN1Z2dlc3RlZCBpcyBtb3JlIHJlYWRhYmxlIDspCgo+IGJ1dCBJ
IHN1Z2dlc3QKPiB0byBrZWVwIHRoZSBjdXJyZW50IGNvZGUuCj4gSXQgaXMgc2ltcGxlIGFuZCBp
dCBpcyB0ZXN0ZWQuCgpidHc6IFRoZSBvYmplY3QgY29kZSBmb3IgZWl0aGVyIGlzIHRoZSBzYW1l
IHNpemUgb24geDg2LTY0Cgo+IFRoYW5rcyBmb3IgdHJ5aW5nIHRvIGNvbWUgdXAgd2l0aCBhIGJl
dHRlciBzb2x1dGlvbi4KCm4vYy4KCmNoZWVycywgSm9lCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
