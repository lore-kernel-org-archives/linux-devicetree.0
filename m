From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v10 1/4] MAINTAINERS: add an entry for for arm64 imx
 devicetrees
Date: Mon, 13 May 2019 11:53:44 -0700
Message-ID: <ea3792fdc90c2d37dd8a889c173c94d743b7b583.camel@perches.com>
References: <20190513174057.4410-1-angus@akkea.ca>
         <20190513174057.4410-2-angus@akkea.ca>
         <CAOMZO5BaQnrDOYogzgpmCExjB+uhYQ8SsxBiMWrSB-1KRtgeVQ@mail.gmail.com>
         <e61562bfc80e25bf233ae7fd7b032f83@www.akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e61562bfc80e25bf233ae7fd7b032f83@www.akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Angus Ainslie <angus@akkea.ca>, Fabio Estevam <festevam@gmail.com>
Cc: angus.ainslie@puri.sm, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2019-05-13 at 11:48 -0700, Angus Ainslie wrote:
> On 2019-05-13 11:01, Fabio Estevam wrote:
> > On Mon, May 13, 2019 at 2:41 PM Angus Ainslie (Purism) <angus@akkea.ca> 
> > wrote:
> > > Add an explicit reference to imx* devicetrees
> > > 
> > > Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> > > ---
> > >  MAINTAINERS | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 7707c28628b9..0871a21a5bbb 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -1648,6 +1648,7 @@ T:        git 
> > > git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> > >  F:     arch/arm/boot/dts/ls1021a*
> > >  F:     arch/arm64/boot/dts/freescale/fsl-*
> > >  F:     arch/arm64/boot/dts/freescale/qoriq-*
> > > +F:     arch/arm64/boot/dts/freescale/imx*
> > 
> > No, please put this entry under ARM/FREESCALE IMX / MXC ARM 
> > ARCHITECTURE
> > 
> 
> I believe order is important. Would you like it before or after the "N:" 
> entries ? Or just as the last entry.

Order is not important, but I prefer the
N: entries after the X: and F: entries.
