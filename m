From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: RE: [PATCH 1/2][RESEND] ARM: dts: Add big-endian in nor node for
 ls1021a
Date: Wed, 29 Aug 2018 02:55:47 +0000
Message-ID: <VI1PR0402MB3854E14A0468CEFBDFDFE48B97090@VI1PR0402MB3854.eurprd04.prod.outlook.com>
References: <20180828065936.8040-1-prabhakar.kushwaha@nxp.com>
 <20180828065936.8040-2-prabhakar.kushwaha@nxp.com>
 <CAOMZO5BVrK98ksQ2KBiXTy6O-nXjOG8_fFueRRXHZOwCMJ1UGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5BVrK98ksQ2KBiXTy6O-nXjOG8_fFueRRXHZOwCMJ1UGg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Leo Li <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Dear Fabio,

> -----Original Message-----
> From: Fabio Estevam <festevam@gmail.com>
> Sent: Wednesday, August 29, 2018 3:56 AM
> To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> Cc: open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> <devicetree@vger.kernel.org>; Rob Herring <robh@kernel.org>; Mark
> Rutland <mark.rutland@arm.com>; Shawn Guo <shawnguo@kernel.org>;
> moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE <linux-arm-
> kernel@lists.infradead.org>; Leo Li <leoyang.li@nxp.com>
> Subject: Re: [PATCH 1/2][RESEND] ARM: dts: Add big-endian in nor node for
> ls1021a
> 
> On Tue, Aug 28, 2018 at 3:59 AM, Prabhakar Kushwaha
> <prabhakar.kushwaha@nxp.com> wrote:
> 
> > diff --git a/arch/arm/boot/dts/ls1021a-qds.dts
> > b/arch/arm/boot/dts/ls1021a-qds.dts
> > index 499f41a2c6f0..923a25760516 100644
> > --- a/arch/arm/boot/dts/ls1021a-qds.dts
> > +++ b/arch/arm/boot/dts/ls1021a-qds.dts
> > @@ -1,5 +1,6 @@
> >  /*
> >   * Copyright 2013-2014 Freescale Semiconductor, Inc.
> > + * Copyright 2018 NXP
> 
> This line is unrelated to the big-endian change.

Yes, this line is unrelated to this change.

Freeescale has been acquired by NXP in 2016. 
We want to add NXP copyright wherever freescale's copyright is present. But it is not possible in one-go.

So we are adding NXP copyright as and when any file having freescale's copyright  being touched.  

--pk
