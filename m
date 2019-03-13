From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 1/3] arm64: dts: fsl: librem5: Add a device tree for the
 Librem5 devkit
Date: Wed, 13 Mar 2019 18:57:22 +0100
Message-ID: <20190313175722.GA2525@bogon.m.sigxcpu.org>
References: <20190311234655.30357-1-angus@akkea.ca>
 <20190311234655.30357-2-angus@akkea.ca>
 <20190312175935.GA2487@bogon.m.sigxcpu.org>
 <6f0337062d6652a4f05062b33f3393bb@www.akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6f0337062d6652a4f05062b33f3393bb@www.akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Angus Ainslie <angus@akkea.ca>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de, Lucas Stach <l.stach@pengutronix.de>, abel.vesa@nxp.com, daniel.baluta@nxp.com, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,
On Tue, Mar 12, 2019 at 11:59:10AM -0700, Angus Ainslie wrote:
> On 2019-03-12 10:59, Guido Günther wrote:
> > Hi,
> > On Mon, Mar 11, 2019 at 04:46:53PM -0700, Angus Ainslie (Purism) wrote:
> > > This is the development kit for the Librem 5. The current level of
> > > support
> > > yields a working console and is able to boot userspace from the
> > > network
> > > or eMMC.
> > > 
> > > Additional subsystems that are active :
> > > 
> > > - Both USB ports
> > > - SD card socket
> > > - WWAN modem
> > 
> > Why not add the LCD backlight and the touch controller as well?
> 
> I planned to leave those out until we have the display subsystem working on
> mainline.

I wouldn't leave out anything with known working drivers.
Cheers,
 -- Guido
