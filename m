From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 5/6] soc: qcom: add OCMEM driver
Date: Mon, 5 Aug 2019 15:41:12 -0700
Message-ID: <20190805224112.GA6470@builder>
References: <20190803142026.9647-1-masneyb@onstation.org>
 <20190803142026.9647-6-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190803142026.9647-6-masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
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
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jonathan-eSc4qw6YbEQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

T24gU2F0IDAzIEF1ZyAwNzoyMCBQRFQgMjAxOSwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3NvYy9xY29tL29jbWVtLmMgYi9kcml2ZXJzL3NvYy9xY29tL29jbWVt
LmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uN2MyOGFkMzEw
OGE2Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvc29jL3Fjb20vb2NtZW0uYwo+IEBA
IC0wLDAgKzEsNDMzIEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkKWy4uXQo+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7CgpTaG91bGRuJ3QgdGhpcyBiZSAiR1BM
IHYyIj8KCgpBcGFydCBmcm9tIHRoYXQgSSB0aGluayB0aGlzIGxvb2tzIGdvb2QuClJldmlld2Vk
LWJ5OiBCam9ybiBBbmRlcnNzb24gPGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnPgoKQFJvYiwg
d291bGQgeW91IGxpa2UgdG8gdGFrZSB0aGlzIHNlcmllcyB0aHJvdWdoIHlvdXIgdHJlZSBvciB3
b3VsZCB5b3UKbGVuZCBtZSBhbiBBY2sgb24gdGhlIGFkcmVubyBwYXRjaCBhbmQgSSdsbCBhcHBs
eSBpdCB0aHJvdWdoIHRoZSBxY29tCnRyZWU/IEZlZWwgZnJlZSB0byBhZGQgbXkgQWNrZWQtYnkg
dG8gdGhlIHJlbGV2YW50IHBhdGNoZXMsIGlmIG5lZWRlZC4KClJlZ2FyZHMsCkJqb3JuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWls
aW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
