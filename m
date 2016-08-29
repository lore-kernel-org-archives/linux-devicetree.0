From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [BISECTED REGRESSION] v4.8-rc: DT/OCTEON driver probing broken
Date: Mon, 29 Aug 2016 13:41:34 -0500
Message-ID: <CAL_JsqKXzBmDF164HMjdXEFRAsVWL=U6qpJhsHeiqmrFRbeVdA@mail.gmail.com>
References: <20160816150056.GD18731@ak-desktop.emea.nsn-net.net> <CAL_JsqK-+MOw1VCb57DXdEBwaVZP+KypapXJb7Mw3unD4A0-GQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqK-+MOw1VCb57DXdEBwaVZP+KypapXJb7Mw3unD4A0-GQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaro Koskinen <aaro.koskinen-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thorsten Leemhuis <regressions-rCxcAJFjeRkk+I/owrrOrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 29, 2016 at 12:36 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Aug 16, 2016 at 10:00 AM, Aaro Koskinen <aaro.koskinen-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org> wrote:
>> Hi,
>>
>> Commit 44a7185c2ae6 ("of/platform: Add common method to populate default
>> bus") added new arch_initcall of_platform_default_populate_init() that
>> will be called before device_initcall octeon_publish_devices(). Now the
>> of_platform_bus_probe() called in octeon_publish_devices() is apparently
>> doing nothing:
>>
>> [   52.331353] calling  octeon_publish_devices+0x0/0x14 @ 1
>> [   52.331358] OF: of_platform_bus_probe()
>> [   52.331362] OF:  starting at: /
>> [   52.331378] OF: of_platform_bus_create() - skipping /soc@0, already populated
>> [   52.331394] initcall octeon_publish_devices+0x0/0x14 returned 0 after 29 usecs
>>
>> This also means that USB etc. won't get probed.
>>
>> Any ideas what would be the proper fix for this? Changing
>> octeon_publish_devices() to arch_initcall seems to work but that may be
>> a bit hackish... Also, there might be also other MIPS boards affected
>> (arch/mips/netlogic/xlp/dt.c, arch/mips/mti-malta/malta-dt.c).
>
> Can you try reverting this hunk. I don't think it should be needed and
> it is preventing /soc@0 children from being probed. If things still
> don't work, then it should purely be a probe ordering problem. I have
> some better fixes in mind, but not for 4.8. So if this doesn't work,
> then the same fix as PPC is fine.

Nevermind, reverting this hunk is not enough.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
