From: Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v3 3/3] arm64: dts: sdm845: Add interconnect for
 GPU
Date: Thu, 20 Dec 2018 10:30:26 -0700
Message-ID: <20181220173026.3857-4-jcrouse@codeaurora.org>
References: <20181220173026.3857-1-jcrouse@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181220173026.3857-1-jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

RGVmaW5lIGFuIGludGVyY29ubmVjdCBwb3J0IGZvciB0aGUgR1BVIHRvIHNldCBidXMKY2FwYWJp
bGl0aWVzLgoKU2lnbmVkLW9mZi1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3Jh
Lm9yZz4KLS0tCgogYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NkbTg0NS5kdHNpIHwgMiArKwog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcWNvbS9zZG04NDUuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zZG04
NDUuZHRzaQppbmRleCAxMDA1ZjFlYjE5MjAuLjE1NWU0YmE3NGM5NiAxMDA2NDQKLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9xY29tL3NkbTg0NS5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvcWNvbS9zZG04NDUuZHRzaQpAQCAtMTM2OSw2ICsxMzY5LDggQEAKIAogCQkJb3BlcmF0aW5n
LXBvaW50cy12MiA9IDwmZ3B1X29wcF90YWJsZT47CiAKKwkJCWludGVyY29ubmVjdHMgPSA8JnJz
Y19obG9zIE1BU1RFUl9HRlgzRCAmcnNjX2hsb3MgU0xBVkVfRUJJMT47CisKIAkJCXFjb20sZ211
ID0gPCZnbXU+OwogCiAJCQlncHVfb3BwX3RhYmxlOiBvcHAtdGFibGUgewotLSAKMi4xOC4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8g
bWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K
