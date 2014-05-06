From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: Re: [PATCH 0/2] ARM: sunxi: Enable syscon for the
 system controller
Date: Tue, 6 May 2014 10:03:19 +0200
Message-ID: <CAOQ7t2akOEr7o4Q5ze5QPr_RHj6MWmA-u5NTuq2q1epy2LBr8w@mail.gmail.com>
References: <1399212160-26934-1-git-send-email-carlo@caione.org>
	<20140505225517.GE9464@lukather>
	<CAGb2v66JBM_Rv8ie=7iuTPrXGPJECTeevnf9LLXNS=FSYs1+Tg@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDWJTUUC5UCBBSFOUKNQKGQEYRFJM5Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v66JBM_Rv8ie=7iuTPrXGPJECTeevnf9LLXNS=FSYs1+Tg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 6, 2014 at 8:36 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> Hi,

Hi,

> On Tue, May 6, 2014 at 6:55 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> On Sun, May 04, 2014 at 04:02:38PM +0200, Carlo Caione wrote:
>>> The so called "system controller" in Allwinner A20 and A31 SoCs is
>>> multi-purpose controller that tries to add misc functionality to one
>>> memory region.
>>> In these SoCs it controls the internal SRAM partitioning but it also
>>> includes registers for chip versioning and NMI control.
>>> This patch adds the proper nodes in the DTS files and enable the syscon
>>> in the defconfig files.
>>>
>>> Even though the system controller includes also register for managing the
>>> NMI controller, these register are not mapped in the syscon since they
>>> are directly used and mapped by the NMI controller itself.
>>
>> Hmmm, what exactly do you want to achieve with this?
>>
>> The NMI controller won't be able to use it, since it's initialized
>> much earlier than syscon and regmap.

This is what I meant with that phrase. NMI controller doesn't use the
syscon but we can use it for several other drivers. In fact the
registers for NMI controller are excluded from the range of syscon
registers.

> I believe this will be used for toggling the SRAM mappings. (Am I right?)

Definitely right.

> The second register toggles mappings for MUSB FIFO, EMAC, and a few of
> the other IP blocks we currently don't support.

Not yet :)

>> Moreover, the A31 doesn't seem to have this system controller, or at
>> least this overlap.

I admit that I didn't check the A31 manual but I trusted the wiki page
at http://linux-sunxi.org/SRAM_Controller and
http://linux-sunxi.org/A31/Memory_map

> There should be something similar, as does the A23. There is no overlap AFAIK.

I agree and will check also A23.

>> And since on the A20, registers seem to have one usage only, so I
>> guess we can just split this IP into several nodes, just like we did
>> with the NMI.
>
> As stated above, the second register toggles SRAM mappings for at most
> 4 SRAM blocks (for EMAC, MUSB, ACE, ISP).
>
> syscon would be a good way to share this register among the various drivers.
> We do not toggle it in the current EMAC driver. The driver seems to assume
> it is setup by the bootloader, and on the A20, it seems to be mapped to
> EMAC by default.
>
> The MUSB glue layer driver must toggle this.

This is exactly why I wrote these patches. I started hacking /
studying your MUSB driver and I think that using syscon is a better
way to manage these registers instead of mapping them in several
drivers also because most of the time a single register has to be used
by multiple drivers (i.e. SRAM_CTL1_CFG is used for USB,  EMAC,
etc...)

> I think this approach is better than all the individual drivers mapping
> the registers and toggling a single bit. In fact I did something similar
> when working on preliminary musb support.

Thanks,

-- 
Carlo Caione
