From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] MIPS: BMIPS: dts: remove unsupported entry for bcm7362
Date: Fri, 8 May 2015 09:40:03 -0700
Message-ID: <CAJiQ=7Ajkae60eKfzr=mjPDov=bzoq7jBVDdQhGO37G8GGKK3w@mail.gmail.com>
References: <1431089958-2626-1-git-send-email-jaedon.shin@gmail.com>
 <1431089958-2626-2-git-send-email-jaedon.shin@gmail.com> <CAJiQ=7CQshXhGJ7ftWQSu_UxgKVaRprZPEPXWNP6ci_1bLrJrw@mail.gmail.com>
 <10776752.kPn2ooXz5Z@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10776752.kPn2ooXz5Z@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 8, 2015 at 8:32 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 08 May 2015 07:40:44 Kevin Cernekee wrote:
>> On Fri, May 8, 2015 at 5:59 AM, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > Remove unsupported memory entry for the bcm7362 platform. The BMIPS4380
>> > processor only supports ZONE_NORMAL is not available for HIGHMEM.
>> >
>> > Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > ---
>> >  arch/mips/boot/dts/brcm/bcm97362svmb.dts | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/arch/mips/boot/dts/brcm/bcm97362svmb.dts b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
>> > index b7b88e5dc9e7..ab8b01fa7dcf 100644
>> > --- a/arch/mips/boot/dts/brcm/bcm97362svmb.dts
>> > +++ b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
>> > @@ -8,7 +8,7 @@
>> >
>> >         memory@0 {
>> >                 device_type = "memory";
>> > -               reg = <0x00000000 0x10000000>, <0x20000000 0x30000000>;
>> > +               reg = <0x00000000 0x10000000>;
>>
>> Hmm, this is more of a kernel limitation than a hardware limitation,
>> though.  The board physically has 1GB of memory, right?  It is best if
>> the DT entry reflects the actual hardware configuration.
>>
>> The Broadcom kernels enable the CPU's special "XKS01" feature to put
>> 1GB of memory in ZONE_NORMAL:
>>
>> https://github.com/Broadcom/stblinux-3.3/tree/master/linux
>>
>
> What exactly is the kernel limitation here?

If we can't enable HIGHMEM, e.g. because the MIPS CPU has D$ aliases,
then Linux is supposed to ignore any RAM above the highmem/lowmem
boundary.

There is code in paging_init() that tries to do this.  Several years
ago it used to work, but the last time I tried it (~Oct 2014) it was
broken due to some other changes in MIPS early memory init, so Linux
hangs on boot unless you take the excess RAM out of DT.  Jaedon may be
running into the same issue.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
