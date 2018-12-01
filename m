From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 1/8] dt-bindings: msm/dsi: Add ref clock for
 PHYs
Date: Fri, 30 Nov 2018 16:52:47 -0800
Message-ID: <20181201005254.139908-2-mka@chromium.org>
References: <20181201005254.139908-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181201005254.139908-1-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
U2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+Ci0tLQpD
aGFuZ2VzIGluIFYzOgotIGFkZGVkIG5vdGUgdGhhdCB0aGUgcmVmIGNsb2NrIGlzIG9ubHkgcmVx
dWlyZWQgZm9yIG5ldyBEVFMKICBmaWxlcy9lbnRyaWVzCgpDaGFuZ2VzIGluIHYyOgotIGFkZCB0
aGUgcmVmIGNsb2NrIGZvciBhbGwgUEhZcywgbm90IG9ubHkgdGhlIDEwbm0gb25lCi0gdXBkYXRl
ZCBjb21taXQgbWVzc2FnZQotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21zbS9kc2kudHh0IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
c20vZHNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21z
bS9kc2kudHh0CmluZGV4IGRmYzc0MzIxOWJkODguLjlhZTk0Njk0MjcyMDcgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kc2kudHh0Cisr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kc2kudHh0
CkBAIC0xMDYsNiArMTA2LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKIC0gY2xvY2tzOiBQaGFu
ZGxlcyB0byBkZXZpY2UgY2xvY2tzLiBTZWUgWzFdIGZvciBkZXRhaWxzIG9uIGNsb2NrIGJpbmRp
bmdzLgogLSBjbG9jay1uYW1lczogdGhlIGZvbGxvd2luZyBjbG9ja3MgYXJlIHJlcXVpcmVkOgog
ICAqICJpZmFjZSIKKyAgKiAicmVmIiAob25seSByZXF1aXJlZCBmb3IgbmV3IERUUyBmaWxlcy9l
bnRyaWVzKQogICBGb3IgMjhubSBIUE0vTFAsIDI4bm0gODk2MCBQSFlzOgogLSB2ZGRpby1zdXBw
bHk6IHBoYW5kbGUgdG8gdmRkLWlvIHJlZ3VsYXRvciBkZXZpY2Ugbm9kZQogICBGb3IgMjBubSBQ
SFk6Ci0tIAoyLjIwLjAucmMxLjM4Ny5nZjg1MDU3NjJlMy1nb29nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZy
ZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K
