From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [RFC PATCH v1 0/4] Add Rockchip RGA support
Date: Tue, 22 Mar 2016 10:14:39 +0800
Message-ID: <56F0AA8F.3050602@rock-chips.com>
References: <1458552518-25527-1-git-send-email-ykk@rock-chips.com>
 <1511371.I0NIYzh3kP@diego> <56EFE66A.8020404@rock-chips.com>
 <1867694.1mDULrSexE@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1867694.1mDULrSexE@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 03/22/2016 08:42 AM, Heiko Stuebner wrote:
> Hi Yakir,
>
> Am Montag, 21. M=E4rz 2016, 20:17:46 schrieb Yakir Yang:
>> On 03/21/2016 07:29 PM, Heiko St=FCbner wrote:
>>> Am Montag, 21. M=E4rz 2016, 17:28:38 schrieb Yakir Yang:
>>>> This patch set would add the RGA direct rendering based 2d graphic=
s
>>>> acceleration module.
>>> very cool to see that.
>> ;)
>>
>>>> This patch set is based on git repository below:
>>>> git://people.freedesktop.org/~airlied/linux drm-next
>>>> commit id: 568d7c764ae01f3706085ac8f0d8a8ac7e826bd7
>>>>
>>>> And the RGA driver is based on Exynos G2D driver, it only manages =
the
>>>> command lists received from user, so user should make the command =
list
>>>> to data and registers needed by operation to use.
>>>>
>>>> I have prepared an userspace demo application for testing:
>>>> 	https://github.com/yakir-Yang/libdrm-rockchip
>>>>
>>>> That is a rockchip libdrm library, and I have write a simple test =
case
>>>> "rockchip_rga_test" that would test the below RGA features:
>>>> - solid
>>>> - copy
>>>> - rotation
>>>> - flip
>>>> - window clip
>>>> - dithering
>>> Did you submit your libdrm changes as well?
>>>
>>> Userspace-interfaces need to be stable so the other side must also =
get
>>> accepted - even before the kernel change if I remember correctly.
>> Got it, and I just saw exynos_fimg2d already landed at mainline libd=
rm.
>> But I don't find the way to submit patches to libdrm, would you like
>> share some helps here ;)
> Looking at the libdrm sources on cgit.freedesktop.org, I did not find=
 any
> specific manual on submitting patches.
>
> But looking at the dri-list archive, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org =
is the
> right list and looking at the libdrm history it looks like Emil Velik=
ov
> <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> seems to be doing maintenance-stuff in lib=
drm.
> And as a 3rd recipient, please also include the linux-rockchip list.
Great, thanks, I would improve my libdrm changes, and submit them soon =
:)

- Yakir
> @Emil, please shout if I read that wrong :-)
>
>
> Hope that helps
> Heiko
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
