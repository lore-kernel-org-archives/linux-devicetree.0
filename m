From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/5] drm/msm/mdp4: add lcdc-align-lsb
 flag to control lane alignment
Date: Fri, 7 Dec 2018 17:18:18 -0600
Message-ID: <20181207231818.GA16687@bogus>
References: <20181204151702.8514-1-jonathan@marek.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20181204151702.8514-1-jonathan-eSc4qw6YbEQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jonathan Marek <jonathan-eSc4qw6YbEQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jeykumar Sankaran <jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAgNCBEZWMgMjAxOCAxMDoxNjo1NyAtMDUwMCwgSm9uYXRoYW4gTWFyZWsgd3JvdGU6
Cj4gVGhpcyBhbGxvd3MgY29udHJvbGxpbmcgd2hpY2ggb2YgdGhlIDggbGFuZXMgYXJlIHVzZWQg
Zm9yIDYgYml0IGNvbG9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIE1hcmVrIDxqb25h
dGhhbkBtYXJlay5jYT4KPiAtLS0KPiB2MzogcmVtb3ZlZCBlbXB0eSBsaW5lIGFuZCBhZGRlZCBk
b2N1bWVudGF0aW9uCj4gCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL21k
cDQudHh0ICB8ICAyICsrCj4gIC4uLi9ncHUvZHJtL21zbS9kaXNwL21kcDQvbWRwNF9sY2RjX2Vu
Y29kZXIuYyB8IDIxICsrKysrKysrKysrKy0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Zy
ZWVkcmVubwo=
