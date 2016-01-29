From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 00/13] dtb: amd: Miscelleneous Updates for AMD Seattle DTS
Date: Thu, 28 Jan 2016 18:43:52 -0800
Message-ID: <CAOesGMhG-dy9CJ+hLr_OV73BnKo-mstDjfDyhQhjvUnZ8pCAYA@mail.gmail.com>
References: <1453929121-12171-1-git-send-email-Suravee.Suthikulpanit@amd.com>
	<CAOesGMgRC2vTVdmY6kKYonM1JkWD=-3k_EQ4hGvyrm-vNZczrQ@mail.gmail.com>
	<56AA9436.60800@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56AA9436.60800-5C7GfCeVMHo@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suravee Suthikulanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org, Thomas Lendacky <thomas.lendacky-5C7GfCeVMHo@public.gmane.org>, leo.duran-5C7GfCeVMHo@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 28, 2016 at 2:20 PM, Suravee Suthikulanit
<suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org> wrote:
> Hi Olof,
>
> On 1/28/2016 3:39 PM, Olof Johansson wrote:
>>
>> Hi Suravee,
>>
>> On Wed, Jan 27, 2016 at 1:11 PM, Suravee Suthikulpanit
>> <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org> wrote:
>>>
>>> From: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
>>>
>>> This patch series contains several updates for the AMD Seattle SOC DTS
>>> files.
>>> It also adds new board files for newer Overdrive and Linaro 96boards
>>> (Husky)
>>> platforms.
>>
>>
>> My Overdrive comes with DT provided by firmware, so there's no need to
>> have a in-kernel-tree DT source.
>
>
> You are correct that the FW comes with DT, and in typical case, you wouldn't
> need this.
>
>> Are you aware of other reasons to have it here? I just foresee
>> divergence and conflicts between the two. It was quite obvious before
>> this update when the FW-provided DT was a lot more complete than what
>> we had in the kernel tree.
>
>
> However, there are still new/updated drivers being developed, and sometimes
> requires new/changes in DT binding. So, the DT that comes with the FW can
> get out of date, and will lack the support for new drivers.

Note that it's expected that the driver will cope with the old DT
contents, i.e. it needs to go with defaults that made sense before the
binding was updated.

It, however, doesn't have to enable new features. In other words,
booting with an old DT needs to continue working. You can't require a
user to update DT to avoid getting driver breakage.

(The opposite is not enforced: Booting with a DT that is newer than
the kernel isn't guaranteed to always work).

> Certain version of the FW allows overriding the DT that comes with the FW.
> So, we are providing the in-kernel DT to allow developers to provide the
> updated device tree for newer kernels. This patch series is bringing the
> in-kernel DT closer to what the latest FW is providing to avoid potential
> conflicts.

I do appreciate keeping the kernel one up to date with what firmware
provides if it's truly needed, but I'd even more prefer that it
wasn't. After all, it's how the ACPI-based booting works (no
overriding table provided with the kernel), so it's a model you should
already be somewhat familiar with. :)

I'm not doing a hard NAK on this, but I would like to get a bit more
understanding of why it's considered needed.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
