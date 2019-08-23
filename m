From: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Subject: [PATCH v7 7/7] ARM: qcom_defconfig: add ocmem support
Date: Fri, 23 Aug 2019 05:16:37 -0700
Message-ID: <20190823121637.5861-8-masneyb@onstation.org>
References: <20190823121637.5861-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190823121637.5861-1-masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathan-eSc4qw6YbEQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

QWRkIG9jbWVtIGRyaXZlciB0aGF0J3MgbmVlZGVkIGZvciBzb21lIGEzeHggYW5kIGE0eHggYmFz
ZWQgc3lzdGVtcy4KClNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRp
b24ub3JnPgotLS0KQ2hhbmdlcyBzaW5jZSB2NjoKLSBOb25lCgpDaGFuZ2VzIHNpbmNlIHY1Ogot
IE5vbmUKClRoaXMgcGF0Y2ggd2FzIGludHJvZHVjZWQgaW4gdjUuCgogYXJjaC9hcm0vY29uZmln
cy9xY29tX2RlZmNvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9xY29tX2RlZmNvbmZpZyBiL2FyY2gvYXJtL2Nv
bmZpZ3MvcWNvbV9kZWZjb25maWcKaW5kZXggMzQ0MzNiZjU4ODVkLi41OTVlMTkxMGJhNzggMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZjb25maWcKKysrIGIvYXJjaC9hcm0v
Y29uZmlncy9xY29tX2RlZmNvbmZpZwpAQCAtMjI1LDYgKzIyNSw3IEBAIENPTkZJR19RQ09NX1dD
TlNTX1BJTD15CiBDT05GSUdfUlBNU0dfQ0hBUj15CiBDT05GSUdfUlBNU0dfUUNPTV9TTUQ9eQog
Q09ORklHX1FDT01fR1NCST15CitDT05GSUdfUUNPTV9PQ01FTT15CiBDT05GSUdfUUNPTV9QTT15
CiBDT05GSUdfUUNPTV9TTUVNPXkKIENPTkZJR19RQ09NX1NNRF9SUE09eQotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8g
bWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=
