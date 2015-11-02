From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/3] dma: add Qualcomm Technologies HIDMA management driver
Date: Mon, 2 Nov 2015 09:57:18 -0600
Message-ID: <CAL_Jsq+XCkaPD_Bop_BaTfEVP2YuOQ+=ChFvyLN47jps2NcZSA@mail.gmail.com>
References: <1446444460-21600-1-git-send-email-okaya@codeaurora.org> <1446444460-21600-2-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446444460-21600-2-git-send-email-okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 2, 2015 at 12:07 AM, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> The Qualcomm Technologies HIDMA device has been designed
> to support virtualization technology. The driver has been
> divided into two to follow the hardware design. The management
> driver is executed in hypervisor context and is the main
> management entity for all channels provided by the device.
> The channel driver is executed in the hypervisor/guest OS
> context.
>
> All channel devices get probed in the hypervisor
> context during power up. They show up as DMA engine
> channels. Then, before starting the virtualization; each
> channel device is unbound from the hypervisor by VFIO
> and assigned to the guest machine for control.
>
> This management driver will be used by the system
> admin to monitor/reset the execution state of the DMA
> channels. This will be the management interface.
>
> Signed-off-by: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  .../devicetree/bindings/dma/qcom_hidma_mgmt.txt    |  56 ++
>  drivers/dma/Kconfig                                |  11 +
>  drivers/dma/Makefile                               |   1 +
>  drivers/dma/qcom_hidma_mgmt.c                      | 747 +++++++++++++++++++++
>  4 files changed, 815 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
>  create mode 100644 drivers/dma/qcom_hidma_mgmt.c
>
> diff --git a/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
> new file mode 100644
> index 0000000..514d37d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
> @@ -0,0 +1,56 @@
> +Qualcomm Technologies HIDMA Management interface
> +
> +The Qualcomm Technologies HIDMA device has been designed
> +to support virtualization technology. The driver has been
> +divided into two to follow the hardware design. The management
> +driver is executed in hypervisor context and is the main
> +management entity for all channels provided by the device.
> +The channel driver is executed in the hypervisor/guest OS
> +context.

This doesn't really explain what the block is.

> +All channel devices get probed in the hypervisor
> +context during power up. They show up as DMA engine
> +DMA channels. Then, before starting the virtualization; each
> +channel device is unbound from the hypervisor by VFIO
> +and assign to the guest machine for control.
> +
> +This management driver will  be used by the system
> +admin to monitor/reset the execution state of the DMA
> +channels. This will be the management interface.
> +
> +
> +Required properties:
> +- compatible: must contain "qcom,hidma-mgmt"

Please make this more specific. It doesn't match your example either.
Unless "1.0" type versioning is tightly controlled and defined,
version numbers are usually not a good practice.

> +- reg: Address range for DMA device
> +- dma-channels: Number of channels supported by this DMA controller.
> +- max-write-burst-bytes: Maximum write burst in bytes. A memcpy requested is
> +  fragmented to multiples of this amount.
> +- max-read-burst-bytes: Maximum read burst in bytes. A memcpy request is
> +  fragmented to multiples of this amount.
> +- max-write-transactions: Maximum write transactions to perform in a burst
> +- max-read-transactions: Maximum read transactions to perform in a burst

This would be a function of burst-bytes and bus width. Are you sure
you don't me number of outstanding transactions which is a common
parameter for AXI bus peripherals.

> +- channel-reset-timeout: Channel reset timeout for this SOC.

Please add units to property name.

> +- channel-priority: Priority of the channel.
> +  Each dma channel share the same HW bandwidth with other dma channels.
> +  If two requests reach to the HW at the same time from a low priority and
> +  high priority channel, high priority channel will claim the bus.
> +  0=low priority, 1=high priority
> +- channel-weight: Round robin weight of the channel
> +  Since there are only two priority levels supported, scheduling among
> +  the equal priority channels is done via weights.
> +
> +Example:
> +
> +       hidma-mgmt@f9984000 = {
> +               compatible = "qcom,hidma-mgmt-1.0";
> +               reg = <0xf9984000 0x15000>;
> +               dma-channels = 6;
> +               max-write-burst-bytes = 1024;
> +               max-read-burst-bytes = 1024;
> +               max-write-transactions = 31;
> +               max-read-transactions = 31;
> +               channel-reset-timeout = 0x500;
> +               channel-priority = < 1 1 0 0 0 0>;
> +               channel-weight = < 1 13 10 3 4 5>;
> +       };
> +
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
