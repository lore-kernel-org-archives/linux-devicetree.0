From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 0/6] clk: sunxi: fixes, cleanups and A23
 basic clocks
Date: Thu, 26 Jun 2014 10:51:08 +0800
Message-ID: <CAGb2v65RZfdFKRGdWTph=W6jyccNo420ZSfdeFmWGpwnbHdYZQ@mail.gmail.com>
References: <1403603980-31101-1-git-send-email-wens@csie.org> <20140625201416.GH19569@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBMMVV2OQKGQEOC4AGCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20140625201416.GH19569@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 26, 2014 at 4:14 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Tue, Jun 24, 2014 at 05:59:34PM +0800, Chen-Yu Tsai wrote:
>> Hi everyone,
>>
>> This is a followup series to my A23 bare-minimum bringup series [1],
>> which adds basic clock support for the A23 SoC. It is one of many
>> split up from the original A23 series [2]. Yet to come are more
>> clocks, reset controllers, pinctrl, prcm, and mmc.
>>
>> The first patch fixes the reworked clock protection code merged in
>> 3.16-rc1, which unintentionally made clock gates unprotectable.
>>
>> The second patch moves the remaining "ahb_sdram" clock to the
>> protected clock list, now that it works.
>>
>> The third patch adds support for factor clocks that have an N factor
>> not starting from 0. This is found on some PLLs in A31/A23.
>>
>> The fourth patch adds table-based dividers for div clocks, as some
>> clocks, such as apb0 divider on sun4/5/7i, apb1 on sun6/8i and axi
>> on sun8i.
>>
>> The fifth patch adds support for the basic clocks in the A23, just
>> PLL1 for cpus, and the system bus clocks and gates.
>>
>> The last patch adds the DT nodes for the newly added clocks.
>>
>> Patch 1 should be merged for 3.16, while the rest should go in 3.17.
>
> Why should it go in for 3.16? Is there any user for it yet?

Yes. Your patch

   efb3184 clk: sun6i: Protect SDRAM gating bit

from the series that added the new clock protection code.
This adds "ahb1_sdram" to the list.

Now, on my sun8i tablet, disabling "ahb1_sdram" doesn't seem to
affect the system. So I'm not sure what this clock actually does.


ChenYu
