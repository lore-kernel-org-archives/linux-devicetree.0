From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH] arm64: dts: fsl: imx8mq: enable the thermal management
 unit (TMU)
Date: Tue, 12 Mar 2019 17:31:19 -0700
Message-ID: <CAHQ1cqHS6Q9naaYO8etfVC6ra0Km8a3Hs-4FTVdjjS5Ciwjpbw@mail.gmail.com>
References: <20190311213124.29325-1-angus@akkea.ca> <CAHQ1cqEHr1mB2EH3-fJPrYa+nkcWPPjmCTjSt-XsDnJp-SCf+w@mail.gmail.com>
 <9f25fb1a0acb35539dcd802502c49058@www.akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9f25fb1a0acb35539dcd802502c49058@www.akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Angus Ainslie <angus@akkea.ca>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, daniel.baluta@nxp.com, agx@sigxcpu.org, dl-linux-imx <linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 12, 2019 at 1:19 PM Angus Ainslie <angus@akkea.ca> wrote:
>
> Hi Andrey,
>
> On 2019-03-11 19:35, Andrey Smirnov wrote:
> > On Mon, Mar 11, 2019 at 2:35 PM Angus Ainslie (Purism) <angus@akkea.ca>
> > wrote:
> >>
> >> These are the TMU nodes from the NXP vendor kernel
> >>
> >
> > Hey Angus,
> >
> > TMU block supports multiple thermal zones and vendor kernel doesn't
> > really account for that (see below). Latest version of the driver in
> > thermal tree now actually supports that feature (mulit-sensor), so I
> > think the code in DT should reflect that as well. I recently submitted
> > a series adding HWMON integration for TMU
> > (https://lore.kernel.org/lkml/20190222200508.26325-1-andrew.smirnov@gmail.com/T/#u)
>
> I tried applying those to linux-next. They don't apply very cleanly
> there so I gave up.
>
> > and this is my take on this patch:
> >
> > https://github.com/ndreys/linux/commit/09931e3d60af0a74377307b433db97da1be31570
> >
> > All of the code there is up for grabs, if you feel like using it.
> >
>
> I followed that and I have a version that works with linux-next that
> does not include the GPU
> and VPU parts.
>
> I also tested a version with the GPU and VPU parts and it "works" but
> creates 2 useless
> paths in /sys/class/thermal .
>
> Should I wait for your changes to get into linux-next or resubmit a
> version that works with the current one ?
>

You don't really need my changes for multi sensor support, only the
patch Fabio pointed to. You can send the patch sans GPU and VPU nodes
to get it in sooner or you can wait until multi-sensor support patch
trickles down to get all in in a single patch. All options are fine by
me, so it's up to you and Shawn I'd say.

Thanks,
Andrey Smirnov
