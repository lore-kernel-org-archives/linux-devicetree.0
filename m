From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [PATCH v2 1/3] clk: emev2: Add support for emev2 SMU clocks with
 DT
Date: Wed, 09 Oct 2013 08:10:57 +0200
Message-ID: <5254F371.2020704@codethink.co.uk>
References: <20131008143040.52f36df8edb7ab63224d8433@ops.dti.ne.jp> <20131008143217.0611fba0c0d27d9c622759f3@ops.dti.ne.jp> <CANqRtoRZM=5FYG7+fq5c+TQEuHtJRmcGP1CmMq5kO5Ayvg=W6w@mail.gmail.com> <20131009033807.GM15065@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131009033807.GM15065-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, takasi-y-nDL5PR/MsHhHfZP73Gtkiw@public.gmane.org, SH-Linux <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shinya Kuribayashi <shinya.kuribayashi.px-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/10/13 05:38, Simon Horman wrote:
> On Tue, Oct 08, 2013 at 02:58:08PM +0900, Magnus Damm wrote:
>> On Tue, Oct 8, 2013 at 2:32 PM,<takasi-y-nDL5PR/MsHhHfZP73Gtkiw@public.gmane.org>  wrote:
>>> Device tree clock binding document for EMMA Mobile EV2 SMU,
>>> And Common clock framework based implementation of it.
>>> Following nodes are defined to describe clock tree.
>>> - renesas,emev2-smu
>>> - renesas,emev2-smu-clkdiv
>>> - renesas,emev2-smu-gclk
>>>
>>> These bindings are designed manually based on
>>>   19UH0037EJ1000_SMU : System Management Unit User's Manual
>>>
>>> So far, reparent is not implemented, and is fixed to index #0.
>>> Clock tree description is not included, and should be provided
>>> by device-tree.
>>>
>>> Signed-off-by: Takashi Yoshii<takasi-y-nDL5PR/MsHhHfZP73Gtkiw@public.gmane.org>
>>> ---
>>>   .../devicetree/bindings/clock/emev2-clock.txt      |  98 +++++++++++++++++++
>>>   drivers/clk/Makefile                               |   1 +
>>>   drivers/clk/shmobile/Makefile                      |   3 +
>>>   drivers/clk/shmobile/clk-emev2.c                   | 104 +++++++++++++++++++++
>>>   4 files changed, 206 insertions(+)
>>
>> Thanks for cleaning up the Makefile bits, Yoshii-san.
>>
>> This patch and the bindings look fine to me from a SoC point of view.
>> Using these together with the topology information in emev2.dtsi makes
>> it possible for us to use CCF and multiplatform as expected on the
>> EMEV2 SoC.
>>
>> Acked-by: Magnus Damm<damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
>
> Thanks. I will send a pull request for this change to Mike Turquette.

I was going to comment on the last set but forgot.

My set dealt with the following issues

This set does not have any of the module clocks, which I added
in mine. This is also an issue with the clock and serial drivers
which do not ensure the bus/module clocks have been enabled in
the driver.

Mine also dealt with the multiple parents that some of these
clocks have.

I can try and re-post tonight for discussion.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
