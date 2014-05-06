From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH 0/2] ARM: sunxi: Enable syscon for the
 system controller
Date: Tue, 6 May 2014 14:36:33 +0800
Message-ID: <CAGb2v66JBM_Rv8ie=7iuTPrXGPJECTeevnf9LLXNS=FSYs1+Tg@mail.gmail.com>
References: <1399212160-26934-1-git-send-email-carlo@caione.org> <20140505225517.GE9464@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140505225517.GE9464@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, May 6, 2014 at 6:55 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Sun, May 04, 2014 at 04:02:38PM +0200, Carlo Caione wrote:
>> The so called "system controller" in Allwinner A20 and A31 SoCs is
>> multi-purpose controller that tries to add misc functionality to one
>> memory region.
>> In these SoCs it controls the internal SRAM partitioning but it also
>> includes registers for chip versioning and NMI control.
>> This patch adds the proper nodes in the DTS files and enable the syscon
>> in the defconfig files.
>>
>> Even though the system controller includes also register for managing the
>> NMI controller, these register are not mapped in the syscon since they
>> are directly used and mapped by the NMI controller itself.
>
> Hmmm, what exactly do you want to achieve with this?
>
> The NMI controller won't be able to use it, since it's initialized
> much earlier than syscon and regmap.

I believe this will be used for toggling the SRAM mappings. (Am I right?)
The second register toggles mappings for MUSB FIFO, EMAC, and a few of
the other IP blocks we currently don't support.

> Moreover, the A31 doesn't seem to have this system controller, or at
> least this overlap.

There should be something similar, as does the A23. There is no overlap AFAIK.

> And since on the A20, registers seem to have one usage only, so I
> guess we can just split this IP into several nodes, just like we did
> with the NMI.

As stated above, the second register toggles SRAM mappings for at most
4 SRAM blocks (for EMAC, MUSB, ACE, ISP).

syscon would be a good way to share this register among the various drivers.
We do not toggle it in the current EMAC driver. The driver seems to assume
it is setup by the bootloader, and on the A20, it seems to be mapped to
EMAC by default.

The MUSB glue layer driver must toggle this.

I think this approach is better than all the individual drivers mapping
the registers and toggling a single bit. In fact I did something similar
when working on preliminary musb support.


Cheers
ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
