From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] MIPS: BMIPS: dts: remove unsupported entry for bcm7362
Date: Fri, 08 May 2015 17:32:44 +0200
Message-ID: <10776752.kPn2ooXz5Z@wuerfel>
References: <1431089958-2626-1-git-send-email-jaedon.shin@gmail.com> <1431089958-2626-2-git-send-email-jaedon.shin@gmail.com> <CAJiQ=7CQshXhGJ7ftWQSu_UxgKVaRprZPEPXWNP6ci_1bLrJrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJiQ=7CQshXhGJ7ftWQSu_UxgKVaRprZPEPXWNP6ci_1bLrJrw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 08 May 2015 07:40:44 Kevin Cernekee wrote:
> On Fri, May 8, 2015 at 5:59 AM, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Remove unsupported memory entry for the bcm7362 platform. The BMIPS4380
> > processor only supports ZONE_NORMAL is not available for HIGHMEM.
> >
> > Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  arch/mips/boot/dts/brcm/bcm97362svmb.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/boot/dts/brcm/bcm97362svmb.dts b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
> > index b7b88e5dc9e7..ab8b01fa7dcf 100644
> > --- a/arch/mips/boot/dts/brcm/bcm97362svmb.dts
> > +++ b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
> > @@ -8,7 +8,7 @@
> >
> >         memory@0 {
> >                 device_type = "memory";
> > -               reg = <0x00000000 0x10000000>, <0x20000000 0x30000000>;
> > +               reg = <0x00000000 0x10000000>;
> 
> Hmm, this is more of a kernel limitation than a hardware limitation,
> though.  The board physically has 1GB of memory, right?  It is best if
> the DT entry reflects the actual hardware configuration.
> 
> The Broadcom kernels enable the CPU's special "XKS01" feature to put
> 1GB of memory in ZONE_NORMAL:
> 
> https://github.com/Broadcom/stblinux-3.3/tree/master/linux
> 

What exactly is the kernel limitation here?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
