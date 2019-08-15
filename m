From: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Subject: [PATCH 09/11] ARM: dts: qcom: pm8941: add 5vs2
 regulator node
Date: Wed, 14 Aug 2019 20:48:52 -0400
Message-ID: <20190815004854.19860-10-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190815004854.19860-1-masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

cG04OTQxIGlzIG1pc3NpbmcgdGhlIDV2czIgcmVndWxhdG9yIG5vZGUgc28gbGV0J3MgYWRkIGl0
IHNpbmNlIGl0cwpuZWVkZWQgdG8gZ2V0IHRoZSBleHRlcm5hbCBkaXNwbGF5IHdvcmtpbmcuIFRo
aXMgcmVndWxhdG9yIHdhcyBhbHJlYWR5CmNvbmZpZ3VyZWQgaW4gdGhlIGludGVycnVwdHMgcHJv
cGVydHkgb24gdGhlIHBhcmVudCBub2RlLgoKTm90ZSB0aGF0IHRoaXMgcmVndWxhdG9yIGlzIHJl
ZmVycmVkIHRvIGFzIG12czIgaW4gdGhlIGRvd25zdHJlYW0gTVNNCmtlcm5lbCBzb3VyY2VzLgoK
U2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+Ci0tLQog
YXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1wbTg5NDEuZHRzaSB8IDEwICsrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvcWNvbS1wbTg5NDEuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tcG04OTQxLmR0c2kK
aW5kZXggZjE5ODQ4MGM4ZWY0Li5jMWYyMDEyZDFjOGIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3Fjb20tcG04OTQxLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1wbTg5
NDEuZHRzaQpAQCAtMTc4LDYgKzE3OCwxNiBAQAogCQkJCXFjb20sdnMtc29mdC1zdGFydC1zdHJl
bmd0aCA9IDwwPjsKIAkJCQlyZWd1bGF0b3ItaW5pdGlhbC1tb2RlID0gPDE+OwogCQkJfTsKKwor
CQkJcG04OTQxXzV2czI6IDV2czIgeworCQkJCXJlZ3VsYXRvci1lbmFibGUtcmFtcC1kZWxheSA9
IDwxMDAwPjsKKwkJCQlyZWd1bGF0b3ItcHVsbC1kb3duOworCQkJCXJlZ3VsYXRvci1vdmVyLWN1
cnJlbnQtcHJvdGVjdGlvbjsKKwkJCQlxY29tLG9jcC1tYXgtcmV0cmllcyA9IDwxMD47CisJCQkJ
cWNvbSxvY3AtcmV0cnktZGVsYXkgPSA8MzA+OworCQkJCXFjb20sdnMtc29mdC1zdGFydC1zdHJl
bmd0aCA9IDwwPjsKKwkJCQlyZWd1bGF0b3ItaW5pdGlhbC1tb2RlID0gPDE+OworCQkJfTsKIAkJ
fTsKIAl9OwogfTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZnJlZWRyZW5v
