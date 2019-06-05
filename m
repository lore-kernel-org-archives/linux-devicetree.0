From: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH] of/device: add blacklist for iommu dma_ops
Date: Wed, 5 Jun 2019 05:57:16 -0700
Message-ID: <CAF6AEGuj=QmEWZVzHMtoDgO0M0t-W9+tay5F4AKYThZqy=nkdA@mail.gmail.com>
References: <20181201165348.24140-1-robdclark@gmail.com> <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
 <CAF6AEGtj+kyXqKeJK2-0e1jw_A4wz-yBEyv5zhf5Vfoi2_p2CA@mail.gmail.com> <CAAFQd5Dmr+xyd4dyc_44vJFpNpwK6+MgG+ensoey59HgbxXV6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAFQd5Dmr+xyd4dyc_44vJFpNpwK6+MgG+ensoey59HgbxXV6g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tfiga@chromium.org>
Cc: freedreno <freedreno@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux IOMMU <iommu@lists.linux-foundation.org>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 4, 2019 at 11:58 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> But first of all, I remember Marek already submitted some patches long
> ago that extended struct driver with some flag that means that the
> driver doesn't want the IOMMU to be attached before probe. Why
> wouldn't that work? Sounds like a perfect opt-out solution.

Actually, yeah.. we should do that.  That is the simplest solution.

BR,
-R
