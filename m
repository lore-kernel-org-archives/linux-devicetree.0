From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFCv3 1/4] docs: dts: Added documentation for Xilinx Zynq
 Reset Controller bindings.
Date: Tue, 04 Aug 2015 17:10:17 +0200
Message-ID: <1438701017.3793.45.camel@pengutronix.de>
References: <1438305237-18497-1-git-send-email-moritz.fischer@ettus.com>
	 <1438305237-18497-2-git-send-email-moritz.fischer@ettus.com>
	 <1438675772.3793.18.camel@pengutronix.de>
	 <CAAtXAHeauiD5smAqMbheJWuv4BT-2YqJWOSBjYPq900icpT1Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHeauiD5smAqMbheJWuv4BT-2YqJWOSBjYPq900icpT1Rg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, Michal Simek <michal.simek@xilinx.com>, =?ISO-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Moritz,

Am Dienstag, den 04.08.2015, 08:05 -0700 schrieb Moritz Fischer:
> Hi Philip,
> 
> On Tue, Aug 4, 2015 at 1:09 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > Hi Moritz,
> >
> > Am Donnerstag, den 30.07.2015, 18:13 -0700 schrieb Moritz Fischer:
[...]
> >> +Required properties:
> >> +- compatible: "xlnx,zynq-reset"
> >> +- reg: SLCR offset and size taken via syscon <0x200 0x48>
> >> +- syscon: <&slcr>
> >> +  This should be a phandle to the Zynq's SLCR register.
> >
> >                                                  ^ register singular?
> Do you want me to resend the entire set, or are you cool with just git
> amending the 's' for registers?

Amended and applied, thanks.

regards
Philipp
