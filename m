From: "christophe.ricard" <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] st33zp24 fix when using irq mode
Date: Thu, 19 Mar 2015 22:34:24 +0100
Message-ID: <550B40E0.6050708@gmail.com>
References: <1426799709-9696-1-git-send-email-christophe-h.ricard@st.com> <201503192234.32531.PeterHuewe@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201503192234.32531.PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-15?Q?Peter_H=FCwe?= <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

Basically if running a TPM command with a long enough duration (>=20
timeout_c), the answer will never be read correctly.
This only appear if using irq mode.

I am actually doing the backport to james tree at the moment and will=20
send it later on tonight.

I will send this directly without including stable@...

Best Regards
Christophe

On 19/03/2015 22:34, Peter H=FCwe wrote:
> Hi,
>
> great timing :) I just sent the pull request for 4.1 out yesterday :)
> But thanks for spotting and fixing it.
> Found bugs are good bugs, and fixed ones are even better.
>
> Am Donnerstag, 19. M=E4rz 2015, 22:15:08 schrieb Christophe Ricard:
>> Hi,
>>
>> Please find in this patch a fix that fix an improper command complet=
ion
>> wait. This patch apply on top of for-james branch
>> tpm/tpm_infineon: Use struct dev_pm_ops for power management
>> 6b37729bd184fdd44f144c6cc4951b06b55bcf4b
>>
>> *** Note: This bug is also present in kernel 4.0 but will not apply =
as the
>> driver structure changed between kernel 4.0 and kernel 4.1.
>>
>> A backported version is also going to be sent to <stable-u79uwXL29TZUIDd8j+nm9g@public.gmane.org=
=2Eorg> ?
> Are kernels < 4.0 also affected or was this code introduced in 4.0 ?
>
> How critical is the mentioned 'critical failure' ? What will happen?
> How often does it happen?
>
> If this thing is big enough and kernels < 4.0 are not affected we can=
 try to
> get it into 4.0 still, so no stable. (but I still need the backport :=
) )
>
>
> If it won't hit 4.0 then backport to 4.0.1 is needed,
> which will be sent to stable@...
> with the upstream commit mentioned.
>
>
> See
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/stable_kernel_rules.txt
>
> Thanks,
> Peter
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
