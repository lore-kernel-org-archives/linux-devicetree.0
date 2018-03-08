From: Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH] ARM: dts: i.MX25: define SSI FIFO depth
Date: Thu, 8 Mar 2018 16:38:32 +0100
Message-ID: <20180308153832.GA28454@botnar.kaiser.cx>
References: <1520373499-13623-1-git-send-email-martin@kaiser.cx>
 <20180308161135.1f3d3d18@karo-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180308161135.1f3d3d18@karo-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Lothar,

Thus wrote Lothar Wa=DFmann (LW@KARO-electronics.de):

> > diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.dtsi
> > index 9725705..cf70df2 100644
> > --- a/arch/arm/boot/dts/imx25.dtsi
> > +++ b/arch/arm/boot/dts/imx25.dtsi
> > @@ -269,6 +269,7 @@
> >  				dmas =3D <&sdma 24 1 0>,
> >  				       <&sdma 25 1 0>;
> >  				dma-names =3D "rx", "tx";
> > +				fsl,fifo-depth =3D <15>;
> >  				status =3D "disabled";
> >  			};

> > @@ -329,6 +330,7 @@
> >  				dmas =3D <&sdma 28 1 0>,
> >  				       <&sdma 29 1 0>;
> >  				dma-names =3D "rx", "tx";
> > +				fsl,fifo-depth =3D <15>;
> >  				status =3D "disabled";
> >  			};

> You are changing the global .dtsi file. Did you test this change with
> all devices that are affected by it?

I changed the hardware description of the imx25 SSI to match the
reference manual.

I did test this change on an imx25 board with audio playback. This uses
the SSI description I modified. I verified that the driver is actually
taking the modified setting into account and that this causes no
problems.

As of today, this setting is used by the fsl_ssi driver to set the fifo
water level for dma requests.

Of course, I don't have access to the enitre range of supported imx25
boards and I don't think this is required for submitting patches.

Do you have any indication why this patch should not be merged?

Best regards,
Martin
