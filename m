From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: keystone: Enable CPU hotplug
Date: Tue, 5 Apr 2016 12:33:25 +0100
Message-ID: <20160405113325.GF19428@n2100.arm.linux.org.uk>
References: <1459794543-4822-1-git-send-email-j-keerthy@ti.com>
 <57031F5F.3020300@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57031F5F.3020300-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, vitalya-l0cyMroinI0@public.gmane.org, nm-l0cyMroinI0@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 04, 2016 at 07:13:51PM -0700, santosh shilimkar wrote:
> On 4/4/2016 11:29 AM, Keerthy wrote:
> >Series enables CPU hotplug for K2HK. CPU Hotplug tested on
> >K2HK-EVM.
> >
> >It is on top of 4.6-rc2.
> >
> >Keerthy (2):
> >   keystone: dts: add psci command definition
> >   ARM: configs: keystone: Add CPU Hotplug related options
> >
> Looks fine to me. Will add it to the 4.7 queue. Thanks !!

Just to note that this is required to get CPU hotplug working with
the TI keystone2 skern implementation, which is different to the
uboot psci code.

Now that I've been able to upgrade my board to a recent uboot and
skern, I can add this:

Tested-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>

Now... if we could get the damn CPU fan under control, I might be
able to stand leaving the board powered on for longer, instead of
reaching for the power plug at the earliest possibility!

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
