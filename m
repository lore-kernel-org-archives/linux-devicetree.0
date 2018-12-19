From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 1/8] dt-bindings: msm/dsi: Add ref clock for
 PHYs
Date: Wed, 19 Dec 2018 15:55:21 -0800
Message-ID: <20181219235528.114830-2-mka@chromium.org>
References: <20181219235528.114830-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181219235528.114830-1-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rajesh Yadav <ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeykumar Sankaran <jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

QWxsb3cgdGhlIFBIWSBkcml2ZXJzIHRvIGdldCB0aGUgcmVmIGNsb2NrIGZyb20gdGhlIERULgoK
U2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+ClJldmll
d2VkLWJ5OiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+ClJldmlld2VkLWJ5OiBE
b3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+ClJldmlld2VkLWJ5OiBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KQ2hhbmdlcyBpbiB2NToKLSBhZGRlZCAiUmV2
aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IiB0YWcKCkNoYW5nZXMgaW4g
djQ6Ci0gYWRkZWQgIlJldmlld2VkLWJ5IiB0YWdzIGZyb20gU3RlcGhlbiBhbmQgRG91ZwoKQ2hh
bmdlcyBpbiB2MzoKLSBhZGRlZCBub3RlIHRoYXQgdGhlIHJlZiBjbG9jayBpcyBvbmx5IHJlcXVp
cmVkIGZvciBuZXcgRFRTCiAgZmlsZXMvZW50cmllcwoKQ2hhbmdlcyBpbiB2MjoKLSBhZGQgdGhl
IHJlZiBjbG9jayBmb3IgYWxsIFBIWXMsIG5vdCBvbmx5IHRoZSAxMG5tIG9uZQotIHVwZGF0ZWQg
Y29tbWl0IG1lc3NhZ2UKLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tc20vZHNpLnR4dCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNt
L2RzaS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20v
ZHNpLnR4dAppbmRleCBkZmM3NDMyMTliZDg4Li45YWU5NDY5NDI3MjA3IDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dApA
QCAtMTA2LDYgKzEwNiw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAtIGNsb2NrczogUGhhbmRs
ZXMgdG8gZGV2aWNlIGNsb2Nrcy4gU2VlIFsxXSBmb3IgZGV0YWlscyBvbiBjbG9jayBiaW5kaW5n
cy4KIC0gY2xvY2stbmFtZXM6IHRoZSBmb2xsb3dpbmcgY2xvY2tzIGFyZSByZXF1aXJlZDoKICAg
KiAiaWZhY2UiCisgICogInJlZiIgKG9ubHkgcmVxdWlyZWQgZm9yIG5ldyBEVFMgZmlsZXMvZW50
cmllcykKICAgRm9yIDI4bm0gSFBNL0xQLCAyOG5tIDg5NjAgUEhZczoKIC0gdmRkaW8tc3VwcGx5
OiBwaGFuZGxlIHRvIHZkZC1pbyByZWd1bGF0b3IgZGV2aWNlIG5vZGUKICAgRm9yIDIwbm0gUEhZ
OgotLSAKMi4yMC4xLjQxNS5nNjUzNjEzYzcyMy1nb29nCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVu
b0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9mcmVlZHJlbm8K
