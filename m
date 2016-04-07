From: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: k2*: Rename the k2* files to keystone-k2* files
Date: Thu, 7 Apr 2016 13:44:41 -0500
Message-ID: <CAGo_u6r4vzOvu__hOrZNvU-T625dZ5uGSptOoKEh5CBibYszug@mail.gmail.com>
References: <1458139150-30382-1-git-send-email-nm@ti.com>
	<56E97F0E.6070309@oracle.com>
	<CAGo_u6oMYZvzkvCsi8H3hvOBrPLZ-EL-T3RCA6E8BnmThrLYfA@mail.gmail.com>
	<5706A97E.7090002@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5706A97E.7090002-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org" <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: dt list <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 7, 2016 at 1:39 PM, santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
<santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:
> On 4/7/16 10:01 AM, Nishanth Menon wrote:
>>
>> Hi Santosh,
>>
>> On Wed, Mar 16, 2016 at 10:43 AM, santosh shilimkar
>> <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:
>>>
>>> On 3/16/2016 7:39 AM, Nishanth Menon wrote:
>>>>
>>>>
>>>> As reported in [1], rename the k2* dts files to keystone-* files
>>>> this will force consistency throughout.
>>>>
>>>> Script for the same (and hand modified for Makefile and MAINTAINERS
>>>> files):
>>>> for i in arch/arm/boot/dts/k2*
>>>> do
>>>>          b=`basename $i`;
>>>>          git mv $i arch/arm/boot/dts/keystone-$b;
>>>>          sed -i -e "s/$b/keystone-$b/g" arch/arm/boot/dts/*[si]
>>>> done
>>>>
>>>> NOTE: bootloaders that depend on older dtb names will need to be
>>>> updated as well.
>>>>
>>>> [1] http://marc.info/?l=linux-arm-kernel&m=145637407804754&w=2
>>>>
>>>> Reported-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
>>>> Signed-off-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
>>>> ---
>>>>
>>> Thanks Nishant for taking care of this. I will add this to the
>>> next soon.
>>>
>>
>> I dont see this in 4.6-rc2 yet.. did this slip our pull request? will
>> be good to get this in so that we can fix up u-boot consistently.
>>
> As discussed already, the 4.6 merge window contained the k2g renames
> as you can see from the pull request[1]. The other rename was suppose
> to be for 4.7 so that it lives in next for sometime for users to get
> the time to get to update the bootloaders etc.
>
> So it didn't slip pull request but just happen to go in 4.7 pull
> request. I added that to next early for testing. Hope it
> clarifies.

Aaah.. OK. I had misunderstood this to mean this cleanup was for 4.6
cycle. I will have to hold off on u-boot update till this is in master
:(.

>
> Regards,
> Santosh
>
> [1] https://patchwork.ozlabs.org/patch/588386/
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
---
Regards,
Nishanth Menon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
