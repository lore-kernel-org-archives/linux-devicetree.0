From: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Subject: [PATCH 08/11] drm/msm/hdmi: silence -EPROBE_DEFER
 warning
Date: Wed, 14 Aug 2019 20:48:51 -0400
Message-ID: <20190815004854.19860-9-masneyb@onstation.org>
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

U2lsZW5jZSBhIHdhcm5pbmcgbWVzc2FnZSBkdWUgdG8gYW4gLUVQUk9CRV9ERUZFUiBlcnJvciB0
byBoZWxwIGNsZWFudXAKdGhlIHN5c3RlbSBib290IGxvZy4KClNpZ25lZC1vZmYtYnk6IEJyaWFu
IE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20v
aGRtaS9oZG1pX3BoeS5jIHwgOCArKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2hk
bWkvaGRtaV9waHkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pX3BoeS5jCmluZGV4
IDE2OTdlNjFmOWMyZi4uOGEzOGQ0Yjk1MTAyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2hkbWkvaGRtaV9waHkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaV9w
aHkuYwpAQCAtMjksOCArMjksMTIgQEAgc3RhdGljIGludCBtc21faGRtaV9waHlfcmVzb3VyY2Vf
aW5pdChzdHJ1Y3QgaGRtaV9waHkgKnBoeSkKIAkJcmVnID0gZGV2bV9yZWd1bGF0b3JfZ2V0KGRl
diwgY2ZnLT5yZWdfbmFtZXNbaV0pOwogCQlpZiAoSVNfRVJSKHJlZykpIHsKIAkJCXJldCA9IFBU
Ul9FUlIocmVnKTsKLQkJCURSTV9ERVZfRVJST1IoZGV2LCAiZmFpbGVkIHRvIGdldCBwaHkgcmVn
dWxhdG9yOiAlcyAoJWQpXG4iLAotCQkJCWNmZy0+cmVnX25hbWVzW2ldLCByZXQpOworCQkJaWYg
KHJldCAhPSAtRVBST0JFX0RFRkVSKSB7CisJCQkJRFJNX0RFVl9FUlJPUihkZXYsCisJCQkJCSAg
ICAgICJmYWlsZWQgdG8gZ2V0IHBoeSByZWd1bGF0b3I6ICVzICglZClcbiIsCisJCQkJCSAgICAg
IGNmZy0+cmVnX25hbWVzW2ldLCByZXQpOworCQkJfQorCiAJCQlyZXR1cm4gcmV0OwogCQl9CiAK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
