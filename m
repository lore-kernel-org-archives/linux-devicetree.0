From: Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] of/device: add blacklist for iommu dma_ops
Date: Mon, 3 Jun 2019 08:48:51 -0600
Message-ID: <20190603144851.GD23227@jcrouse1-lnx.qualcomm.com>
References: <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
 <CAF6AEGtj+kyXqKeJK2-0e1jw_A4wz-yBEyv5zhf5Vfoi2_p2CA@mail.gmail.com>
 <401f9948-14bd-27a2-34c1-fb429cae966d@arm.com>
 <CAF6AEGuGGAThqs9ztTNyGnMyhFc9wbtn=N8A4qqQxcN_PAxsEw@mail.gmail.com>
 <20190603135408.GE30132@ulmo>
 <CAF6AEGtrfqYBNyjpHsUy1Tj-FJZ0MybvAJdHQsqb5kqih2BY3A@mail.gmail.com>
 <20190603144016.GG30132@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190603144016.GG30132@ulmo>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux IOMMU <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, freedreno <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

PiBJdCBzaG91bGRuJ3QgYmUgYSBwcm9ibGVtIHRvIGhvb2sgc29tZXRoaW5nIGVsc2UgdXAgdG8g
dGhlIElPTU1VCj4gc3Vic3lzdGVtLiBIb3BlZnVsbHkgaXQncyBzb21ldGhpbmcgdGhhdCBwZW9w
bGUgYXJlIGdvaW5nIHRvIHN0YW5kYXJkaXplCj4gb24uCj4gCj4gPiAzKSBUaGUgYXV0b21hdGlj
IGF0dGFjaCBvZiBETUEgZG9tYWluIGlzIGFsc28gY2F1c2luZyBhIGRpZmZlcmVudAo+ID4gICAg
cHJvYmxlbSBmb3IgdXMgb24gdGhlIEdQVSBzaWRlLCBwcmV2ZW50aW5nIHVzIGZyb20gc3VwcG9y
dGluZyBwZXItCj4gPiAgICBjb250ZXh0IHBhZ2V0YWJsZXMgKHNpbmNlIHdlIGVuZCB1cCB3aXRo
IGEgZGlzYWdyZWVtZW50IGFib3V0Cj4gPiAgICB3aGljaCBjb250ZXh0IGJhbmsgaXMgdXNlZCBi
ZXR3ZWVuIGFybS1zbW11IGFuZCB0aGUgZmlybXdhcmUpLgo+IAo+IEknbSBub3Qgc3VyZSBJIHVu
ZGVyc3RhbmQgdGhpcyBpc3N1ZS4gSXMgdGhlIGNvbnRleHQgYmFuayBoYXJkLWNvZGVkIGluCj4g
dGhlIGZpcm13YXJlIHNvbWVob3c/IE9yIGlzIGl0IHBvc3NpYmxlIHRvIHJld3JpdGUgd2hpY2gg
b25lIGlzIGdvaW5nIHRvCj4gYmUgdXNlZCBhdCBydW50aW1lPyBEbyB5b3Ugc3dpdGNoIG91dCB0
aGUgYWN0dWFsIHBhZ2UgdGFibGVzIHJhdGhlciB0aGFuCj4gdGhlIElPTU1VIGRvbWFpbnMgZm9y
IGNvbnRleHQgc3dpdGNoaW5nPwogCldlIGhhdmUgYSByYXRoZXIgbG9uZyBoaXN0b3J5IG9uIHRo
aXMgYnV0IHRoZSB0bDtkciBpcyB0aGF0IHRoZSBHUFUgbWljcm9jb2RlCnN3aXRjaGVzIHRoZSBw
YWdldGFibGVzIGJ5IHJld3JpdGluZyBUVEJSMCBvbiB0aGUgZmx5IChzaW5jZSB0aGlzIGlzCmFy
bS1zbW11LXYyIHdlIGhhdmUgbm8gYmV0dGVyIG9wdGlvbikgYW5kIHllcywgdW5mb3J0dW5hdGVs
eSBpdCBpcyBoYXJkIGNvZGVkCnRvIHVzZSBjb250ZXh0IGJhbmsgMC4gWzFdIGlzIHRoZSBjdXJy
ZW50IHBhdGNoc2V0IHRvIHN1cHBvcnQgYWxsIHRoaXMsCmluY2x1ZGluZyBteSBvd24gdGFrZSBv
biBhdm9pZGluZyB0aGUgZG1hLWRvbWFpbiAoYWxsIHRoZSBjb29sIGtpZHMgaGF2ZSBvbmUpLgoK
Sm9yZGFuCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81NzQ0
MS8KCi0tIApUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIg
b2YgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFBy
b2plY3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJl
ZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
