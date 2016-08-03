From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dts doubts
Date: Wed, 3 Aug 2016 13:10:48 -0700
Message-ID: <57A24FC8.7020602@gmail.com>
References: <CANMsd01Od5J2EX7w-YFXmE+cmpyfq+vs88WeKiO8K0-t=FTmTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANMsd01Od5J2EX7w-YFXmE+cmpyfq+vs88WeKiO8K0-t=FTmTQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryan <ryanphilips19-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/28/16 10:57, Ryan wrote:
> Hello,
> 
> I have certain doubts on dts files. If anyone help me clarify it would
> be helpful.
> 
> 
> Suppose, the following dts file entry is already done in the
> base/parent/included dts file:
> 
> fimc_is_spi_pin1: fimc-is-spi-pin1 {
> samsung,pins = "gpf1-7", "gpf1-6", "gpf1-5", "gpf1-4";
> samsung,pin-function = <2>;
> samsung,pin-pud = <0>;
> samsung,pin-drv = <0>;
> };
> 
> Can i modify the parameters in the child dts file. Say i want to

Yes, you can.  This is a common pattern, for example where a .dtsi file sets

   status = "disabled";

then the including .dts file later changes status to "okay" or "ok".

> modify "samsung,pin-function" or add new parameters to the above
> declaration.
> 
> Thanks for your help.
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
