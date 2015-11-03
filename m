From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Tue, 03 Nov 2015 22:10:59 +0100
Message-ID: <9870677.mbWe9PySGp@wuerfel>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org> <4135705.fKCjnZtDgZ@wuerfel> <56392216.8050305@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56392216.8050305@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 03 November 2015 16:07:34 Sinan Kaya wrote:
> On 11/3/2015 5:43 AM, Arnd Bergmann wrote:
> > Ok, got it.
> >
> > Best add an explanation like the above in the interrupt handler,
> > to prevent this from accidentally getting 'cleaned up' to use
> > readl(), or copied into a driver that uses PCI ordering rules
> > where it is actually wrong.
> >
> 
> I'm adding this disclaimer into the ISR routine.
> 
>         /*
>          * Fine tuned for this HW...
>          *
>          * This ISR has been designed for this particular hardware. Relaxed read
>          * and write accessors are used for performance reasons due to interrupt
>          * delivery guarantees. Do not copy this code blindly and expect
>          * that to work.
>          */
> 
> 

Sounds good.

	Arnd
