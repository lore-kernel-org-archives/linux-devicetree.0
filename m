From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 6/8] arm64: dts: qcom: msm8916: Set
 'xo_board' as ref clock of the DSI PHY
Date: Tue,  4 Dec 2018 14:42:32 -0800
Message-ID: <20181204224234.62619-7-mka@chromium.org>
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

QWRkICd4b19ib2FyZCcgYXMgcmVmIGNsb2NrIGZvciB0aGUgRFNJIFBIWXMsIGl0IHdhcyBwcmV2
aW91c2x5CmhhcmRjb2RlZCBpbiB0aGUgUExMICdkcml2ZXInIGZvciB0aGUgMjhubSBQSFkuCgpT
aWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KUmV2aWV3
ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KUmV2aWV3ZWQt
Ynk6IFN0ZXBoZW4gQm95ZCA8c3dib3lkQGNocm9taXVtLm9yZz4KLS0tCkNoYW5nZXMgaW4gdjQ6
Ci0gYWRkZWQgJ1Jldmlld2VkLWJ5OiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+
JyB0YWcKCkNoYW5nZXMgaW4gdjM6Ci0gYWRkZWQgJ1Jldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVy
c29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+JyB0YWcKCkNoYW5nZXMgaW4gdjI6Ci0gcGF0Y2gg
YWRkZWQgdG8gdGhlIHNlcmllcwotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9tc204OTE2
LmR0c2kgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9tc204OTE2LmR0
c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vbXNtODkxNi5kdHNpCmluZGV4IGQzMDJkOGQ2
MzlhMTIuLjg5ZjMwZjM0ZmY4OTYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNv
bS9tc204OTE2LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL21zbTg5MTYuZHRz
aQpAQCAtOTU5LDggKzk1OSw5IEBACiAJCQkJI2Nsb2NrLWNlbGxzID0gPDE+OwogCQkJCSNwaHkt
Y2VsbHMgPSA8MD47CiAKLQkJCQljbG9ja3MgPSA8JmdjYyBHQ0NfTURTU19BSEJfQ0xLPjsKLQkJ
CQljbG9jay1uYW1lcyA9ICJpZmFjZSI7CisJCQkJY2xvY2tzID0gPCZnY2MgR0NDX01EU1NfQUhC
X0NMSz4sCisJCQkJCSA8JnhvX2JvYXJkPjsKKwkJCQljbG9jay1uYW1lcyA9ICJpZmFjZSIsICJy
ZWYiOwogCQkJfTsKIAkJfTsKIAotLSAKMi4yMC4wLnJjMS4zODcuZ2Y4NTA1NzYyZTMtZ29vZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5v
IG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==
