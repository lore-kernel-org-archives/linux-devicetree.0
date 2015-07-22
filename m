From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH 0/2 RESEND] power: reset: Add syscon reboot/poweroff
 device nodes for APM X-Gene platform
Date: Wed, 22 Jul 2015 10:46:36 -0700
Message-ID: <CAPw-ZT=d2=dh-Hjugo9BStCuhTp82MMapUa1EGrD01EoTOG-nA@mail.gmail.com>
References: <1433272747-27114-1-git-send-email-ttnguyen@apm.com>
	<20150714084004.GA14593@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150714084004.GA14593@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Olof,

>> This patch set adds syscon reboot/poweroff device nodes to support reboot and
>> poweroff features on X-Gene platform.
>>
>> Tai Nguyen (2):
>>   power: reset: Add syscon reboot device node for APM X-Gene platform
>>   power: reset: Add syscon poweroff device node for APM X-Gene Mustang platform
>>
>>  arch/arm64/boot/dts/apm/apm-mustang.dts |   12 ++++++++++++
>>  arch/arm64/boot/dts/apm/apm-storm.dtsi  |   12 ++++++++++++
>>  2 files changed, 24 insertions(+)
>
> Hi,
>
> It's unclear to me what you want to happen to these patches. They are
> sent to a long list of to-recipients, one of which is arm-DgEjT+Ai2yi4UlQgPVntAg@public.gmane.org In
> general, specify the person you want to take action on the patch in to
> with the rest on cc.

Is there an owner for all DT node files? Is that Catalina as he is
owner for ARM64 arch folder?

>
> We generally ask that patches first go to the subarch maintainers,
> and they in turn send it on to us (either through a pull request or
> by sending the patches to be applied). In the case of X-Gene, there is
> no general platform maintainer so we keep getting patches from various
> engineers at APM and it's unclear to us what your intentions are.
>
> I'd prefer to see one (to start with) person in charge of these (i.e. one
> maintainer from the APM side). Please add that person to the MAINTAINERS
> file as well.

Are you suggesting that we have one person to start an GIT with
kernel.org to keep all these misc ack'ed patches for X-Gene (APM) that
don't seems to have an maintainer/home. Then request an pull by you?

Thanks,
Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
