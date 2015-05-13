From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCHv2] ARM: socfpga: dts: Add a clock node for sdmmc CIU
Date: Wed, 13 May 2015 10:00:46 -0500
Message-ID: <5553671E.3070301@opensource.altera.com>
References: <1429027519-22209-1-git-send-email-dinguyen@opensource.altera.com>
 <20150513075438.GE15988@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150513075438.GE15988-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, setka-3PjVBYxTQDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 5/13/15 2:54 AM, Stephen Boyd wrote:
> On 04/14, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
>> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>
>> The CIU(Card Interface Unit) get its clock from the sdmmc_clk_divided clock
>> which is used to clock the card. The sdmmc_clk_divided clock is the sdmmc_clk
>> passed through a fixed divider of 4. This patch adds the sdmmc_clk_divided
>> node and makes the sdmmc_clk it's parent.
>>
>> Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>> ---
> 
> Is this a fix of some sort? I'm confused why this was sent to the
> clk maintainers when it seems to be more appropriate to go
> through the arm-soc tree.
> 

Ok, sorry about that. I thought since it was clock nodes, it would
appropriate to CC clk maintainers.

BTW, can I take patches from drivers/clk/socfpga/* through the arm-soc
tree or would that go through you guys?

Thanks,
Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
