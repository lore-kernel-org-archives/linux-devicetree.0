From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [BISECTED REGRESSION] v4.8-rc: DT/OCTEON driver probing broken
Date: Mon, 29 Aug 2016 17:39:15 -0500
Message-ID: <CAL_Jsq+mmBH+HVLubj1_rQ0T60zfQj_Dbz41EVe7v_Mj_u2Vug@mail.gmail.com>
References: <20160816150056.GD18731@ak-desktop.emea.nsn-net.net>
 <0336fae0-1717-2f90-c221-6ef69f7024ee@leemhuis.info> <20160828122239.GA14316@raspberrypi.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160828122239.GA14316-FnsA7b+Nu9VnX4FghcBuy1lsiSbylPe+PBWPt36IahQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Thorsten Leemhuis <regressions-rCxcAJFjeRkk+I/owrrOrA@public.gmane.org>, Aaro Koskinen <aaro.koskinen-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 28, 2016 at 7:22 AM, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org> wrote:
> Hi,
>
> On Sun, Aug 28, 2016 at 12:34:06PM +0200, Thorsten Leemhuis wrote:
>> Lo! Kefeng, below report made it to the list of regression for 4.8, but
>> afaics nothing happened after the initial report. Is there maybe some
>> reason why it shouldn't be on the list of regressions at all? Or was the
>> problem discussed elsewhere? Or is it even fixed already? I noticed
>> https://git.kernel.org/torvalds/c/fc520f8b4f (of/platform: disable the
>> of_platform_default_populate_init() for all the ppc board), but that
>> change is PPC specific.
>
> There is a fix proposal here:
>
>         https://patchwork.linux-mips.org/patch/14041/
>
> There is still few other boards remaining that use of_platform_bus_probe()
> from device_initcall, but who knows, maybe they are not affected.
>
> arch/microblaze/kernel/platform.c

xlnx,compound is going to fail to probe. I'm adding this to the default.

> arch/mips/mti-malta/malta-dt.c

This should be fine. It does probe for "isa", but nothing in mainline
is using that. We can add it to the default when it does.

> arch/mips/netlogic/xlp/dt.c

Should be okay with default.

> arch/x86/platform/olpc/olpc_dt.c

This one needs fixing.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
