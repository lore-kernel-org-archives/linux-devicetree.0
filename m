From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/device: add blacklist for iommu dma_ops
Date: Wed, 5 Jun 2019 07:16:51 -0700
Message-ID: <CAF6AEGtb1t4oRXCVvZq_cq1vZCJhgok-Ha+FXrruOOCq4APY_Q@mail.gmail.com>
References: <20181201165348.24140-1-robdclark@gmail.com>
 <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
 <CAF6AEGtj+kyXqKeJK2-0e1jw_A4wz-yBEyv5zhf5Vfoi2_p2CA@mail.gmail.com>
 <CAAFQd5Dmr+xyd4dyc_44vJFpNpwK6+MgG+ensoey59HgbxXV6g@mail.gmail.com>
 <CGME20190605125734epcas1p43b15cc8c556d917ca71b561791861cec@epcas1p4.samsung.com>
 <CAF6AEGuj=QmEWZVzHMtoDgO0M0t-W9+tay5F4AKYThZqy=nkdA@mail.gmail.com>
 <95d6e963-7f30-1d9c-99d7-0f6cc1589997@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <95d6e963-7f30-1d9c-99d7-0f6cc1589997-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, freedreno <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Linux IOMMU <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBKdW4gNSwgMjAxOSBhdCA2OjE4IEFNIE1hcmVrIFN6eXByb3dza2kKPG0uc3p5cHJv
d3NraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPiBIaSBSb2IsCj4KPiBPbiAyMDE5LTA2LTA1IDE0
OjU3LCBSb2IgQ2xhcmsgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biA0LCAyMDE5IGF0IDExOjU4IFBN
IFRvbWFzeiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4+IEJ1dCBmaXJzdCBv
ZiBhbGwsIEkgcmVtZW1iZXIgTWFyZWsgYWxyZWFkeSBzdWJtaXR0ZWQgc29tZSBwYXRjaGVzIGxv
bmcKPiA+PiBhZ28gdGhhdCBleHRlbmRlZCBzdHJ1Y3QgZHJpdmVyIHdpdGggc29tZSBmbGFnIHRo
YXQgbWVhbnMgdGhhdCB0aGUKPiA+PiBkcml2ZXIgZG9lc24ndCB3YW50IHRoZSBJT01NVSB0byBi
ZSBhdHRhY2hlZCBiZWZvcmUgcHJvYmUuIFdoeQo+ID4+IHdvdWxkbid0IHRoYXQgd29yaz8gU291
bmRzIGxpa2UgYSBwZXJmZWN0IG9wdC1vdXQgc29sdXRpb24uCj4gPiBBY3R1YWxseSwgeWVhaC4u
IHdlIHNob3VsZCBkbyB0aGF0LiAgVGhhdCBpcyB0aGUgc2ltcGxlc3Qgc29sdXRpb24uCj4KPiBU
b21hc3ogaGFzIHZlcnkgZ29vZCBtZW1vcnkuIEl0IHRvb2sgbWUgYSB3aGlsZSB0byBmaW5kIHRo
YXQgb2xkIHBhdGNoZXM6Cj4KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzQ2
NzcyNTEvCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC80Njc3OTQxLwo+IGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvNDY3NzQwMS8KPgo+IEl0IGxvb2tzIHRo
YXQgbXkgaWRlYSB3YXMgYSBiaXQgYWhlYWQgb2YgaXRzIHRpbWUgOykKPgoKaWYgSSByZS1zcGlu
IHRoaXMsIHdhcyB0aGVpciBhIHJlYXNvbiBub3QgdG8ganVzdCB1c2UgYml0ZmllbGRzLCBpZToK
Ci0gICAgYm9vbCBzdXBwcmVzc19iaW5kX2F0dHJzOyAgICAvKiBkaXNhYmxlcyBiaW5kL3VuYmlu
ZCB2aWEgc3lzZnMgKi8KKyAgICBib29sIHN1cHByZXNzX2JpbmRfYXR0cnMgOiAxOyAgICAvKiBk
aXNhYmxlcyBiaW5kL3VuYmluZCB2aWEgc3lzZnMgKi8KKyAgICBib29sIGhhc19vd25faW9tbXVf
bWFuYWdlciA6IDE7ICAvKiBkcml2ZXIgZXhwbGljdGx5IG1hbmFnZXMgSU9NTVUgKi8KClRoYXQg
c2VlbXMgbGlrZSBpdCB3b3VsZCBoYXZlIGJlZW4gYSBiaXQgbGVzcyBjaHVybiBhbmQgYSBiaXQg
bmljZXIKbG9va2luZyAoSU1PIGF0IGxlYXN0KQoKQlIsCi1SCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
