From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Fri, 30 Oct 2015 18:18:16 +0000
Message-ID: <20151030181816.GA30791@leverpostej>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <20151030150025.GF31073@leverpostej>
 <CAHp75VdHxGC841cFY3M+ujZKSX04nT4+7gc3iKsgwzLRC4AYWQ@mail.gmail.com>
 <5633B207.5030505@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5633B207.5030505@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, dmaengine <dmaengine@vger.kernel.org>, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 30, 2015 at 02:08:07PM -0400, Sinan Kaya wrote:
> 
> 
> On 10/30/2015 1:59 PM, Andy Shevchenko wrote:
> >On Fri, Oct 30, 2015 at 5:00 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> >>On Thu, Oct 29, 2015 at 11:08:12PM -0400, Sinan Kaya wrote:
> >>>The Qualcomm Technologies HIDMA device has been designed
> >>>to support virtualization technology. The driver has been
> >>>divided into two to follow the hardware design. The management
> >>>driver is executed in hypervisor context and is the main
> >>>managment for all channels provided by the device. The
> >>>channel driver is exected in the guest OS context.
> >>>
> >
> >>>+#if IS_ENABLED(CONFIG_ACPI)
> >>>+static const struct acpi_device_id qcom_hidma_mgmt_acpi_ids[] = {
> >>>+     {"QCOM8060"},
> >>>+     {},
> >>>+};
> >>>+#endif
> >>
> >>How do DMA engines work with ACPI?
> >>
> >>How are client relationships defined?
> >
> >The ACPI tables DSDT and CSRT (more info here:
> >http://www.acpi.info/links.htm) defines properties.
> >
> >DSDT:
> >  per DMAC: the resources
> >  per client: FixedDMA descriptor that contains channel / request line pair.
> >
> >CSRT:
> >  necessary table to map which DMAC provides which request line, thus
> >request line numbering are global on platform.
> >
> >When DMAC driver is probed in the running system it should call as
> >well registration function from acpi-dma.c.
> >
> >All clients when use new DMA slave API gets channel automatically
> >based on their FixedDMA property.
> >
> >So, above is how it should be done. Didn't actually checked what this
> >driver does.
> >
> I was going to reply to all the questions in one pass but let me
> handle piece by piece.
> 
> Here are some facts.
> - This hardware supports memcpy and memset only.
> - Memset feature was removed from the kernel sometime around 3.14.
> So no memset support in this driver either.
> - The hardware does not support DMA slave support

This point is what I'd missed when reviewing. Apologies for that.

> - The goal is to provide an interface to DMA engine framework for
> memcpy optimization so that the rest of the kernel drivers and
> applications make use of the hardware.
> 
> CSRT is an Intel specific ACPI table for slave devices. It was
> decided by Linaro that CSRT will not be supported for ARM64.
> 
> There were some discussions in ACPI forums to define a similar table
> for ARM64 but we are not there today and this hardware does not
> support slave interface.

Ok. Thanks for the info!

> ACPI enumeration is just like any other platform device. The driver
> gets looked up by a QCOM specific HID and the driver gets probed
> with the rest of the arguments in DSM object similar to device-tree
> attributes. The code uses device functions so the driver is not
> aware of where the parameters are coming from.

Ok.

So far the properties look device-internal, so I'm ok with thoses
properties being uniform and parsed in the manner that they are, though
I'm worried about the way the device description is split over two
nodes.

Thanks,
Mark.
