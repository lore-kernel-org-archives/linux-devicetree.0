From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 08/08] ARM: shmobile: Remove CMT renesas,channels-mask from DTS
Date: Fri, 26 Jun 2015 00:56 +0300
Message-ID: <1618432.qSqOq2tHsD@avalon>
References: <20150621080903.10187.20998.sendpatchset@little-apple> <8019375.XSP9R0ZLbm@avalon> <CANqRtoRcv4VpF3vAgYKTOL1FyYURHx13-5-L9fH1HrJ-QvPymQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CANqRtoRcv4VpF3vAgYKTOL1FyYURHx13-5-L9fH1HrJ-QvPymQ@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, SH-Linux <linux-sh@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Simon Horman <horms+renesas@verge.net.au>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Magnus,

On Tuesday 23 June 2015 11:46:45 Magnus Damm wrote:
> On Tue, Jun 23, 2015 at 7:40 AM, Laurent Pinchart wrote:
> > On Sunday 21 June 2015 17:10:33 Magnus Damm wrote:
> >> From: Magnus Damm <damm+renesas@opensource.se>
> >> 
> >> Update the DTS to remove the now deprecated "renesas,channels-mask"
> >> property.
> >> 
> >> The channel information is now kept in the device driver and can easily
> >> be determined based on the compat string.
> > 
> > Unless I've missed something (which is entirely possibly given the late
> > hour), the channel mask is only stored in the driver for the Gen2 CMT
> > instances.
>
> The case for sh73a0 and r8a7740 is also covered by some of the earlier
> patches in this series.

My bad, I've missed that. We should be good then.

> So unless I'm mistaken the series should cover all current in-tree CMT DT
> users that we have. I'm not aware of any out-of-tree users.
> 
> You are right that there are more unused compat strings documented, so
> those will break. I would be tempted in phasing those out somehow.
> Also, I did not spend much time cleaning up the non R-Car Gen2 cases,
> so in general that needs some love.

-- 
Regards,

Laurent Pinchart

