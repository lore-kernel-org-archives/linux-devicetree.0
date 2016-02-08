From: Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [PATCH V14 0/9] dma: add Qualcomm Technologies HIDMA driver
Date: Mon, 8 Feb 2016 11:14:32 +0100
Message-ID: <20160208101432.GA1150@cbox>
References: <1454646882-24369-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454646882-24369-1-git-send-email-okaya@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, marc.zyngier@arm.com, mark.rutland@arm.com, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com, vikrams@codeaurora.org, arnd@arndb.de, eric.auger@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, agross@codeaurora.org, shankerd@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi Sinan,

On Thu, Feb 04, 2016 at 11:34:31PM -0500, Sinan Kaya wrote:
> The Qualcomm Technologies HIDMA device has been designed
> to support virtualization technology. The driver has been
> divided into two to follow the hardware design.
> 
> 1. HIDMA Management driver
> 2. HIDMA Channel driver
> 
> Each HIDMA HW consists of multiple channels. These channels
> share some set of common parameters. These parameters are
> initialized by the management driver during power up.
> Same management driver is used for monitoring the execution
> of the channels. Management driver can change the performance
> behavior dynamically such as bandwidth allocation and
> prioritization in the future.
> 
> The management driver is executed in host context and
> is the main management entity for all channels provided by
> the device.

I'm not at all familiar with this kind of hardware.

Once an entity (userspace or VM) has a HIDAM channel assigned via VFIO,
how does it use it?  Is it used in relation with another device to
perform DMA on its behalf or is a HIDMA channel something that's useful
on its own?

Thanks,
-Christoffer
