From: Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 6/6] arm: exynos: Add /dev/bL_status user interface on Exynos5420
Date: Thu, 1 May 2014 15:09:29 +0530
Message-ID: <CAM4voaktFuB4fH08QE32q=zH9p=yeNeXmf9qeTDGfZeQqu0K-g@mail.gmail.com>
References: <1398528348-21214-1-git-send-email-a.kesavan@samsung.com>
	<1398528348-21214-7-git-send-email-a.kesavan@samsung.com>
	<535E3A8C.6070304@linaro.org>
	<CAM4voak-oXToBK=owO=jmpwk3rDkg71JS=8YOTz1HfiQvZa5Vw@mail.gmail.com>
	<alpine.LFD.2.11.1404301044280.980@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.11.1404301044280.980-fMhRO7WWcppj+hNMo8g0rg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas P Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "mark.rutland" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Nicolas,

On Wed, Apr 30, 2014 at 8:19 PM, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, 28 Apr 2014, Abhilash Kesavan wrote:
>
>> On Mon, Apr 28, 2014 at 4:55 PM, Daniel Lezcano
>> <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > On 04/26/2014 06:05 PM, Abhilash Kesavan wrote:
>> >>
>> >> Add a user interface to check the core and cluster status on
>> >> Exynos5420. This can be utilized while debugging mcpm issues.
>> >> cat /dev/bL_status will show the current power status of all
>> >> the 8 cores along with the cluster.
>> >>
>> >> Signed-off-by: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> >> Signed-off-by: Inderpal Singh <inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> >> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> >> Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> >> ---
>> >
>> >
>> > Hi Abhilash,
>>
>> Hi Daniel,
>> >
>> > I don't think you should add this file.
>> >
>> > 1. big Little is not exynos specific
>> But the core control/status bits that I am accessing are exynos
>> specific and currently it is being enabled only on 5420.
>
> Maybe yt is not worth pushing this patch upstream?  Once basic debugging
> is over, you shouldn't have to use this code anymore.
OK, will drop this patch.

Regards,
Abhilash
>
>
> Nicolas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
