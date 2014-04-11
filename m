From: Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] ARM: shmobile: r8a7790: link PCI USb devices to USB PHY
Date: Fri, 11 Apr 2014 14:48:42 +0900
Message-ID: <CANqRtoSub2TULO2rURiODz1VFXNUqe5gi488mkPtq_F+Oje2cQ@mail.gmail.com>
References: <201404092318.26231.sergei.shtylyov@cogentembedded.com>
	<CANqRtoQeuT=Q9PRYNMqA079gjb1VkwgvcDmsWKxjzSVxcVfeWw@mail.gmail.com>
	<534674B5.6080706@cogentembedded.com>
	<5346E717.4040507@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <5346E717.4040507@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "Simon Horman [Horms]" <horms@verge.net.au>, SH-Linux <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, robh+dt@kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Fri, Apr 11, 2014 at 3:46 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 04/10/2014 02:38 PM, Sergei Shtylyov wrote:
>
>>> Thanks for this patch, good to see that the relationship between the
>>> USB Host and the PHY is described via DT.
>
>
>>> This patch seems to cover USB0 and USB2 that both require special
>>> control in the PHY. How about USB1? Can you explain about the reason
>>> why you omit that?
>
>
>>     Because the driver does nothing for USB1 anyway.
>
>
>    Looks like I should have tested that last minute change: kernel oopses
> due to NULL pointer dereference somewhere in phy_get() once it gets called
> for EHCI on the channel #1. At least doesn't seem to be my mistake...

No worries, thanks for looking into fixing that.

Regarding the USB ports on R-Car Gen2 in general and especially USB1,
it is my impression that even though there is no USB controller
selection available for USB1 I still believe the UGCTL.CONNECT bit
shall be used for power management purpose.

I may of course be wrong, but since the PHY hardware is shared between
USB0, USB1 and USB2 it makes sense to have some kind of usage counter
and manage the hardware enable bit based on registered users somehow.
There is no need to manage this bit at this point IMO, but in the
future we may want to add such handling to improve power management.
And that can only happen if DT is used to connect all USB controllers
with the PHY, so please make sure to describe the complete
dependencies in DT.

Thanks,

/ magnus
