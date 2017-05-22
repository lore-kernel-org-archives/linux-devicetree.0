From: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/21] MIPS memblock: Remove bootmem code and switch to
 NO_BOOTMEM
Date: Mon, 22 May 2017 15:20:44 +0200
Message-ID: <f14c7a41-ae2d-b19d-fb86-d6e9c9c53949@nokia.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
 <be0b6614-708d-a32a-029d-7e606a673e5b@imgtec.com>
 <20170522102643.GA17763@mobilestation>
 <ef3d7a8c-2a73-2082-0d64-bdb4f95df204@gentoo.org>
 <20170522130348.GA20910@mobilestation>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170522130348.GA20910@mobilestation>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joshua Kinard <kumba-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Marcin Nowakowski <marcin.nowakowski-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, rabinv-VrBV9hrLPhE@public.gmane.org, matt.redfearn-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Serge,

On 22/05/17 15:03, Serge Semin wrote:
>> I have an SGI Onyx2 and just recently acquired a working SGI Origin 200.  The
>> Onyx2 has NUMA issues yet to be hunted down, but I got ~3 days uptime out of
>> the Origin 200 running compiles before powering it down.  Mainline needs 2-3
>> small patches to make IP27 workable, last I tested.
>>
>> I'd have to look at the IP27 code again and see if I can make sense of what
>> it's doing.  I think it dealt with either setting up memory for an initrd
>> (which I haven't used in over a decade), or it's for the NUMA stuff to discover
>> all memory on each node.
>>
>> -- 
>> Joshua Kinard
>> Gentoo/MIPS
>> kumba-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org
>> 6144R/F5C6C943 2015-04-27
>> 177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943
>>
>> "The past tempts us, the present confuses us, the future frightens us.  And our
>> lives slip away, moment by moment, lost in that vast, terrible in-between."
>>
>> --Emperor Turhan, Centauri Republic
> It's great to hear of your willingness to help. Since both Loonson64 and SGI IP27
> problematic architecture-specific code will be appropriately altered, I'll publish
> the fixed general MIPS-memblock patchset within two months. I'll also try to
> involve Ralf in it when I'm ready, so to make sure all my alterations are made
> within kernel arch-code coding style. While I'm working on it, you can still use
> the current patchset for some limited tests.

Please Cc me in this case, I should be able to test on Octeon MIPS64 platform.

-- 
Best regards,
Alexander Sverdlin.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
