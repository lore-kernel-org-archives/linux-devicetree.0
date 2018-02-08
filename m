From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 2/6] dt-bindings: Add headings to simple-panel bindings
Date: Thu,  8 Feb 2018 12:48:49 -0500
Message-ID: <20180208174855.55620-3-seanpaul@chromium.org>
References: <20180208174855.55620-1-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180208174855.55620-1-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SW4gcHJlcGFyYXRpb24gZm9yIGEgbmV3IHN1Ym5vZGUgc2VjdGlvbiBpbiBhIGZvbGxvdy1vbiBw
YXRjaCwgYWRkCmV4cGxpY2l0IGhlYWRpbmdzIHRvIHRoZSBleGlzdGluZ3Mgc2VjdGlvbnMgZm9y
IHNpbXBsZS1wYW5lbC4KCkNoYW5nZXMgaW4gdjI6CiAtIEFkZGVkCkNoYW5nZXMgaW4gdjM6CiAt
IE5vbmUKCkNjOiBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+CkNjOiBFcmlj
IEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpDYzogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVj
aC5kZT4KQ2M6IEplZmZ5IENoZW4gPGplZmZ5LmNoZW5Acm9jay1jaGlwcy5jb20+CkNjOiBSb2Ig
SGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgpDYzogU3TDqXBoYW5lIE1hcmNoZXNpbiA8bWFy
Y2hldUBjaHJvbWl1bS5vcmc+CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21h
aWwuY29tPgpDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcK
U2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Ci0tLQogRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2ltcGxlLXBhbmVs
LnR4dCB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NpbXBs
ZS1wYW5lbC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9zaW1wbGUtcGFuZWwudHh0CmluZGV4IDE2ZDhmZjA4OGI3ZC4uNDVhNDU3YWQzOGYwIDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9zaW1wbGUtcGFuZWwudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL3NpbXBsZS1wYW5lbC50eHQKQEAgLTEsNCArMSw4IEBACiBTaW1wbGUg
ZGlzcGxheSBwYW5lbAorPT09PT09PT09PT09PT09PT09PT0KKworcGFuZWwgbm9kZQorLS0tLS0t
LS0tLQogCiBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogLSBwb3dlci1zdXBwbHk6IFNlZSBwYW5lbC1j
b21tb24udHh0Ci0tIAoyLjE2LjAucmMxLjIzOC5nNTMwZDY0OWE3OS1nb29nCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtcm9ja2NoaXAgbWFp
bGluZyBsaXN0CkxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yb2NrY2hpcAo=
