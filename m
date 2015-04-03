From: punnaiah choudary kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 2/2] memory: pl353: Add driver for arm pl353 static
 memory controller
Date: Fri, 3 Apr 2015 07:40:43 +0530
Message-ID: <CAGnW=BY4qnkhViSERJcA=SMjXhbX=HHypvbZ7KObrE8NJT6cDw@mail.gmail.com>
References: <1420566557-19846-1-git-send-email-punnaia@xilinx.com>
	<bc55f81bea314bc49b62b6fbcb662ae3@BN1BFFO11FD014.protection.gbl>
	<20150402205852.GI32500@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150402205852.GI32500@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "Gupta, Pekon" <pekon-l0cyMroinI0@public.gmane.org>, "jussi.kivilinna-X3B1VOXEql0@public.gmane.org" <jussi.kivilinna-X3B1VOXEql0@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Khoronz
List-Id: devicetree@vger.kernel.org

Hi Brian,

  This driver has not been reviewed completely. I will address your comments
and send next set of patches.

Thanks,
Punnaiah

On Fri, Apr 3, 2015 at 2:28 AM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I'm not following the review of the 'memory' portions much, but has this
> gotten much review? I was looking at the MTD portions when I noticed an
> obvious issue below:
>
> On Tue, Jan 06, 2015 at 11:19:17PM +0530, Punnaiah Choudary Kalluri wrote:
>> Add driver for arm pl353 static memory controller. This controller is
>> used in xilinx zynq soc for interfacing the nand and nor/sram memory
>> devices.
>>
>> Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> ---
>> Changes in v5:
>> - Added pl353_smc_get_clkrate function, made pl353_smc_set_cycles as public
>>   API
>> - Removed nand timing parameter initialization and moved it to nand driver
>> Changes in v4:
>> - Modified driver to support multiple instances
>> - Used sleep instaed of busywait for delay
>> Changes in v3:
>> - None
>> Changes in v2:
>> - Since now the timing parameters are in nano seconds, added logic to convert
>>   them to the cycles
>> ---
>>  drivers/memory/Kconfig           |    6 +
>>  drivers/memory/Makefile          |    1 +
>>  drivers/memory/pl353-smc.c       |  525 ++++++++++++++++++++++++++++++++++++++
>>  include/linux/memory/pl353-smc.h |   37 +++
>>  4 files changed, 569 insertions(+), 0 deletions(-)
>>  create mode 100644 drivers/memory/pl353-smc.c
>>  create mode 100644 include/linux/memory/pl353-smc.h
>>
>> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
>> index 6d91c27..9d4880f 100644
>> --- a/drivers/memory/Kconfig
>> +++ b/drivers/memory/Kconfig
>> @@ -85,4 +85,10 @@ config FSL_IFC
>>       bool
>>       depends on FSL_SOC
>>
>> +config PL353_SMC
>> +     bool "ARM PL353 Static Memory Controller(SMC) driver"
>
> Space after 'Controller'. i.e.:
>
>         bool "ARM PL353 Static Memory Controller (SMC) driver"
>
>> +     default y
>
> We almost definitely don't want this to be 'default y', especially given
> that it would then be enabled on all ARM systems. Users could add it
> their configuration themselves if they want it, or you might add it to
> multi_v7_defconfig.
>
>> +     depends on ARM
>> +     help
>> +       This driver is for the ARM PL353 Static Memory Controller(SMC) module.
>
> Same spacing issue here.
>
>>  endif
>
> [...]
>
> Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
