From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Document the VC4 DSI module nodes.
Date: Mon, 30 Jan 2017 10:51:52 -0600
Message-ID: <CAL_JsqJSXEjVPHx-2R69qmg1vrjT66MiYwnpD4Ki6gfqNYcTrg@mail.gmail.com>
References: <20170124003853.16418-1-eric@anholt.net>
 <20170124003853.16418-2-eric@anholt.net>
 <CAL_JsqJ=VQSUO5MeHJSCB=_SnmOnA7G1=GhmWYKhjm-47kYV-w@mail.gmail.com>
 <87ziibaota.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <87ziibaota.fsf@eliezer.anholt.net>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Michael Turquette <mturquette@baylibre.com>, Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, linux-rpi-kernel@lists.infradead.org, linux-clk <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBKYW4gMjcsIDIwMTcgYXQgODo0MSBQTSwgRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0
Lm5ldD4gd3JvdGU6Cj4gUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4gd3JpdGVzOgo+
Cj4+IE5lZWQgdG8gY2MgRFQgbGlzdCBpZiB5b3Ugd2FudCBpdCBpbiBteSBxdWV1ZS4KPj4KPj4g
T24gTW9uLCBKYW4gMjMsIDIwMTcgYXQgNjozOCBQTSwgRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0
Lm5ldD4gd3JvdGU6Cj4+PiBUaGVzZSBhcmUgcGFydCBvZiB0aGUgdmM0IGRpc3BsYXkgcGlwZWxp
bmUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4K
Pj4+IC0tLQo+Pj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJjbSxiY20tdmM0
LnR4dCAgIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAz
NSBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyY20sYmNtLXZjNC50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmNtLGJjbS12YzQudHh0Cj4+PiBpbmRleCBlMjc2
ODcwM2FjMmIuLjM0YzdmZGRjZWEzOSAxMDA2NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyY20sYmNtLXZjNC50eHQKPj4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyY20sYmNtLXZjNC50eHQKPj4+
IEBAIC01Niw2ICs1NiwxOCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzIGZvciBWM0Q6Cj4+PiAgLSBp
bnRlcnJ1cHRzOiAgVGhlIGludGVycnVwdCBudW1iZXIKPj4+ICAgICAgICAgICAgICAgICAgIFNl
ZSBiaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9icmNtLGJjbTI4MzUtYXJtY3RybC1pYy50
eHQKPj4+Cj4+PiArUmVxdWlyZWQgcHJvcGVydGllcyBmb3IgRFNJOgo+Pj4gKy0gY29tcGF0aWJs
ZTogIFNob3VsZCBiZSAiYnJjbSxiY20yODM1LWRzaTAiIG9yICJicmNtLGJjbTI4MzUtZHNpMSIK
Pj4KPj4gQXJlIHRoZSBibG9ja3MgZGlmZmVyZW50Pwo+Cj4gVGhleSBhcmUgZnJvbSB0aGUgc2Ft
ZSBsaW5lYWdlLCBidXQgdmVyeSBkaWZmZXJlbnQgKG9sZCBkc2kwIGlzIDEgbGFuZSwKPiBkc2kx
IGlzIDQgbGFuZXMpLiAgWW91IGNhbiBzZWUgaG93IG11Y2ggdGhlIHJlZ2lzdGVycyBtb3ZlIGFy
b3VuZCBhbmQKPiBjaGFuZ2UgaW4gdGhlIGRzaS0+cG9ydCBjb25kaXRpb25hbCBibG9ja3MgaW4g
dGhlIGRyaXZlciBjb2RlLgoKT2theSwgY2FuIHlvdSBhZGQgYSBub3RlIGhlcmUgd2l0aCB0aGlz
IGRldGFpbC4gV2l0aCB0aGF0LAoKQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
