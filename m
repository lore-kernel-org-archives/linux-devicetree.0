From: Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 5/8] drm/msm/dsi: 10nm PHY: Get ref clock
 from the DT
Date: Mon, 10 Dec 2018 07:52:34 -0800
Message-ID: <154445715454.17204.5993193179251214562@swboyd.mtv.corp.google.com>
References: <20181204224234.62619-1-mka@chromium.org>
 <20181204224234.62619-6-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181204224234.62619-6-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

UXVvdGluZyBNYXR0aGlhcyBLYWVobGNrZSAoMjAxOC0xMi0wNCAxNDo0MjozMSkKPiBHZXQgdGhl
IHJlZiBjbG9jayBvZiB0aGUgUEhZIGZyb20gdGhlIGRldmljZSB0cmVlIGluc3RlYWQgb2YKPiBo
YXJkY29kaW5nIGl0cyBuYW1lIGFuZCByYXRlLgo+IAo+IE5vdGU6IFRoaXMgY2hhbmdlIGNvdWxk
IGJyZWFrIG9sZCBvdXQtb2YtdHJlZSBEVFMgZmlsZXMgdGhhdAo+IHVzZSB0aGUgMTBubSBQSFkK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4K
PiBSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+
IC0tLQo+IENoYW5nZXMgaW4gdjQ6Cj4gLSBub25lCj4gCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIGZp
eGVkIGNoZWNrIGZvciBFUFJPQkVfREVGRVIKPiAtIGFkZGVkIG5vdGUgdG8gY29tbWl0IG1lc3Nh
Z2UgYWJvdXQgYnJlYWtpbmcgb2xkIERUUyBmaWxlcwo+IC0gYWRkZWQgJ1Jldmlld2VkLWJ5OiBE
b3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+JyB0YWcKPiAKPiBDaGFuZ2Vz
IGluIHYyOgo+IC0gcmVtb3ZlIGFub255bW91cyBhcnJheSBpbiBjbGtfaW5pdF9kYXRhIGFzc2ln
bm1lbnQKPiAtIGxvZyBlcnJvciBjb2RlIGlmIGRldm1fY2xrX2dldCgpIGZhaWxzCj4gLSBkb24n
dCBsb2cgZGV2bV9jbGtfZ2V0KCkgZmFpbHVyZXMgZm9yIC1FUFJPQkVfREVGRVIKPiAtIHVwZGF0
ZWQgY29tbWl0IG1lc3NhZ2UKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGxsL2Rz
aV9wbGxfMTBubS5jIHwgMTMgKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2RzaS9wbGwvZHNpX3BsbF8xMG5tLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9w
bGwvZHNpX3BsbF8xMG5tLmMKPiBpbmRleCA0YzAzZjBiNzM0M2VkLi4yZDIzMzcyYWNkMjBkIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BsbC9kc2lfcGxsXzEwbm0uYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BsbC9kc2lfcGxsXzEwbm0uYwo+IEBAIC05
MSw2ICs5MSw3IEBAIHN0cnVjdCBkc2lfcGxsXzEwbm0gewo+ICAgICAgICAgdm9pZCBfX2lvbWVt
ICpwaHlfY21uX21taW87Cj4gICAgICAgICB2b2lkIF9faW9tZW0gKm1taW87Cj4gIAo+ICsgICAg
ICAgc3RydWN0IGNsayAqdmNvX3JlZl9jbGs7CgpTYW1lIGNvbW1lbnQsIGFuZCBhbHNvIGdldCB0
aGUgbmFtZSBpbiBwcm9iZSBvciBwYXNzIHRoZSBjbGsgcG9pbnRlcgphcm91bmQgaW5zdGVhZCBv
ZiBzdG9yaW5nIGl0IGZvcmV2ZXIuCgo+ICAgICAgICAgdTY0IHZjb19yZWZfY2xrX3JhdGU7Cj4g
ICAgICAgICB1NjQgdmNvX2N1cnJlbnRfcmF0ZTsKPiAgCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5v
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
