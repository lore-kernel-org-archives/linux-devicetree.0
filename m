From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v5 00/39] i.MX Media Driver
Date: Sun, 12 Mar 2017 12:44:24 -0700
Message-ID: <58b30bca-20ca-d4bd-7b86-04a4b8e71935@gmail.com>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <20170312175118.GP21222@n2100.armlinux.org.uk>
 <191ef88d-2925-2264-6c77-46647394fc72@gmail.com>
 <20170312192932.GQ21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170312192932.GQ21222@n2100.armlinux.org.uk>
Sender: linux-media-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengut
List-Id: devicetree@vger.kernel.org



On 03/12/2017 12:29 PM, Russell King - ARM Linux wrote:
> On Sun, Mar 12, 2017 at 12:21:45PM -0700, Steve Longerbeam wrote:
>> There's actually nothing preventing userland from disabling a link
>> multiple times, and imx_media_link_notify() complies, and so
>> csi_s_power(OFF) gets called multiple times, and so that WARN_ON()
>> in there is silly, I borrowed this from other MC driver examples,
>> but it makes no sense to me, I'll remove it and prevent the power
>> count from going negative.
>
> Hmm.  So what happens if one of the CSI's links is enabled, and we
> disable a different link from the CSI several times?  Doesn't that
> mean the power count will go to zero despite there being an enabled
> link?

Yes, the CSI will be powered off even if it still has an enabled link.
But one of its other links has been disabled, meaning the pipeline as
a whole is disabled. So I think it makes sense to power down the CSI,
the pipeline isn't usable at that point.

And remember that the CSI does not allow both output pads to be enabled
at the same time. If that were so then indeed there would be a problem,
because it would mean there is another active pipeline that requires the
CSI being powered on, but that's not the case.

I think this is consistent with the other entities as well, but I will
double check.

Steve
