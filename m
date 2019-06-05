From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Freedreno] [PATCH] of/device: add blacklist for iommu dma_ops
Date: Wed, 5 Jun 2019 15:18:10 +0200
Message-ID: <95d6e963-7f30-1d9c-99d7-0f6cc1589997@samsung.com>
References: <20181201165348.24140-1-robdclark@gmail.com>
 <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
 <CAF6AEGtj+kyXqKeJK2-0e1jw_A4wz-yBEyv5zhf5Vfoi2_p2CA@mail.gmail.com>
 <CAAFQd5Dmr+xyd4dyc_44vJFpNpwK6+MgG+ensoey59HgbxXV6g@mail.gmail.com>
 <CGME20190605125734epcas1p43b15cc8c556d917ca71b561791861cec@epcas1p4.samsung.com>
 <CAF6AEGuj=QmEWZVzHMtoDgO0M0t-W9+tay5F4AKYThZqy=nkdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAF6AEGuj=QmEWZVzHMtoDgO0M0t-W9+tay5F4AKYThZqy=nkdA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>, Tomasz Figa <tfiga@chromium.org>
Cc: freedreno <freedreno@lists.freedesktop.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux IOMMU <iommu@lists.linux-foundation.org>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

SGkgUm9iLAoKT24gMjAxOS0wNi0wNSAxNDo1NywgUm9iIENsYXJrIHdyb3RlOgo+IE9uIFR1ZSwg
SnVuIDQsIDIwMTkgYXQgMTE6NTggUE0gVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4g
d3JvdGU6Cj4+IEJ1dCBmaXJzdCBvZiBhbGwsIEkgcmVtZW1iZXIgTWFyZWsgYWxyZWFkeSBzdWJt
aXR0ZWQgc29tZSBwYXRjaGVzIGxvbmcKPj4gYWdvIHRoYXQgZXh0ZW5kZWQgc3RydWN0IGRyaXZl
ciB3aXRoIHNvbWUgZmxhZyB0aGF0IG1lYW5zIHRoYXQgdGhlCj4+IGRyaXZlciBkb2Vzbid0IHdh
bnQgdGhlIElPTU1VIHRvIGJlIGF0dGFjaGVkIGJlZm9yZSBwcm9iZS4gV2h5Cj4+IHdvdWxkbid0
IHRoYXQgd29yaz8gU291bmRzIGxpa2UgYSBwZXJmZWN0IG9wdC1vdXQgc29sdXRpb24uCj4gQWN0
dWFsbHksIHllYWguLiB3ZSBzaG91bGQgZG8gdGhhdC4gIFRoYXQgaXMgdGhlIHNpbXBsZXN0IHNv
bHV0aW9uLgoKVG9tYXN6IGhhcyB2ZXJ5IGdvb2QgbWVtb3J5LiBJdCB0b29rIG1lIGEgd2hpbGUg
dG8gZmluZCB0aGF0IG9sZCBwYXRjaGVzOgoKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
YXRjaC80Njc3MjUxLwpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzQ2Nzc5NDEv
Cmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvNDY3NzQwMS8KCkl0IGxvb2tzIHRo
YXQgbXkgaWRlYSB3YXMgYSBiaXQgYWhlYWQgb2YgaXRzIHRpbWUgOykKCkJlc3QgcmVnYXJkcwot
LSAKTWFyZWsgU3p5cHJvd3NraSwgUGhEClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
