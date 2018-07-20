From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/21] dt-bindings: msm/dsi: Add mdp
 transfer time to msm dsi binding
Date: Fri, 20 Jul 2018 08:13:25 -0600
Message-ID: <20180720141325.GA25081@rob-hp-laptop>
References: <20180709173200.238457-1-seanpaul@chromium.org>
 <20180709173200.238457-2-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180709173200.238457-2-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, abhinavk-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, nganji-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, skolluku-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dovizu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, hoegsberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, chandanu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBKdWwgMDksIDIwMTggYXQgMDE6MzE6MzdQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IEpleWt1bWFyIFNhbmthcmFuIDxqc2Fua2FAY29kZWF1cm9yYS5vcmc+Cj4gCj4g
QWRkcyBtZHAgdHJhbnNmZXIgdGltZSB0byBtc20gZHNpIGJpbmRpbmcKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKZXlrdW1hciBTYW5rYXJhbiA8anNhbmthQGNvZGVhdXJvcmEub3JnPgo+IFNpZ25lZC1v
ZmYtYnk6IFJhamVzaCBZYWRhdiA8cnlhZGF2QGNvZGVhdXJvcmEub3JnPgo+IFNpZ25lZC1vZmYt
Ynk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kc2kudHh0ICAgICAgfCAxNiArKysrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpSZXZpZXdlZC1ieTogUm9i
IEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZnJlZWRyZW5vCg==
