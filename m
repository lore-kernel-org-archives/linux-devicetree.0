From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] of/fdt: only store the device node basename in full_name
Date: Wed, 26 Jul 2017 09:10:49 -0500
Message-ID: <CAL_JsqL1+YqH-rGCHvYFANJBaZL9t1bcwOnPUntGAbaJWfmVrg@mail.gmail.com>
References: <20170725214427.25768-1-robh@kernel.org> <20170725214427.25768-5-robh@kernel.org>
 <87r2x35w9v.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87r2x35w9v.fsf-W0DJWXSxmBNbyGPkN3NxC2scP1bn1w/D@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 26, 2017 at 5:26 AM, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> wrote:
> Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
>
>> With dependencies on a statically allocated full path name converted to
>> use %pOF format specifier, we can store just the basename of node, and
>> the unflattening of the FDT can be simplified.
>>
>> This commit will affect the remaining users of full_name. After
>> analyzing these users, the remaining cases should only change some print
>> messages. The main users of full_name are providing a name for struct
>> resource. The resource names shouldn't be important other than providing
>> /proc/iomem names.
>>
>> We no longer distinguish between pre and post 0x10 dtb formats as either
>> a full path or basename will work. However, less than 0x10 formats have
>> been broken since the conversion to use libfdt (and no one has cared).
>
> For the record - yes we did care. It broke booting with old versions of
> kexec, and it was a royal P.I.T.# to debug :D

Sorry, I forgot about that one. I'll drop the statement. I had gone
back and looked and only found the issue on mpc8323 booting[1] which
was an issue with libfdt having more checks on the fdt. I proposed
some fixes, but never heard back on that.

Rob

[1] https://lkml.org/lkml/2015/6/10/820
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
