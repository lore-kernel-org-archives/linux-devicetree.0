From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] drivers: firmware: psci: unify enable-method binding
 on ARM {64, 32}-bit systems
Date: Tue, 26 Apr 2016 12:22:49 +0100
Message-ID: <571F4F89.70006@arm.com>
References: <1461338282-19509-1-git-send-email-sudeep.holla@arm.com>
 <571F4632.6090003@arm.com> <31757054.8aSO57qemx@wuerfel>
 <20160426190257.7b2e6a9a@xhacker>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160426190257.7b2e6a9a@xhacker>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jisheng,

On 26/04/16 12:02, Jisheng Zhang wrote:
> Dear Arnd, Sudeep,
>
> On Tue, 26 Apr 2016 12:49:00 +0200 Arnd Bergmann wrote:
>

[...]

>>
>> Applied to the fixes branch. I have to admit that I don't understand
>> how the compatible string is really used here, so I have to trust that
>> this cannot break any existing machine.
>
> To be honest, this breaks some Marvell DEBU's 32 bit SoCs' kernel, but these

Sorry for that, but it's better to fix it in the firmware/DT.
As I mentioned earlier it was never honored in the kernel before v4.6,
so technically nothing is broken yet :)

> SoCs' support are not mainlined yet, so it's fine to fix it as early as
> possible.
>

Good to hear that. Thanks indeed.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
