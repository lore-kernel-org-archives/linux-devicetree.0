From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 1/3] drm/vc4: Remove the need for the GPU-subsystem DT
 node.
Date: Tue, 17 Apr 2018 08:09:06 -0500
Message-ID: <CAL_JsqJxG1b2NO6CJTge=7PuYJgLfD9uzit_GiXbH8B79v+aZQ@mail.gmail.com>
References: <CAL_JsqKJD86tV0jno_cZR=nLoOThT5rjRu3BPpzAwpcHgxSArQ@mail.gmail.com>
 <20180416225259.6571-1-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180416225259.6571-1-eric@anholt.net>
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

T24gTW9uLCBBcHIgMTYsIDIwMTggYXQgNTo1MiBQTSwgRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0
Lm5ldD4gd3JvdGU6Cj4gVGhlIEdQVSBzdWJzeXN0ZW0gbm9kZSB3YXMgYSB3b3JrYXJvdW5kIHRv
IGhhdmUgYSBjZW50cmFsIGRldmljZSB0bwo+IGJpbmQgVjNEIGFuZCBkaXNwbGF5IHRvLiAgRm9s
bG93aW5nIHRoZSBsZWFkIG9mIDI0Njc3NGQxN2ZjMAo+ICgiZHJtL2V0bmF2aXY6IHJlbW92ZSB0
aGUgbmVlZCBmb3IgYSBncHUtc3Vic3lzdGVtIERUIG5vZGUiKSwgcmVtb3ZlCj4gdGhlIHN1YnN5
c3RlbSBub2RlIHVzYWdlIGFuZCBqdXN0IGNyZWF0ZSBhIHBsYXRmb3JtIGRldmljZSBmb3IgdGhl
IERSTQo+IGRldmljZSB0byBhdHRhY2ggdG8gaWYgYW55IG9mIHRoZSBzdWJzeXN0ZW0gZGV2aWNl
cyBhcmUgcHJlc2VudC4KPgo+IHYyOiBTaW1wbGlmeSB0aGUgRFQgd2Fsa2luZyBjb2RlLgo+IHYz
OiBBbHdheXMgcHV0IHRoZSBub2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogRXJpYyBBbmhvbHQgPGVy
aWNAYW5ob2x0Lm5ldD4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJjbSxiY20tdmM0
LnR4dCAgICAgICAgIHwgIDcgLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHJ2LmMg
ICAgICAgICAgICAgICAgIHwgMjggKysrKysrKysrKysrKy0tLS0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vdmM0L3ZjNF9odnMuYyAgICAgICAgICAgICAgICAgfCAgMSArCj4gIGRyaXZlcnMvZ3B1L2Ry
bS92YzQvdmM0X3YzZC5jICAgICAgICAgICAgICAgICB8ICAxICsKPiAgNCBmaWxlcyBjaGFuZ2Vk
LCAyMiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
