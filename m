From: Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v3 0/3] arm64: dts: sdm845: Add sdm845 GPU
 interconnect
Date: Thu, 20 Dec 2018 10:30:23 -0700
Message-ID: <20181220173026.3857-1-jcrouse@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sharat Masetty <smasetty-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

QWRkIGludGVyY29ubmVjdCBjb25zdW1lciBkZWZpbml0aW9ucyBmb3IgdGhlIHNkbTg0NSBHUFUg
dG8gZGV2aWNlIHRyZWUuCgpUaGlzIHBhdGNoc2V0IGluY2x1ZGVzIHRoZSBhNnh4IGdwdSBzdXBw
b3J0IGZvciBpbnRlcmNvbm5lY3QgYXMgcHJldmlvdXNseQpzZWVuIGhlcmU6CgpodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwNzE4NTg3LwoKSXQgd2FzIHB1bGxlZCBpbnRvIHRo
aXMgcGF0Y2hzZXQgYmVjYXVzZSB0aGUgaW50ZXJjb25uZWN0LW5hbWUgd2FzIHJlbW92ZWQgZnJv
bQp0aGUgRFQgYXQgdGhlIHN1Z2dlc3Rpb24gb2YgUm9iIEhlcnJpbmcgYW5kIGl0IHdhcyBlYXNp
ZXIgdG8gY29tYmluZSBhbGwgb2YKdGhlc2UgdG9nZXRoZXIgaW50byBvbmUgc2V0LgoKRXZlcnl0
aGluZyBpcyBiYXNlZCBvbiB0aGUgYmFzZSBHUFUgRFQgY2hhbmdlczoKaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8zOTMwOC8KCkFzIHdlbGwgYXMgdGhlIERUIG5vZGVz
IGZyb20gR2VvcmdpOgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwNzE5NDgz
LwoKdjM6IFJlbW92ZSBoYXJkY29kZWQgaW50ZXJjb25uZWN0IG5hbWUgZnJvbSBkcml2ZXIgYW5k
IGJpbmRpbmdzCgpKb3JkYW4gQ3JvdXNlICgzKToKICBkcm0vbXNtL2E2eHg6IEFkZCBzdXBwb3J0
IGZvciBhbiBpbnRlcmNvbm5lY3QgcGF0aAogIGR0LWJpbmRpbmdzOiBkcm0vbXNtL2E2eHg6IERv
Y3VtZW50IGludGVyY29ubmVjdCBwcm9wZXJ0aWVzIGZvciBHUFUKICBhcm02NDogZHRzOiBzZG04
NDU6IEFkZCBpbnRlcmNvbm5lY3QgZm9yIEdQVQoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbXNtL2dwdS50eHQgICB8ICA0ICsrKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9z
ZG04NDUuZHRzaSAgICAgICAgICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4
X2dtdS5jICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0v
bXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMgICAgICAgfCAgOSArKysrKysrKysKIGRyaXZlcnMvZ3B1
L2RybS9tc20vbXNtX2dwdS5oICAgICAgICAgICAgICAgICB8ICAzICsrKwogNiBmaWxlcyBjaGFu
Z2VkLCAzOSBpbnNlcnRpb25zKCspCgotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVu
b0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9mcmVlZHJlbm8K
