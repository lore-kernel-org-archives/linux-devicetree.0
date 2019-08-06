From: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Subject: [PATCH v5 7/7] ARM: qcom_defconfig: add ocmem support
Date: Mon,  5 Aug 2019 20:22:29 -0400
Message-ID: <20190806002229.8304-8-masneyb@onstation.org>
References: <20190806002229.8304-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190806002229.8304-1-masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
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
b24ub3JnPgotLS0KVGhpcyBpcyBhIG5ldyBwYXRjaCB0aGF0IHdhcyBpbnRyb2R1Y2VkIGluIHY1
LgoKIGFyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZj
b25maWcgYi9hcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29uZmlnCmluZGV4IDM0NDMzYmY1ODg1
ZC4uNTk1ZTE5MTBiYTc4IDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29u
ZmlnCisrKyBiL2FyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZjb25maWcKQEAgLTIyNSw2ICsyMjUs
NyBAQCBDT05GSUdfUUNPTV9XQ05TU19QSUw9eQogQ09ORklHX1JQTVNHX0NIQVI9eQogQ09ORklH
X1JQTVNHX1FDT01fU01EPXkKIENPTkZJR19RQ09NX0dTQkk9eQorQ09ORklHX1FDT01fT0NNRU09
eQogQ09ORklHX1FDT01fUE09eQogQ09ORklHX1FDT01fU01FTT15CiBDT05GSUdfUUNPTV9TTURf
UlBNPXkKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJl
ZWRyZW5v
