From: Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: msm/dsi: Add ref clock for
 10nm PHY
Date: Mon, 5 Nov 2018 12:34:56 -0500
Message-ID: <20181105173456.GK154160@art_vandelay>
References: <20181102214534.184593-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20181102214534.184593-1-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rajesh Yadav <ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBOb3YgMDIsIDIwMTggYXQgMDI6NDU6MzNQTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxj
a2Ugd3JvdGU6Cj4gQWxsb3cgdGhlIDEwbm0gUEhZIGRyaXZlciB0byBnZXQgdGhlIHJlZiBjbG9j
ayBmcm9tIHRoZSBEVC4KPiAKCk1pZ2h0IGJlIG5pY2UgdG8gc3RhdGUgdGhhdCB0aGVyZSBhcmUg
bm8gY3VycmVudCB1c2VycyBvZiB0aGUgMTBubSBwaHkgaW4geW91cgpjb21taXQgbWVzc2FnZS4K
ClNlYW4KCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5v
cmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21z
bS9kc2kudHh0IHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bXNtL2RzaS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
c20vZHNpLnR4dAo+IGluZGV4IGRmYzc0MzIxOWJkODguLmQwZDIwNDZjZWZmNjkgMTAwNjQ0Cj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RzaS50
eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20v
ZHNpLnR4dAo+IEBAIC0xMDUsNiArMTA1LDEwIEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gIC0g
cG93ZXItZG9tYWluczogU2hvdWxkIGJlIDwmbW1jYyBNRFNTX0dEU0M+Lgo+ICAtIGNsb2Nrczog
UGhhbmRsZXMgdG8gZGV2aWNlIGNsb2Nrcy4gU2VlIFsxXSBmb3IgZGV0YWlscyBvbiBjbG9jayBi
aW5kaW5ncy4KPiAgLSBjbG9jay1uYW1lczogdGhlIGZvbGxvd2luZyBjbG9ja3MgYXJlIHJlcXVp
cmVkOgo+ICsgIEZvciAxMG5tIFBIWToKPiArICAqICJpZmFjZSIKPiArICAqICJyZWYiCj4gKyAg
Rm9yIG90aGVyIFBIWXM6Cj4gICAgKiAiaWZhY2UiCj4gICAgRm9yIDI4bm0gSFBNL0xQLCAyOG5t
IDg5NjAgUEhZczoKPiAgLSB2ZGRpby1zdXBwbHk6IHBoYW5kbGUgdG8gdmRkLWlvIHJlZ3VsYXRv
ciBkZXZpY2Ugbm9kZQo+IC0tIAo+IDIuMTkuMS45MzAuZzQ1NjNhMGQ5ZDAtZ29vZwo+IAoKLS0g
ClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWls
aW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
