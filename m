From: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 8/8] ARM: dts: qcom-apq8064: Set 'xo_board'
 as ref clock of the DSI PHY
Date: Wed, 19 Dec 2018 15:55:28 -0800
Message-ID: <20181219235528.114830-9-mka@chromium.org>
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

QWRkICd4b19ib2FyZCcgYXMgcmVmIGNsb2NrIGZvciB0aGUgRFNJIFBIWSwgaXQgd2FzIHByZXZp
b3VzbHkKaGFyZGNvZGVkIGluIHRoZSBQTEwgJ2RyaXZlcicgZm9yIHRoZSAyOG5tIDg5NjAgUEhZ
LgoKU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+ClJl
dmlld2VkLWJ5OiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+Ci0tLQpDaGFuZ2Vz
IGluIHY1OgotIG5vbmUKCkNoYW5nZXMgaW4gdjQ6Ci0gYWRkZWQgJ1Jldmlld2VkLWJ5OiBTdGVw
aGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+JyB0YWcKCkNoYW5nZXMgaW4gdjM6Ci0gcGF0
Y2ggYWRkZWQgdG8gdGhlIHNlcmllcwotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tYXBxODA2
NC5kdHNpIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9xY29tLWFwcTgwNjQuZHRz
aSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tYXBxODA2NC5kdHNpCmluZGV4IDQ4YzNjZjQyNzYx
MDEuLmQzMzdhZTkzMjZjZDggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tYXBx
ODA2NC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tYXBxODA2NC5kdHNpCkBAIC0x
MzM4LDggKzEzMzgsOSBAQAogCQkJCTwweDA0NzAwMzAwIDB4MjAwPiwKIAkJCQk8MHgwNDcwMDUw
MCAweDVjPjsKIAkJCXJlZy1uYW1lcyA9ICJkc2lfcGxsIiwgImRzaV9waHkiLCAiZHNpX3BoeV9y
ZWd1bGF0b3IiOwotCQkJY2xvY2stbmFtZXMgPSAiaWZhY2VfY2xrIjsKLQkJCWNsb2NrcyA9IDwm
bW1jYyBEU0lfTV9BSEJfQ0xLPjsKKwkJCWNsb2NrLW5hbWVzID0gImlmYWNlX2NsayIsICJyZWYi
OworCQkJY2xvY2tzID0gPCZtbWNjIERTSV9NX0FIQl9DTEs+LAorCQkJCSA8JnhvX2JvYXJkPjsK
IAkJfTsKIAogCi0tIAoyLjIwLjEuNDE1Lmc2NTM2MTNjNzIzLWdvb2cKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QK
RnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
