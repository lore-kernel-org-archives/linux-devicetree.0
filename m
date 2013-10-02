From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCHv0,RESEND] Add support for Intersil ISL12057 I2C
 RTC/Alarm chip
Date: Wed, 2 Oct 2013 12:14:23 +0100
Message-ID: <20131002111423.GO22259@e106331-lin.cambridge.arm.com>
References: <87ob787nf6.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87ob787nf6.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 01, 2013 at 09:21:01PM +0100, Arnaud Ebalard wrote:
> Hi,
> 
> Netgear ReadyNAS 102 (Armada 370-base) NAS includes an Intersil ISL12057
> I2C RTC/Alarm chip. As part of an effort to get full support for the NAS
> in mainline kernel, I wrote a driver for the chip based on ISL1208 one
> developed by Hebert Valerio Riedel. The patch below is an updated resend
> of the one I submitted on August 3 (i.e. holidays), but got no reply
> for. See
> 
>   https://groups.google.com/forum/#!topic/rtc-linux/ypqMloOezj0
> 
> If possible, I would like to be able to get it mainline in 3.13, and
> pushed required DT bindings for ReadyNAS 102 to avoid the NAS to wake up
> in the 70s.
> 
> Setting and retrieving time works as expected at startup and shutdown.
> Also, alarm bit is set in status register when the alarm is triggered.
> 
> Some things worth mentioning:
>  - on my platform, the Alarm IRQ is not connected to the SoC but to a
>    power chip, so I cannot test the alarm IRQ handling code of the
>    patch. I'd be happy to get feedback if someone has the same hardware.
>  - nonetheless, when the alarm is set and the NAS is powered off, it
>    gets woken up, i.e. the alarm setting code does work.
>  - trying to interact w/ the clock using userland tools (Debian jessie)
>    makes me wonder what I missed:
> 
>    root@humble:/sys/class/rtc/rtc0# hwclock -r
>    hwclock: select() to /dev/rtc0 to wait for clock tick timed out: Success
> 
>    root@humble:/tmp# gcc rtctest.c
>    root@humble:/tmp# ./a.out
> 
>                           RTC Driver Test Example.
> 
>     Counting 5 update (1/sec) interrupts from reading /dev/rtc0:
> 
>     [ nothing happens ]
> 
>     I tried and find some documentation on the topic to understand where
>     the issue comes from but found nothing obvious.

Forgive me if I'm mistaken, but you mentioned above that interrupts
aren't wired up on your platform, and judging by the output the test
program seems to be relying on them.

> 
> I intend to provide some documentation in next round and fix reported
> issues. Additionally, I wonder why ISL1208 code has no specific mutex
> protection for access and changes. I also followed that path in attached
> driver but I guess this is something that should be improved.

The devicetree binding must go in when the driver is added, rather than
later.

Given the above known issue, I think that should be fixed up before the
driver gets merged -- 
If this driver has known issues then should those not be fixed before
merging it?

> 
> Comments welcome,
> 
> Cheers,
> 
> a+
> 
> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/rtc/Kconfig        |   9 +
>  drivers/rtc/Makefile       |   1 +
>  drivers/rtc/rtc-isl12057.c | 641 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 651 insertions(+)
>  create mode 100644 drivers/rtc/rtc-isl12057.c
 
[...]

> +#ifdef CONFIG_OF
> +static struct of_device_id isl12057_dt_match[] = {
> +       { .compatible = "isil,isl12057" },
> +       { },
> +};
> +#endif

It looks like this is a simple device with only an interrupt (no clocks,
regulators, other elements), so that can go under
Documentation/devicetree/bindings/i2c/trivial-devices.txt.

Also, the "isil" vendor prefix doesn't seem to be documented. Could you
please create a patch adding it to
Documentation/devicetree/bindings/vendor-prefixes.txt?

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
