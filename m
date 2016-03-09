From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 0/5] PCIe Xilinx generic driver for Microblaze and
Date: Wed, 9 Mar 2016 18:14:40 +0100
Message-ID: <56E05A00.9030506@xilinx.com>
References: <1455208091-15556-1-git-send-email-bharatku@xilinx.com>
 <20160308203444.GA27132@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160308203444.GA27132@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bharat Kumar Gogada <bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, russell.joyce-3oYoeGyd3e21Qrn1Bg8BZw@public.gmane.org, sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8.3.2016 21:34, Bjorn Helgaas wrote:
> On Thu, Feb 11, 2016 at 09:58:06PM +0530, Bharat Kumar Gogada wrote:
>> This patch series does modifications to pcie-xilinx.c, to support common
>> driver on both Zynq and Microblaze architectures.
>> Microblaze pci-common.c has been modified to support generic driver.
>>
>> Bharat Kumar Gogada (5):
>>   PCI: xilinx: Removing xilinx_pcie_parse_and_add_res function
>>   PCI: xilinx: Removing struct hw_pci structure.
>>   PCI: xilinx: Modifying AXI PCIe Host Bridge driver to work on both
>>      Zynq and Microblaze
>>   PCI: xilinx: Updating Zynq PCI binding documentation with 
>>     Microblaze node.
>>   Microblaze: Modifying microblaze PCI subsytem to support  generic
>>     Xilinx  AXI PCIe Host Bridge IP driver
>>
>>  .../devicetree/bindings/pci/xilinx-pcie.txt        |  32 +++-
>>  arch/microblaze/Kconfig                            |   3 +
>>  arch/microblaze/pci/pci-common.c                   |  56 ++----
>>  drivers/pci/host/Kconfig                           |   2 +-
>>  drivers/pci/host/pcie-xilinx.c                     | 191 +++------------------
>>  5 files changed, 66 insertions(+), 218 deletions(-)
> 
> I applied this series to my pci/host-xilinx branch for v4.6.
> 
> Michal, you only explicitly acked the last patch, but that only makes
> sense if I apply the whole series, so I applied your ack to all the
> patches.

No problem.

Thanks,
Michal

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
