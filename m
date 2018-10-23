Return-Path: <SRS0=sPCw=ND=gmail.com=pku.leo@kernel.org>
MIME-Version: 1.0
References: <HE1PR0402MB3323967BD6C0E11C738BFF38F1F40@HE1PR0402MB3323.eurprd04.prod.outlook.com>
 <20181022082906.GE7068@kroah.com> <HE1PR0402MB3323E108AF8810DEC38B7691F1F40@HE1PR0402MB3323.eurprd04.prod.outlook.com>
 <20181022103426.GA4546@kroah.com>
In-Reply-To: <20181022103426.GA4546@kroah.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 23 Oct 2018 14:10:06 -0500
Message-ID: <CADRPPNQyxKpz8QY0myVOz9+sA-aAnwJptcaxxxBnXUskT=f6Lg@mail.gmail.com>
Subject: Re: using interrupt controller dt-bindings macros in Non GPL dts files
Content-Type: text/plain; charset="UTF-8"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: pankaj.bansal@nxp.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, swarren@nvidia.com, geert+renesas@glider.be, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, V.Sethi@nxp.com, udit.kumar@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Mon, Oct 22, 2018 at 5:35 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Oct 22, 2018 at 09:18:02AM +0000, Pankaj Bansal wrote:
> > 2. Would it be possible for the copyright owners of these header files
> > to make these files dual licensed, so that we are able to use these
> > files in our dts/dtsi files?
>
> You are going to have to deal with the legal departments of the
> companies that own those copyrights.  Again, talk to your legal
> department about how that would even work, or if they even wish for you
> to be asking people and companies to do that.

Right, we should work with the author/contributor of these two files.

Hi Stephen and Geert,

Are you ok with relicensing these two files with (GPL-2.0 OR MIT)?
Given that many dts files in arm/arm64 are dual licensed with GPL and
MIT/X11/BSD, it makes more sense that these header files are dual
licensed with a permissive license too.

Regards,
Leo
