From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/6] dt-bindings: display: msm: gmu: add
 optional ocmem property
Date: Wed, 19 Jun 2019 14:16:57 -0600
Message-ID: <CAL_Jsq+Ne=NEcLbO6C19iOny4bwm_m5QEtcsM78ZDeBmDUVO_Q@mail.gmail.com>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190616132930.6942-3-masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, freedreno <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Jonathan Marek <jonathan-eSc4qw6YbEQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gU3VuLCBKdW4gMTYsIDIwMTkgYXQgNzoyOSBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBTb21lIEEzeHggYW5kIEE0eHggQWRyZW5vIEdQVXMgZG8g
bm90IGhhdmUgR01FTSBpbnNpZGUgdGhlIEdQVSBjb3JlIGFuZAo+IG11c3QgdXNlIHRoZSBPbiBD
aGlwIE1FTW9yeSAoT0NNRU0pIGluIG9yZGVyIHRvIGJlIGZ1bmN0aW9uYWwuIEFkZCB0aGUKPiBv
cHRpb25hbCBvY21lbSBwcm9wZXJ0eSB0byB0aGUgQWRyZW5vIEdyYXBoaWNzIE1hbmFnZW1lbnQg
VW5pdCBiaW5kaW5ncy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBv
bnN0YXRpb24ub3JnPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9tc20vZ211LnR4dCB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbXNtL2dtdS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9tc20vZ211LnR4dAo+IGluZGV4IDkwYWY1YjBhNTZhOS4uYzc0NmI5NWU5NWQ0IDEw
MDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21z
bS9nbXUudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbXNtL2dtdS50eHQKPiBAQCAtMzEsNiArMzEsMTAgQEAgUmVxdWlyZWQgcHJvcGVydGllczoK
PiAgLSBpb21tdXM6IHBoYW5kbGUgdG8gdGhlIGFkcmVubyBpb21tdQo+ICAtIG9wZXJhdGluZy1w
b2ludHMtdjI6IHBoYW5kbGUgdG8gdGhlIE9QUCBvcGVyYXRpbmcgcG9pbnRzCj4KPiArT3B0aW9u
YWwgcHJvcGVydGllczoKPiArLSBvY21lbTogcGhhbmRsZSB0byB0aGUgT24gQ2hpcCBNZW1vcnkg
KE9DTUVNKSB0aGF0J3MgcHJlc2VudCBvbiBzb21lIFNuYXBkcmFnb24KPiArICAgICAgICAgU29D
cy4gU2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLG9j
bWVtLnlhbWwuCgpXZSBhbHJlYWR5IGhhdmUgYSBjb3VwbGUgb2Ygc2ltaWxhciBwcm9wZXJ0aWVz
LiBMZXRzIHN0YW5kYXJkaXplIG9uCidzcmFtJyBhcyB0aGF0IGlzIHdoYXQgVEkgYWxyZWFkeSB1
c2VzLgoKQWxzbywgaXMgdGhlIHdob2xlIE9DTUVNIGFsbG9jYXRlZCB0byB0aGUgR01VPyBJZiBu
b3QgeW91IHNob3VsZCBoYXZlCmNoaWxkIG5vZGVzIHRvIHN1YmRpdmlkZSB0aGUgbWVtb3J5LgoK
Um9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVk
cmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
