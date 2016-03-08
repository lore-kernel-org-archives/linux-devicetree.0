From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: Update to upstream version 53bf130b1cdd
Date: Tue, 8 Mar 2016 08:22:42 -0800
Message-ID: <CAOesGMjkk-Ow=VnVhgJk8cERre_Jm7Q14wmLAsVb0GufyFBF+g@mail.gmail.com>
References: <1457104420-18350-1-git-send-email-robh@kernel.org>
	<CAOesGMhCMMf_3g-pT4G_fB9NHx1=TLwU_qKK+UjO_GJYMjSEAA@mail.gmail.com>
	<CAL_JsqKpZ7FgtH6zyanbnrq3u76RK23s1TQhvnaH_by_NtktCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKpZ7FgtH6zyanbnrq3u76RK23s1TQhvnaH_by_NtktCA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Mar 7, 2016 at 11:37 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Mar 7, 2016 at 5:10 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>> Hi,
>>
>> On Fri, Mar 4, 2016 at 7:13 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> Sync to upstream dtc commit 53bf130b1cdd ("libfdt: simplify
>>> fdt_node_check_compatible()"). This adds the following commits from
>>> upstream:
>>>
>>> 53bf130 libfdt: simplify fdt_node_check_compatible()
>>> c9d9121 Warn on node name unit-address presence/absence mismatch
>>> 2e53f9d Catch unsigned 32bit overflow when parsing flattened device tree offsets
>>>
>>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> ---
>>> As usual, this is just an automated copy of upstream dtc into the kernel
>>> tree. The changeset is small enough that I have left it here.
>>>
>>> The main reason for this sync is to pick-up the new unit-address
>>> warnings.
>>
>> This spews a crazy amount of warnings on a multi_v7_defconfig build.
>
> Shocking, huh? And I've got more checks in the works. :)
>
>> I'd prefer to see most of those warnings fixed _before_ we introduce
>> it by default. Otherwise we just add a huge amount of noise that will
>> hide any real valid warnings that are now brought up.
>
> How do you propose to do that? If it is not enabled, then no one will
> see them nor care. I don't intend to fix everyone's stuff myself.

Right, but pushing a change on everyone that makes the build
near-unusable as a tool to see if you're introducing a new error is
also not a good way to do it. However:

> We could hide the check behind COMPILE_TEST perhaps.

Putting it behind an option sounds like a suitable approach. Would it
be possible to plumb in under "make C=1" / "make C=2" instead? That's
closer in meaning to what you're doing here than COMPILE_TEST, which
is more about turning on drivers that might not make sense on your
platform to get compile coverage.

This would make people aware of the tool, give them an easy way to run
it to do the cleanups. Nag maintainers when they post new code without
having paid attention to the old sources/cleanup, and with some amount
of time most of it might be fixed.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
