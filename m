From: Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC 0/8] Devfreq support for Exynos5250/5420
Date: Mon, 28 Apr 2014 09:00:13 +0530
Message-ID: <CAM4voa=KvyijCAU_JLZmbHEM1WFi1FsYPr0E_sLqNfC2z5DvHQ@mail.gmail.com>
References: <22969683.196701398648855165.JavaMail.weblogic@epv6ml10>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <22969683.196701398648855165.JavaMail.weblogic@epv6ml10>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "myungjoo.ham" <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, =?UTF-8?B?6rmA6rWt7KeE?= <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-pm-u79uwXL29TaqPxH82wqD4g@public.gmane.org" <linux-pm-u79uwXL29TaqPxH82wqD4g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?7LWc7LCs7Jqw?= <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Myungjoo,

On Mon, Apr 28, 2014 at 7:04 AM, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> This patchset adds devfreq support on Exynos5250 and Exynos5420.
>> The patches add the missing INT clock support for exynos5250 and
>> also add a new 5420 driver. We also have patches which add the PPMU
>> node and fix a typo in the exynos5250 driver.
>>
>> The patches have been tested on Exynos5250 based Snow board and SMDK5420
>> EVT1 boards. They have been prepared on linux-next(20140424) with the
>> devfreq for-next branch and Shaik Ameer Basha's clock cleanup patches
>> merged (http://www.spinics.net/lists/arm-kernel/msg325313.html).
>>
>> There are a couple of concerns with these patches:
>> 1) The patches are using clock aliases to expose the required clocks to the
>> devfreq driver.
>> 2) The patches are making use of different compatible strings for the PPMU
>> node to differentiate between multiple SoCs even though the PPMU is the same.
>>
>> Kindly suggest a way to move forward with respect to the above.
>
> The Exynos PPMU drivers have been located in drivers/devfreq/exynos
> as devfreq drivers have been the only users of PPMU. There
> are developers trying to design common PPMU frameworks, including
> Chanwoo, it is not yet submitted.
>
> Because other Exynos5 SoCs have their bus/memif PPMU defined in
> drivers/devfreq/exynos, adding another ont in another directory
> seems not appropriate.
Thanks for your reply.
I agree with you, I would like to re-use the current exynos5 devfreq
driver code as far as possible for 5420 as well. I do see a post from
Chanwoo Choi (https://lkml.org/lkml/2014/3/12/171) regarding adding dt
support for exynos4. But, looks like there has not be any new patchset
for a while now.

Chanwoo, is there a plan to post a new version of your patchset ? I
would be interested in using the same for my work on exynos5.

Regards,
Abhilash
>
>
> Cheers,
> MyungJoo.
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
