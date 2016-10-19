From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC V2 PATCH 10/12] arm64: dts: msm8994 issolate non standard bootloader/LK entries
Date: Wed, 19 Oct 2016 16:56:20 +0200
Message-ID: <4976066.k14mpQt0HJ@wuerfel>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com> <2149904.D2eaQZN3bA@wuerfel> <17447be1-4357-0eca-a242-69576d3e2799@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <17447be1-4357-0eca-a242-69576d3e2799-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, git-LJ92rlH3Dns@public.gmane.org, jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, October 12, 2016 5:59:41 PM CEST Jeremy McNicoll wrote:
> On 2016-10-12 3:39 AM, Arnd Bergmann wrote:
> > On Tuesday, October 11, 2016 7:41:22 PM CEST Rob Herring wrote:
> >> On Sat, Oct 1, 2016 at 9:38 PM, Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >>> These non standard DT entries need to be cast aside as to not
> >>> pollute the main device tree bindings.  Without these essential
> >>> DT items the bootloader/LK will not pass control over to the kernel
> >>> and thus never boot.
> >>
> >> I discussed this with Stephen recently. I'm okay with leaving these on
> >> boards that have no chance of getting updated bootloaders to use the
> >> compatible string instead. Having to use dtbTool is far worse than a
> >> couple of extra properties IMO. I reserve the right to complain if new
> >> stuff continues to use these though.
> >>
> >>> Signed-off-by: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>> ---
> >>>  .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |  1 -
> >>>  arch/arm64/boot/dts/qcom/msm8994.dtsi              |  3 +--
> >>>  .../boot/dts/qcom/nexus6p_bootloader_bits.dtsi     | 24 ++++++++++++++++++++++
> >>
> >> Just put this into the board file rather than yet another include.
> >
> > The suggestion that I had was to have two .dts files: the normal
> > one without these properties, and another .dts file including the
> > first but adding these three for compatibility with the legacy
> > bootloaders.
> >
> 
(sorry for the late reply, I thought I had replied already but
couldn't find that in the archives when I saw I still had this
reply open)

> So I did it backwards from what you had suggested?
> Based on my discussion with, (cant seem to recall) my understanding
> was that we simply wanted to have these 3 bootloader specific entries
> in another file.

Right

What I would like to see here is two separate .dtb files, one
with the hack and one without it, so we have a migration path
for the machines that eventually get a boot loader with proper
DT support.

> > That way we could have a 'clean' .dtb file once the bootloaders
> > get fixed, and can name the other one appropriately to discourage
> > copying the method for new machines.
> >
> 
> Did you miss the part about Ebola or Bubonic plague ?

I did, which means others are likely to miss it as well ;-)

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
