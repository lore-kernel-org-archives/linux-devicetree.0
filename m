From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] Broadcom STB GISB bus driver for 3.19 (v2)
Date: Fri, 05 Dec 2014 11:18:50 -0800
Message-ID: <5482051A.1050403@gmail.com>
References: <1417220370-469-1-git-send-email-f.fainelli@gmail.com> <2910464.KM7dWcxCmJ@wuerfel> <54815D85.7090409@gmail.com> <6133066.hrdnRxXNp1@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6133066.hrdnRxXNp1@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/12/14 01:54, Arnd Bergmann wrote:
> On Thursday 04 December 2014 23:23:49 Florian Fainelli wrote:
>> Le 04/12/2014 07:44, Arnd Bergmann a =C3=A9crit :
>>> On Friday 28 November 2014 16:19:30 Florian Fainelli wrote:
>>>> This pull request contains the following changes to the Broadcom G=
ISB bus
>>>> arbiter from Kevin Cernekee:
>>>>
>>>> - Extend brcmstb GISB bus driver to work on MIPS (currently ARM-on=
ly) and support
>>>>   65nm and 40nm MIPS-based chips such as: BCM7038, BCM7400 and BCM=
7435
>>>
>>> Pulled into next/drivers, thanks!
>>
>> Thanks! You may have to resolve a conflict when you merge
>> brcm/stb-smp-uart with next/drivers for this file, especially with t=
he
>> commit below:
>>
>> 203bb85ed605e43eadca62afb3a8cd128a8ec10a ("bus: brcmstb_gisb: save a=
nd
>> restore GISB timeout")
>>
>> for brcmstb_gisb_arb_suspend() and
>> brcmstb_gisb_arb_resume_noirq() which still use the ioread32/iowrite=
32
>> accessors instead of those introduced later on by Kevin: gisb_read()=
 and
>> gisb_write. The merge resolution looks like this:
>>
>>
>> #ifdef CONFIG_PM_SLEEP
>> static int brcmstb_gisb_arb_suspend(struct device *dev)
>> {
>>         struct platform_device *pdev =3D to_platform_device(dev);
>>         struct brcmstb_gisb_arb_device *gdev =3D platform_get_drvdat=
a(pdev);
>>
>>         gdev->saved_timeout =3D gisb_read(gdev, ARB_TIMER);
>>
>>         return 0;
>> }
>>
>> /* Make sure we provide the same timeout value that was configured
>> before, and
>>  * do this before the GISB timeout interrupt handler has any chance =
to run.
>>  */
>> static int brcmstb_gisb_arb_resume_noirq(struct device *dev)
>> {
>>         struct platform_device *pdev =3D to_platform_device(dev);
>>         struct brcmstb_gisb_arb_device *gdev =3D platform_get_drvdat=
a(pdev);
>>
>>         gisb_write(gdev, gdev->saved_timeout, ARB_TIMER);
>>
>>         return 0;
>> }
>=20
> I ended up mismerging it actually, but Olof fixed it up. If you have =
the
> time, please check that the contents of our for-next branch are corre=
ct
> now.

I just sent you a fix applying on top of your for-next branch that
resolves this: 1417806943-1200-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

I will put all the brcmstb_gisb in the same branch next time so you
don't have to resolve conflicts like these anymore.

Thanks!

>=20
> Thanks,
>=20
> 	Arnd
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
