From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 5/7] drm/msm/dsi: 28nm PHY: Get ref clock
 from the DT
Date: Tue, 27 Nov 2018 22:18:27 -0800
Message-ID: <CAD=FV=VXo+cifBpdFm4WoOd6pgtdREvhWCR6QPWR3219kcU8fg@mail.gmail.com>
References: <20181126231159.122298-1-mka@chromium.org>
 <20181126231159.122298-6-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181126231159.122298-6-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rajesh Yadav <ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jeykumar Sankaran <jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, freedreno <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGksCgpPbiBNb24sIE5vdiAyNiwgMjAxOCBhdCAzOjEyIFBNIE1hdHRoaWFzIEthZWhsY2tlIDxt
a2FAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IEdldCB0aGUgcmVmIGNsb2NrIG9mIHRoZSBQSFkg
ZnJvbSB0aGUgZGV2aWNlIHRyZWUgaW5zdGVhZCBvZgo+IGhhcmRjb2RpbmcgaXRzIG5hbWUgYW5k
IHJhdGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVt
Lm9yZz4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IC0gcGF0Y2ggYWRkZWQgdG8gdGhlIHNlcmll
cwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9wbGwvZHNpX3BsbF8yOG5tLmMgfCAy
OSArKysrKysrKysrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25z
KCspLCA5IGRlbGV0aW9ucygtKQoKR2VuZXJhbGx5IHNhbWUgZmVlZGJhY2sgYXMgd2l0aCAiMjhu
bSA4OTYwIFBIWSIgcGF0Y2gsIHBsdXMuLi4KCgo+IEBAIC04MSw2ICs4MCw3IEBAIHN0cnVjdCBk
c2lfcGxsXzI4bm0gewo+ICAgICAgICAgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldjsKPiAg
ICAgICAgIHZvaWQgX19pb21lbSAqbW1pbzsKPgo+ICsgICAgICAgc3RydWN0IGNsayAqdmNvX3Jl
Zl9jbGs7Cj4gICAgICAgICBpbnQgdmNvX2RlbGF5Owo+Cj4gICAgICAgICAvKiBwcml2YXRlIGNs
b2NrczogKi8KPiBAQCAtMTM5LDYgKzEzOSw3IEBAIHN0YXRpYyBpbnQgZHNpX3BsbF8yOG5tX2Ns
a19zZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZyByYXRlLAo+ICAgICAg
ICAgc3RydWN0IGRzaV9wbGxfMjhubSAqcGxsXzI4bm0gPSB0b19wbGxfMjhubShwbGwpOwo+ICAg
ICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBsbF8yOG5tLT5wZGV2LT5kZXY7Cj4gICAgICAg
ICB2b2lkIF9faW9tZW0gKmJhc2UgPSBwbGxfMjhubS0+bW1pbzsKPiArICAgICAgIHU2NCByZWZf
Y2xrX3JhdGUgPSBwYXJlbnRfcmF0ZTsKCkFyZSB5b3Ugc3VyZSBpdCdzIGdvb2QgdG8gc3Rhc2gg
dGhpcyBpbiBhIHU2NCBpbnN0ZWFkIG9mIGp1c3QgdXNpbmcKdGhlIHBhcmVudF9yYXRlIGRpcmVj
dGx5PwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVl
ZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K
