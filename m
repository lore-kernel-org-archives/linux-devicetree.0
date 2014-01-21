From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Removing PLAT_ORION dependency from ARCH_MVEBU (Was Re: [PATCH
 v2 14/15] watchdog: orion: Allow to build on any Orion platform)
Date: Tue, 21 Jan 2014 12:44:45 +0100
Message-ID: <52DE5DAD.7040308@gmail.com>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com> <1390295561-3466-15-git-send-email-ezequiel.garcia@free-electrons.com> <52DE40BD.10700@gmail.com> <20140121110603.GB4356@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140121110603.GB4356@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/21/14 12:06, Ezequiel Garcia wrote:
> Sebastian,
>
> I'm picking on this discussion, with a new Subject.
>
> On Tue, Jan 21, 2014 at 10:41:17AM +0100, Sebastian Hesselbarth wrote:
>> On 01/21/14 10:12, Ezequiel Garcia wrote:
>>> After getting rid of all the mach-specific code, it's now possible
>>> to allow builds in any Orion platform.
>>>
>>> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>> ---
>>>    drivers/watchdog/Kconfig | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>> index 5be6e91..1689f72 100644
>>> --- a/drivers/watchdog/Kconfig
>>> +++ b/drivers/watchdog/Kconfig
>>> @@ -282,7 +282,7 @@ config DAVINCI_WATCHDOG
>>>
>>>    config ORION_WATCHDOG
>>>    	tristate "Orion watchdog"
>>> -	depends on ARCH_ORION5X || ARCH_KIRKWOOD || ARCH_DOVE
>>> +	depends on PLAT_ORION
> [..]
>>
>> I haven't checked why ARCH_MVEBU at all added PLAT_ORION as dependency,
>> but IIRC it was just because of a missing mbus driver? If it is just
>> this, we should also remove PLAT_ORION from ARCH_MVEBU to have a clean
>> cut between new common arch and existing sub-archs.
>>
>
> Well, I'm not sure if I'm following you. Many drivers currently depend
> on PLAT_ORION, so if we remove PLAT_ORION from ARCH_MVEBU we would have
> to replace: s/PLAT_ORION/ARCH_{MVEBU, KIRKWOOD, DOVE, ...}.
>
> Is this the suggested roadmap or I've completely misunderstood it?

Actually, you are right, PLAT_ORION is dependency for a bunch of
drivers. But as PLAT_ORION - code-wise - almost only contains non-DT
stuff, I'd prefer to use ARCH_MVEBU for DT enabled Marvell SoCs where
possible.

So for the above, just add ARCH_MVEBU and remove ARCH_KIRKWOOD,
ARCH_DOVE later when we kill them, instead of hiding all behind
PLAT_ORION. Also remove the dependency of ARCH_MVEBU to PLAT_ORION
where possible or replace it with ARCH_MVEBU directly.

This way we would have a clean ARCH_MVEBU config for DT-enabled
SoCs and PLAT_ORION for non-DT ones. BTW, there is also
PLAT_ORION_LEGACY which is just selecting PLAT_ORION. IIRC, I added
that to distinguish non-DT and DT earlier, but ARCH_MVEBU selecting
PLAT_ORION made that redundant.

Sebastian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
