From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: CPU revision IDs
Date: Fri, 13 Jun 2014 09:14:45 -0400
Message-ID: <CAKON4Ox+tCgiu6N988ds7ED2KbECw=60Y6BRqV_2UcM+vshw4Q@mail.gmail.com>
References: <CAKON4OwNULPeQFHwRhRfri86yexMvvKfrw_dthim4_oPWvMD3g@mail.gmail.com>
	<4285095.l6sVUI20tQ@wuerfel>
	<CAKON4OxzJ7UoKnMgf+sckksjG-rx8NG1tUvPj2qaHNsda0j3jQ@mail.gmail.com>
	<5045739.TmqqIG2CDG@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5045739.TmqqIG2CDG@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 13, 2014 at 9:08 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 13 June 2014 09:05:14 jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> I was adding the CPU revision ID to the top level compatible string,
>> nothing specific to the device.  By knowing the CPU revision I know
>> which errata to apply.
>>
>> If you patch the device strings, then you have to maintain knowledge
>> of which devices are broken in two places -- the device driver and the
>> machine file where you are patching the strings.
>
> IMHO, the driver only has to know what device versions exist, it
> shouldn't need to know which soc has which version of the device.
>
> Can you describe which kind of quirk you are looking at in the driver,
> and how common it is?

Allwinner wired the volume control for their on-chip codec up
backwards on the A revsion of the the A10 chip. In later revisions is
it fixed to work in the right direction.

I was wanting to add code like this to the device driver...

if (of_machine_is_compatible("allwinner,sun7i-a20a")) {
      fix bug
}

Another solution would be for me to detect the chip revision in the
init code of the driver and remember it.

-- 
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
