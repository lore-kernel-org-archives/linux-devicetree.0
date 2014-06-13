From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: CPU revision IDs
Date: Fri, 13 Jun 2014 14:43:55 +0200
Message-ID: <20140613144355.20412fa6@free-electrons.com>
References: <CAKON4OwNULPeQFHwRhRfri86yexMvvKfrw_dthim4_oPWvMD3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKON4OwNULPeQFHwRhRfri86yexMvvKfrw_dthim4_oPWvMD3g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Fri, 13 Jun 2014 08:29:41 -0400, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> How are CPU revision IDs encoded into the device tree? It is not
> reasonable to ask people to manually identify their revision and then
> use the right device tree. For example a heat sink may obscure the
> markings. The CPU ID is needed for device driver quirks.
> 
> I was thinking of doing something like adding code at early boot that
> fixes up the root compatible string. The revision is a
> property of the CPU.
> 
> Code changes this:
>  compatible = "cubietech,cubietruck", "allwinner,sun7i-a20"
> to:
>  compatible = "cubietech,cubietruck",  "allwinner,sun7i-a20a",
> "allwinner,sun7i-a20"
> 
> Alternatively this could be done in uboot.
> 
> Browsing around the kernel code there seems to be multiple solutions
> to this problem.  For example this Marvell code modifies the device
> driver compatible string.
> 
> http://lxr.free-electrons.com/source/arch/arm/mach-mvebu/board-v7.c#L71

Yes, the way we handle that on Marvell EBU platforms is that we runtime
detect the revision of the SoC, and use this information to adjust the
Device Tree information for this or that device that is known to have
issues/differences. For example, early revisions of Armada XP
processors have an issue in the I2C controller which prevents an
optimization feature from being used, so the code in board-v7.c detects
this early revision, and changes the Device Tree compatible string used
to probe the I2C controller, to a different compatible string that lets
the driver know that the feature shouldn't be used.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
