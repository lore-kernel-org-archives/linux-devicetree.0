From: Doug Anderson <dianders@chromium.org>
Subject: Re: [[DPU]PATCH] drm/msm/dsi: move the API setting PLL src to
 modeset_init()
Date: Tue, 26 Jun 2018 08:55:22 -0700
Message-ID: <CAD=FV=UY5+ENfTmJeWvjMRxfeueBx435H+rbgYrzkWK5rc_-0Q@mail.gmail.com>
References: <20180626044543.14992-1-spanda@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180626044543.14992-1-spanda@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sandeep Panda <spanda@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Stephen Boyd <swboyd@chromium.org>
Cc: devicetree@vger.kernel.org, ryadav@codeaurora.org, linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel <dri-devel@lists.freedesktop.org>, "Kristian H. Kristensen" <hoegsberg@chromium.org>, freedreno@lists.freedesktop.org, chandanu@codeaurora.org
List-Id: devicetree@vger.kernel.org

SGksCgpPbiBNb24sIEp1biAyNSwgMjAxOCBhdCA5OjQ1IFBNLCBTYW5kZWVwIFBhbmRhIDxzcGFu
ZGFAY29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+IEZyb206IEFiaGluYXYgS3VtYXIgPGFiaGluYXZr
QGNvZGVhdXJvcmEub3JnPgo+Cj4gU2V0dGluZyB0aGUgRFNJIFBMTCBzcmMgaW4gcHJvYmUgZG9l
c24ndCBwcm92aWRlIHRoZSBjbG9jawo+IGRyaXZlciBzdWZmaWNpZW50IHRpbWUgdG8gcmVjbGFp
bSB1bnVzZWQgY2xvY2sgcmVzb3VyY2VzCj4gZnJvbSBjb3JlYm9vdCByZXN1bHRpbmcgaW4gd2Fy
bmluZ3MgZnJvbSBjbG9jayBkcml2ZXIuCj4KPiBNb3ZlIHRoZSBEU0kgUExMIHNyYyBzZXR0aW5n
IHRvIG1vZGVzZXRfaW5pdCgpIHNvIHRoYXQgdGhlCj4gY2xvY2sgZHJpdmVyIGNhbiBjbGFpbSB1
bnVzZWQgZGlzcGxheSBjbG9jayByZXNvdXJjZXMgYmVmb3JlCj4gdGhlIGRpc3BsYXkgZHJpdmVy
IHJlcXVlc3RzIGZvciB0aGVtIGFnYWluLgoKSU1ITyB0aGlzIGlzIGEgYmFkIGRlc2lnbi4gIFNl
YW4gYW5kIFN0ZXBoZW4gY2FuIGZlZWwgZnJlZSB0byBvdmVycmlkZQptZSwgYnV0IEkgdGhpbmsg
dGhlIGNsb2NrIGRyaXZlciBzaG91bGQgYmUgaW1wcm92ZWQgdG8gaGFuZGxlIHRoaXMKY2FzZSBh
bmQgbm90IHJlcXVpcmUgdGhlIGNsb2NrIHRvIGdldCBkaXNhYmxlZCBiZWZvcmUgTGludXggZW5h
YmxlcwppdC4KCi1Eb3VnCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
