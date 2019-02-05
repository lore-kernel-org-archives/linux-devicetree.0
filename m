From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 0/8 v5] k3dma patches to add support for hi3660/HiKey960
Date: Tue, 5 Feb 2019 10:31:16 +0530
Message-ID: <20190205050116.GV4296@vkoul-mobl>
References: <1548361463-28372-1-git-send-email-john.stultz@linaro.org>
 <20190204090154.GM4296@vkoul-mobl>
 <CALAqxLVo8aukbc61YX0r3ABDWYJ_cisSb2NxN1qNyWJ_tfYCyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALAqxLVo8aukbc61YX0r3ABDWYJ_cisSb2NxN1qNyWJ_tfYCyw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Tanglei Han <hantanglei@huawei.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Dan Williams <dan.j.williams@intel.com>, Wei Xu <xuwei5@hisilicon.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Guodong Xu <guodong.xu@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Ryan Grachek <ryan@edited.us>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 04-02-19, 11:15, John Stultz wrote:
> On Mon, Feb 4, 2019 at 1:03 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 24-01-19, 12:24, John Stultz wrote:
> > > This patch series is based on recent work by Tanglei Han, and
> > > adds support for hi3660 SoCs as found on the HiKey960 board,
> > > along with a few patches I've been carrying.
> >
> > Applied and fixed the minor style issues in patch 5, and retagged 3 thru
> > 5 to dmaengine: xxx, thanks
> 
> My apologies for the style mistake. Your help is very much appreciated
> here! Thanks so much again!

No issues it was a minor one so didnt warrant a respin!
> 
> Just to clarify, are you planning on taking the reviewed binding
> documents (patches 1&2) via your tree?

yes sorry I should have clarified since this is multi-subsystem series.
I have applied 1 thru 5 that includes DT binding. I do that typically
for dmaengine driver patches with Rob's ack.

Thanks
-- 
~Vinod
