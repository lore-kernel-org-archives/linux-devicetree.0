From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 6/8] arm64: dts: qcom: msm8916: Set
 'xo_board' as ref clock of the DSI PHY
Date: Wed, 19 Dec 2018 15:55:26 -0800
Message-ID: <20181219235528.114830-7-mka@chromium.org>
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
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rajesh Yadav <ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeykumar Sankaran <jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

QWRkICd4b19ib2FyZCcgYXMgcmVmIGNsb2NrIGZvciB0aGUgRFNJIFBIWXMsIGl0IHdhcyBwcmV2
aW91c2x5CmhhcmRjb2RlZCBpbiB0aGUgUExMICdkcml2ZXInIGZvciB0aGUgMjhubSBQSFkuCgpT
aWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KUmV2aWV3
ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KUmV2aWV3ZWQt
Ynk6IFN0ZXBoZW4gQm95ZCA8c3dib3lkQGNocm9taXVtLm9yZz4KLS0tCkNoYW5nZXMgaW4gdjU6
Ci0gbm9uZQoKQ2hhbmdlcyBpbiB2NDoKLSBhZGRlZCAnUmV2aWV3ZWQtYnk6IFN0ZXBoZW4gQm95
ZCA8c3dib3lkQGNocm9taXVtLm9yZz4nIHRhZwoKQ2hhbmdlcyBpbiB2MzoKLSBhZGRlZCAnUmV2
aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4nIHRhZwoK
Q2hhbmdlcyBpbiB2MjoKLSBwYXRjaCBhZGRlZCB0byB0aGUgc2VyaWVzCi0tLQogYXJjaC9hcm02
NC9ib290L2R0cy9xY29tL21zbTg5MTYuZHRzaSB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9xY29tL21zbTg5MTYuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9tc204
OTE2LmR0c2kKaW5kZXggZDMwMmQ4ZDYzOWExMi4uODlmMzBmMzRmZjg5NiAxMDA2NDQKLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9xY29tL21zbTg5MTYuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL3Fjb20vbXNtODkxNi5kdHNpCkBAIC05NTksOCArOTU5LDkgQEAKIAkJCQkjY2xvY2st
Y2VsbHMgPSA8MT47CiAJCQkJI3BoeS1jZWxscyA9IDwwPjsKIAotCQkJCWNsb2NrcyA9IDwmZ2Nj
IEdDQ19NRFNTX0FIQl9DTEs+OwotCQkJCWNsb2NrLW5hbWVzID0gImlmYWNlIjsKKwkJCQljbG9j
a3MgPSA8JmdjYyBHQ0NfTURTU19BSEJfQ0xLPiwKKwkJCQkJIDwmeG9fYm9hcmQ+OworCQkJCWNs
b2NrLW5hbWVzID0gImlmYWNlIiwgInJlZiI7CiAJCQl9OwogCQl9OwogCi0tIAoyLjIwLjEuNDE1
Lmc2NTM2MTNjNzIzLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Zy
ZWVkcmVubwo=
