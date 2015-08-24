From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5] dtb: Create a common home for cross-architecture dtsi files.
Date: Mon, 24 Aug 2015 15:58:29 -0500
Message-ID: <CAL_JsqKu6B1Q1q38GFSkdAT+Gxg3=87uk8ZOGPH96Eni0cer_g@mail.gmail.com>
References: <1438618000-1091-1-git-send-email-ian.campbell@citrix.com>
 <1439287646.9747.212.camel@citrix.com> <CAL_JsqKv2aOEM-U7JNZnaHomA6HFBSFhSLZ-zhp7c20s6gQBaQ@mail.gmail.com>
 <CAOesGMj46mvbdya1OQnZzL8VrxVwxAV3KoZZRtk3c0CTVx7d5w@mail.gmail.com>
 <CAL_Jsq+tUmRfvKE6vf+za6TsG_fhMWn5M2DDDLcCfkDt=KJGVg@mail.gmail.com> <CAOesGMigmaEviCDBAncomkq+uowr18B5FTOmOyBHsNz4p6F6Dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMigmaEviCDBAncomkq+uowr18B5FTOmOyBHsNz4p6F6Dw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kristina Martsenko <kristina.martsenko-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kbuild mailing list <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 23, 2015 at 6:52 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Sun, Aug 23, 2015 at 4:42 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Sun, Aug 23, 2015 at 6:13 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>>> On Fri, Aug 14, 2015 at 2:21 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> +arm-soc
>>>>
>>>> On Tue, Aug 11, 2015 at 5:07 AM, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org> wrote:
>>>>> On Mon, 2015-08-03 at 17:06 +0100, Ian Campbell wrote:
>>>>>> Commit 9ccd608070b6 ("arm64: dts: add device tree for ARM SMM-A53x2 on
>>>>>> LogicTile Express 20MG") added a new dts file to arch/arm64 which
>>>>>> included "../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi", i.e. a
>>>>>> .dtsi supplied by arch/arm.
>>>>>>
>>>>>> Unfortunately this causes some issues for the split device tree
>>>>>> repository[0], since things get moved around there. In that context
>>>>>> the new .dts ends up at src/arm64/arm/vexpress-v2f-1xv7-ca53x2.dts
>>>>>> while the include is at src/arm/vexpress-v2m-rs1.dtsi.
>>>>>
>>>>> Hi Grant,
>>>>>
>>>>> Do you think there is any chance of getting this into 4.2-rc$NEXT or shall
>>>>> we wait until 4.3? I'm assuming this should go via the DT tree, but maybe
>>>>> it should go via an ARM tree?
>>>>
>>>> I was assuming this would go thru the arm-soc tree which is why I
>>>> acked it. It is getting a bit late for 4.2 at this point, but I guess
>>>> the standalone tree remains broken for these platforms until this is
>>>> done. Probably not such a big deal in grand scheme of things.
>>>
>>> I'm cc:d in the far tail of a thread, so I'll just comment here
>>> instead of further up:
>>>
>>> I'm not a fan at all of creating kernel/dts/<arch>/*, at least if
>>> there's expected to be contents in there.
>>>
>>> We don't have include/linux/asm-<arch>/ in the common tree either.
>>> Let's not create that for dts.
>>
>> I'd really like to move ALL dts files from arch/*. There's nothing
>> really tied to the architecture. They may happen to use some bindings
>> that only apply to an architecture, but fundamentally they don't
>> depend on the arch. Also, I'd like to be able to do "make all-dtbs"
>> and build every dtb in the tree.
>
> The main benefit of keeping it per architecture and platform is that
> it partitions the maintainer and review space a bit.

Except we have a fire hose and a bunch of dripping faucets.

> Right now it's not possible to do even per-arch "all-dtbs" since only
> the currently configured platforms will get their dtbs compiled.

I know. It's been on my todo list for a while. Having that per arch at
least would be an improvement. Having it arch independent would mean I
don't even need a cross-compiler (probably).

>> That said, I'm not crazy enough to propose this re-org in the kernel
>> tree, but would like to do that if/when we moved dts files out of the
>> kernel.
>
> I believe this is currently still quite firmly in the "if" stage. :(

There's some renewed discussion around it recently, but still no one
to step up and do it.

>>> So, while I'm all for a prefix-based sharing of DTSI files, I don't
>>> want them to go in a common kernel/dts directory.
>>>
>>> Besides sharing some snippets between arm and arm64, what else is
>>> expected to need to go into such a shared location today?
>>
>> Overlays. You easily have the same sharing of common boards. There are
>> also usecases of overlays on architectures that don't generally use DT
>> (x86).
>
> Ok, overlays might make sense if they can be made to work generically
> enough and not be tied to expectations of the base board platform.

That's the goal at least.

> Still, even then I don't see dts as a core kernel feature (kernel/*),
> lib/* might make more sense. And I don't want to see things like
> vexpress stuff in there.

How's it any different than vexpress board stuff under drivers/.

The original suggestion was under include/dt-bindings/. Not sure if
you saw or like that?

>> We could also see sharing between PPC and ARM on FSL networking parts,
>> but I've not heard if they actually have that problem.
>
> Yeah, there could potentially be some sharing between MIPS and
> ARM{,64} too, but I don't know if we'll actually see it done.

Yep, hard to say.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
