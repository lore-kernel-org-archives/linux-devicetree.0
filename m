From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC 06/11] drm/bridge: analogix-anx78xx: add
 support for avdd33 regulator
Date: Thu, 15 Aug 2019 10:22:45 +0200
Message-ID: <CACRpkdYdQa+FVfpSjLi0SsBMDT4QC667z1P1dnapz7PXgRoB5Q@mail.gmail.com>
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-7-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190815004854.19860-7-masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, MSM <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, freedreno <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM9gwCICpdfJQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMjo0OSBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IEFkZCBzdXBwb3J0IGZvciB0aGUgYXZkZDMzIHJlZ3VsYXRv
ciB0byB0aGUgYW5hbG9naXgtYW54Nzh4eCBkcml2ZXIuCj4gTm90ZSB0aGF0IHRoZSByZWd1bGF0
b3IgaXMgY3VycmVudGx5IGVuYWJsZWQgZHVyaW5nIGRyaXZlciBwcm9iZSBhbmQKPiBkaXNhYmxl
ZCB3aGVuIHRoZSBkcml2ZXIgaXMgcmVtb3ZlZC4gVGhpcyBpcyBjdXJyZW50bHkgaG93IHRoZQo+
IGRvd25zdHJlYW0gTVNNIGtlcm5lbCBzb3VyY2VzIGRvIHRoaXMuCj4KPiBMZXQncyBub3QgbWVy
Z2UgdGhpcyB1cHN0cmVhbSBmb3IgdGhlIG1lYW4gdGltZSB1bnRpbCBJIGdldCB0aGUgZXh0ZXJu
YWwKPiBkaXNwbGF5IGZ1bGx5IHdvcmtpbmcgb24gdGhlIE5leHVzIDUgYW5kIHRoZW4gSSBjYW4g
c3VibWl0IHByb3Blcgo+IHN1cHBvcnQgdGhlbiB0aGF0IHBvd2VycyBkb3duIHRoaXMgcmVndWxh
dG9yIGluIHRoZSBwb3dlciBvZmYgZnVuY3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBN
YXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KCj4gK3N0YXRpYyB2b2lkIGFueDc4eHhfZGlz
YWJsZV9yZWd1bGF0b3JfYWN0aW9uKHZvaWQgKl9kYXRhKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qg
YW54Nzh4eF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9IF9kYXRhOwo+ICsKPiArICAgICAgIHJlZ3Vs
YXRvcl9kaXNhYmxlKHBkYXRhLT5hdmRkMzMpOwo+ICt9CiguLi4pCj4gKyAgICAgICBlcnIgPSBk
ZXZtX2FkZF9hY3Rpb24oZGV2LCBhbng3OHh4X2Rpc2FibGVfcmVndWxhdG9yX2FjdGlvbiwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZGF0YSk7CgpDbGV2ZXIgaWRlYS4gR29vZCBm
b3IgaW5pdGlhbCBzdXBwb3J0LCBwcm9iYWJseSBsYXRlciBvbiBpdCB3b3VsZApuZWVkIHRvIGJl
IHJld29ya2VkIHVzaW5nIHJ1bnRpbWUgUE0gc28gaXQncyBub3QgY29uc3RhbnRseQpwb3dlcmVk
IHVwLgoKU2VlIGZvciBleGFtcGxlIGhvdyBJIHRyeSB0byBwdXNoIGRvd24gcG93ZXIgZGlzc2lw
YXRpb24Kb2Ygc2Vuc29ycyBpbiAzZDgzODExOGM2YWEuCgpSZXZpZXdlZC1ieTogTGludXMgV2Fs
bGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1h
aWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
