From: Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 4/8] drm/msm/dsi: 14nm PHY: Get ref clock
 from the DT
Date: Mon, 10 Dec 2018 07:51:19 -0800
Message-ID: <154445707953.17204.10100324387384439759@swboyd.mtv.corp.google.com>
References: <20181204224234.62619-1-mka@chromium.org>
 <20181204224234.62619-5-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181204224234.62619-5-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rajesh Yadav <ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeykumar Sankaran <jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

UXVvdGluZyBNYXR0aGlhcyBLYWVobGNrZSAoMjAxOC0xMi0wNCAxNDo0MjozMCkKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGxsL2RzaV9wbGxfMTRubS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9kc2kvcGxsL2RzaV9wbGxfMTRubS5jCj4gaW5kZXggNzFmZTYwZTVmMDFm
MS4uMDMyYmYzZTg2MTRiZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9w
bGwvZHNpX3BsbF8xNG5tLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9wbGwvZHNp
X3BsbF8xNG5tLmMKPiBAQCAtNDAsNyArNDAsNiBAQAo+ICAKPiAgI2RlZmluZSBOVU1fUFJPVklE
RURfQ0xLUyAgICAgICAgICAgICAgMgo+ICAKPiAtI2RlZmluZSBWQ09fUkVGX0NMS19SQVRFICAg
ICAgICAgICAgICAgMTkyMDAwMDAKPiAgI2RlZmluZSBWQ09fTUlOX1JBVEUgICAgICAgICAgICAg
ICAgICAgMTMwMDAwMDAwMFVMCj4gICNkZWZpbmUgVkNPX01BWF9SQVRFICAgICAgICAgICAgICAg
ICAgIDI2MDAwMDAwMDBVTAo+ICAKPiBAQCAtMTM5LDYgKzEzOCw3IEBAIHN0cnVjdCBkc2lfcGxs
XzE0bm0gewo+ICAgICAgICAgLyogcHJvdGVjdHMgUkVHX0RTSV8xNG5tX1BIWV9DTU5fQ0xLX0NG
RzAgcmVnaXN0ZXIgKi8KPiAgICAgICAgIHNwaW5sb2NrX3QgcG9zdGRpdl9sb2NrOwo+ICAKPiAr
ICAgICAgIHN0cnVjdCBjbGsgKnZjb19yZWZfY2xrOwoKSXMgdGhlcmUgYW55IG5lZWQgdG8ga2Vl
cCBpdCBpbiB0aGUgc3RydWN0PyBPciBqdXN0IGdldCB0aGUgY2xrLCBmaW5kCnRoZSByYXRlLCBh
bmQgdGhlbiBwdXQgdGhlIGNsayBhbmQgY2FsbCBwbGxfMTRubV9wb3N0ZGl2X3JlZ2lzdGVyKCk/
Cgo+ICAgICAgICAgdTY0IHZjb19jdXJyZW50X3JhdGU7Cj4gICAgICAgICB1NjQgdmNvX3JlZl9j
bGtfcmF0ZTsKPiAgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVu
bwo=
