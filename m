From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: msm/dsi: Add ref clock for
 10nm PHY
Date: Fri,  2 Nov 2018 14:45:33 -0700
Message-ID: <20181102214534.184593-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rajesh Yadav <ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

QWxsb3cgdGhlIDEwbm0gUEhZIGRyaXZlciB0byBnZXQgdGhlIHJlZiBjbG9jayBmcm9tIHRoZSBE
VC4KClNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgot
LS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kc2kudHh0
IHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RzaS50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dAppbmRl
eCBkZmM3NDMyMTliZDg4Li5kMGQyMDQ2Y2VmZjY5IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dApAQCAtMTA1LDYgKzEw
NSwxMCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogLSBwb3dlci1kb21haW5zOiBTaG91bGQgYmUg
PCZtbWNjIE1EU1NfR0RTQz4uCiAtIGNsb2NrczogUGhhbmRsZXMgdG8gZGV2aWNlIGNsb2Nrcy4g
U2VlIFsxXSBmb3IgZGV0YWlscyBvbiBjbG9jayBiaW5kaW5ncy4KIC0gY2xvY2stbmFtZXM6IHRo
ZSBmb2xsb3dpbmcgY2xvY2tzIGFyZSByZXF1aXJlZDoKKyAgRm9yIDEwbm0gUEhZOgorICAqICJp
ZmFjZSIKKyAgKiAicmVmIgorICBGb3Igb3RoZXIgUEhZczoKICAgKiAiaWZhY2UiCiAgIEZvciAy
OG5tIEhQTS9MUCwgMjhubSA4OTYwIFBIWXM6CiAtIHZkZGlvLXN1cHBseTogcGhhbmRsZSB0byB2
ZGQtaW8gcmVndWxhdG9yIGRldmljZSBub2RlCi0tIAoyLjE5LjEuOTMwLmc0NTYzYTBkOWQwLWdv
b2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVk
cmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
