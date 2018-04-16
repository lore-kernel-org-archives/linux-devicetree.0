From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] drm/vc4: Remove the need for the GPU-subsystem DT
 node.
Date: Mon, 16 Apr 2018 15:33:49 -0500
Message-ID: <CAL_JsqKJD86tV0jno_cZR=nLoOThT5rjRu3BPpzAwpcHgxSArQ@mail.gmail.com>
References: <20180413175632.oz62n363g6rxdp6z@rob-hp-laptop>
 <20180416172546.32118-1-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180416172546.32118-1-eric@anholt.net>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, bcm-kernel-feedback-list@broadcom.com, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBBcHIgMTYsIDIwMTggYXQgMTI6MjUgUE0sIEVyaWMgQW5ob2x0IDxlcmljQGFuaG9s
dC5uZXQ+IHdyb3RlOgo+IFRoZSBHUFUgc3Vic3lzdGVtIG5vZGUgd2FzIGEgd29ya2Fyb3VuZCB0
byBoYXZlIGEgY2VudHJhbCBkZXZpY2UgdG8KPiBiaW5kIFYzRCBhbmQgZGlzcGxheSB0by4gIEZv
bGxvd2luZyB0aGUgbGVhZCBvZiAyNDY3NzRkMTdmYzAKPiAoImRybS9ldG5hdml2OiByZW1vdmUg
dGhlIG5lZWQgZm9yIGEgZ3B1LXN1YnN5c3RlbSBEVCBub2RlIiksIHJlbW92ZQo+IHRoZSBzdWJz
eXN0ZW0gbm9kZSB1c2FnZSBhbmQganVzdCBjcmVhdGUgYSBwbGF0Zm9ybSBkZXZpY2UgZm9yIHRo
ZSBEUk0KPiBkZXZpY2UgdG8gYXR0YWNoIHRvIGlmIGFueSBvZiB0aGUgc3Vic3lzdGVtIGRldmlj
ZXMgYXJlIHByZXNlbnQuCj4KPiB2MjogU2ltcGxpZnkgdGhlIERUIHdhbGtpbmcgY29kZS4KCj4g
K3N0YXRpYyBib29sCj4gK2RyaXZlcl9vZl90YWJsZV9oYXNfYV9tYXRjaChjb25zdCBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyICpkcml2ZXIpCj4gK3sKPiArICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbm9kZTsKPiArCj4gKyAgICAgICBub2RlID0gb2ZfZmluZF9tYXRjaGluZ19ub2RlX2FuZF9t
YXRjaChOVUxMLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZHJpdmVyLT5kcml2ZXIub2ZfbWF0Y2hfdGFibGUsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMKTsKPiArICAgICAgIGlmIChvZl9kZXZpY2Vf
aXNfYXZhaWxhYmxlKG5vZGUpKSB7Cj4gKyAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KG5vZGUp
OwoKWW91IG5lZWQgdG8gcHV0IHRoZSBub2RlIHJlZ2FyZGxlc3MuCgo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gdHJ1ZTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1cm4gZmFsc2U7Cj4g
K30KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
