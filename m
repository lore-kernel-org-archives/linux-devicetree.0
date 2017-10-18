From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague
 (26 Oct 2017)
Date: Wed, 18 Oct 2017 12:11:57 +0200
Message-ID: <20171018121157.059417a8@windsurf.home>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
        <20171017114823.58476908@bbrezillon>
        <CACxGe6tPQxwzN14TZtgNhw7OOuePLJxODrn-_b4gMDGzAFEf1Q@mail.gmail.com>
        <1508257276.74236.38.camel@freebsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508257276.74236.38.camel-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, 17 Oct 2017 10:21:16 -0600, Ian Lepore wrote:

> I've run into the same thing in FreeBSD.  We use bindings and dts
> files, exacted periodically from the linux tree and imported into ours,
> for all modern arm boards/systems.  Several times I've created drivers
> for small things like i2c RTC chips that aren't supported currently by
> linux, and it's not clear to me that it's even possible to submit
> bindings and dts for them back upstream without also submitting a linux
> driver that uses them (which of course I'm not in a position to do).

You don't have to submit a driver to submit a binding.

Examples of bindings that are not supported by any upstream driver:

  Documentation/devicetree/bindings/net/wireless/esp,esp8089.txt
  Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
  Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt

and there are probably more.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
