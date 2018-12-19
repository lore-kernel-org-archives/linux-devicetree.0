From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 4/8] drm/msm/dsi: 14nm PHY: Get ref clock
 from the DT
Date: Wed, 19 Dec 2018 14:22:22 -0800
Message-ID: <20181219222222.GA261387@google.com>
References: <20181204224234.62619-1-mka@chromium.org>
 <20181204224234.62619-5-mka@chromium.org>
 <154445707953.17204.10100324387384439759@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <154445707953.17204.10100324387384439759-n1Xw8LXHxjTHt/MElyovVYaSKrA+ACpX0E9HWUfgJXw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rajesh Yadav <ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jeykumar Sankaran <jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBEZWMgMTAsIDIwMTggYXQgMDc6NTE6MTlBTSAtMDgwMCwgU3RlcGhlbiBCb3lkIHdy
b3RlOgo+IFF1b3RpbmcgTWF0dGhpYXMgS2FlaGxja2UgKDIwMTgtMTItMDQgMTQ6NDI6MzApCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGxsL2RzaV9wbGxfMTRubS5j
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGxsL2RzaV9wbGxfMTRubS5jCj4gPiBpbmRleCA3
MWZlNjBlNWYwMWYxLi4wMzJiZjNlODYxNGJkIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9kc2kvcGxsL2RzaV9wbGxfMTRubS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2RzaS9wbGwvZHNpX3BsbF8xNG5tLmMKPiA+IEBAIC00MCw3ICs0MCw2IEBACj4gPiAgCj4g
PiAgI2RlZmluZSBOVU1fUFJPVklERURfQ0xLUyAgICAgICAgICAgICAgMgo+ID4gIAo+ID4gLSNk
ZWZpbmUgVkNPX1JFRl9DTEtfUkFURSAgICAgICAgICAgICAgIDE5MjAwMDAwCj4gPiAgI2RlZmlu
ZSBWQ09fTUlOX1JBVEUgICAgICAgICAgICAgICAgICAgMTMwMDAwMDAwMFVMCj4gPiAgI2RlZmlu
ZSBWQ09fTUFYX1JBVEUgICAgICAgICAgICAgICAgICAgMjYwMDAwMDAwMFVMCj4gPiAgCj4gPiBA
QCAtMTM5LDYgKzEzOCw3IEBAIHN0cnVjdCBkc2lfcGxsXzE0bm0gewo+ID4gICAgICAgICAvKiBw
cm90ZWN0cyBSRUdfRFNJXzE0bm1fUEhZX0NNTl9DTEtfQ0ZHMCByZWdpc3RlciAqLwo+ID4gICAg
ICAgICBzcGlubG9ja190IHBvc3RkaXZfbG9jazsKPiA+ICAKPiA+ICsgICAgICAgc3RydWN0IGNs
ayAqdmNvX3JlZl9jbGs7Cj4gCj4gSXMgdGhlcmUgYW55IG5lZWQgdG8ga2VlcCBpdCBpbiB0aGUg
c3RydWN0PyBPciBqdXN0IGdldCB0aGUgY2xrLCBmaW5kCj4gdGhlIHJhdGUsIGFuZCB0aGVuIHB1
dCB0aGUgY2xrIGFuZCBjYWxsIHBsbF8xNG5tX3Bvc3RkaXZfcmVnaXN0ZXIoKT8KCkkgc3VwcG9z
ZSB5b3UgbWVhbiBwYXNzaW5nIHRoZSBjbG9jayBuYW1lIHRvIHBsbF8xNG5tX3JlZ2lzdGVyKCk/
CgpJcyBwdXR0aW5nIHRoZSBjbG9jayByZWFsbHkgbmVlZGVkIG9yIHByZWZlcmFibGUsIG9yIGlz
IGl0IGp1c3QgZmluZQp0byBhdXRvLXB1dCBpdCB3aGVuIHRoZSBkZXZpY2UgaXMgZGVsZXRlZD8K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5v
IG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==
