From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: a case for a common efuse API?
Date: Mon, 21 Jul 2014 09:51:58 -0600
Message-ID: <53CD371E.6070600@wwwdotorg.org>
References: <53BC4DD7.20906@codeaurora.org> <20140709114907.GI23218@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140709114907.GI23218-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/09/2014 05:49 AM, Peter De Schrijver wrote:
> On Tue, Jul 08, 2014 at 10:00:23PM +0200, Stephen Boyd wrote:
>>
>> I added Tegra folks because I see that on Tegra this hardware is exposed
>> via an SoC specific API, tegra_fuse_readl(), and an associated driver in
>> drivers/misc/fuse/tegra/. Unfortunately I don't see any users of the API
>> outside of the speedo code in the same directory and the sysfs bin
>> attribute that may or may not be in use by some userspace code.
>>
> 
> The SATA driver by Mikko Perttunen uses it. The driver hasn't been merged
> though. There's some more upcoming work which makes use of it.
> I don't think we can standardize much of an API for this. The data is
> SoC specific, so the user will always need to have some SoC specific
> knowledge on how to use it.

I think we could have a generic "read fuse X" API. The only thing that'd
be chip-specific is the value of "X". That could be hard-coded into the
client drivers, or perhaps represented in a DT propery e.g.
#fuse-cells/xxx-fuses. That said, I wonder what benefit we'd get from
such a common API. I suppose if any IP block was to be re-used in
completely different SoC families, it'd isolate the driver from having
to call different functions to read fuses on different SoC families, but
that doesn't seem to happen in practice yet, and the issue could be
solved later if needed.

It'd certainly be hard to create any higher-layer semantic API here,
since different SoCs store completely different sets of data in fuses,
so there would be little point in a common "read the MAC address from
the fuses" API, since that data wouldn't exist in fuses on many SoCs.

> In some cases we need it very early (eg. to
> determine the correct Tegra20 revision). On Tegra20 we can't use the CPU
> to read the fuses due to a hw bug, we have to use DMA, which means the
> transaction becomes blocking and could fail due to lack of resources.

Yes, any such API would become "least common-denominator" or similar;
i.e. any restriction imposed by any SoC would then affect how the API
works on any other SoC.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
