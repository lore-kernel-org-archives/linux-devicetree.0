From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 3/7] drm/msm/dsi: 28nm 8960 PHY: Get ref
 clock from the DT
Date: Tue, 27 Nov 2018 22:00:50 -0800
Message-ID: <CAD=FV=X5r1CCSeTDXy_cYOBDf4ExNe276pFQSC6T+WWg2=SchA@mail.gmail.com>
References: <20181126231159.122298-1-mka@chromium.org>
 <20181126231159.122298-4-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181126231159.122298-4-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rajesh Yadav <ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jeykumar Sankaran <jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, freedreno <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGksCgpPbiBNb24sIE5vdiAyNiwgMjAxOCBhdCAzOjEyIFBNIE1hdHRoaWFzIEthZWhsY2tlIDxt
a2FAY2hyb21pdW0ub3JnPiB3cm90ZToKPiBAQCAtNDA5LDggKzQxMCw5IEBAIHN0YXRpYyB2b2lk
IGRzaV9wbGxfMjhubV9kZXN0cm95KHN0cnVjdCBtc21fZHNpX3BsbCAqcGxsKQo+ICBzdGF0aWMg
aW50IHBsbF8yOG5tX3JlZ2lzdGVyKHN0cnVjdCBkc2lfcGxsXzI4bm0gKnBsbF8yOG5tKQo+ICB7
Cj4gICAgICAgICBjaGFyICpjbGtfbmFtZSwgKnBhcmVudF9uYW1lLCAqdmNvX25hbWU7Cj4gKyAg
ICAgICBjb25zdCBjaGFyICpyZWZfY2xrX25hbWUgPSBfX2Nsa19nZXRfbmFtZShwbGxfMjhubS0+
dmNvX3JlZl9jbGspOwoKSU1PIGZvciB0aGUgMjhubSBQSFkgZHJpdmVyIHlvdSBzaG91bGQgcHJv
YmFibHkgbWFrZSB0aGluZ3Mgd29yayBPSwpldmVuIGlmIHRoZSAicmVmIiBjbG9jayB3YXNuJ3Qg
c3VwcGxpZWQuICBJbiB0aGUgc3Bpcml0IG9mIHRoZSBzdGFibGUKZGV2aWNlIHRyZWUgaXQgd291
bGQgYmUgbmljZSAoZXZlbiBpZiBub2JvZHkgYWN0dWFsbHkgc2hpcHMgZGV2aWNlCnRyZWVzIHNl
cGFyYXRlIGZyb20ga2VybmVscykuICAuLi5hbmQgYWxzbyBpdCBtYWtlcyB0aGUgd2hvbGUgdGhp
bmcKZWFzaWVyIHRvIGxhbmQuICBJZiB5b3UgYWRkIGNvbXBhdGliaWxpdHkgaGVyZSB0aGVuIHRo
ZSBjb2RlIGFuZApkZXZpY2UgdHJlZSBwYXRjaCBjYW4gZ28gaW4gc2VwYXJhdGVseS4KCkRlcGVu
ZGluZyBvbiB3aGF0IG90aGVycyB0aGluayB5b3UgY291bGQgcG90ZW50aWFsbHkgc3BpdCBzb21l
IHR5cGUgb2YKd2FybmluZyBpbiB0aGUgbG9ncyBpZiB0aGUgcmVmIGNsb2NrIHdhc24ndCBzcGVj
aWZpZWQgdGhvdWdoLgoKLURvdWcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZnJlZWRyZW5vCg==
