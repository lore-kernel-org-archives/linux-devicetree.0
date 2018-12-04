From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 1/8] dt-bindings: msm/dsi: Add ref clock for
 PHYs
Date: Tue,  4 Dec 2018 14:42:27 -0800
Message-ID: <20181204224234.62619-2-mka@chromium.org>
References: <20181204224234.62619-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181204224234.62619-1-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rajesh Yadav <ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeykumar Sankaran <jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

QWxsb3cgdGhlIFBIWSBkcml2ZXJzIHRvIGdldCB0aGUgcmVmIGNsb2NrIGZyb20gdGhlIERULgoK
U2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+ClJldmll
d2VkLWJ5OiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+ClJldmlld2VkLWJ5OiBE
b3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Ci0tLQpDaG5hZ2VzIGluIHY0
OgotIGFkZGVkICJSZXZpZXdlZC1ieSIgdGFncyBmcm9tIFN0ZXBoZW4gYW5kIERvdWcKCkNoYW5n
ZXMgaW4gdjM6Ci0gYWRkZWQgbm90ZSB0aGF0IHRoZSByZWYgY2xvY2sgaXMgb25seSByZXF1aXJl
ZCBmb3IgbmV3IERUUwogIGZpbGVzL2VudHJpZXMKCkNoYW5nZXMgaW4gdjI6Ci0gYWRkIHRoZSBy
ZWYgY2xvY2sgZm9yIGFsbCBQSFlzLCBub3Qgb25seSB0aGUgMTBubSBvbmUKLSB1cGRhdGVkIGNv
bW1pdCBtZXNzYWdlCi0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbXNtL2RzaS50eHQgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9k
c2kudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2Rz
aS50eHQKaW5kZXggZGZjNzQzMjE5YmQ4OC4uOWFlOTQ2OTQyNzIwNyAxMDA2NDQKLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RzaS50eHQKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RzaS50eHQKQEAg
LTEwNiw2ICsxMDYsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogLSBjbG9ja3M6IFBoYW5kbGVz
IHRvIGRldmljZSBjbG9ja3MuIFNlZSBbMV0gZm9yIGRldGFpbHMgb24gY2xvY2sgYmluZGluZ3Mu
CiAtIGNsb2NrLW5hbWVzOiB0aGUgZm9sbG93aW5nIGNsb2NrcyBhcmUgcmVxdWlyZWQ6CiAgICog
ImlmYWNlIgorICAqICJyZWYiIChvbmx5IHJlcXVpcmVkIGZvciBuZXcgRFRTIGZpbGVzL2VudHJp
ZXMpCiAgIEZvciAyOG5tIEhQTS9MUCwgMjhubSA4OTYwIFBIWXM6CiAtIHZkZGlvLXN1cHBseTog
cGhhbmRsZSB0byB2ZGQtaW8gcmVndWxhdG9yIGRldmljZSBub2RlCiAgIEZvciAyMG5tIFBIWToK
LS0gCjIuMjAuMC5yYzEuMzg3LmdmODUwNTc2MmUzLWdvb2cKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
