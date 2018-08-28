From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: RE: [PATCH 1/3] ARM: dts: Add big-endian for IFC on LS1021A
Date: Tue, 28 Aug 2018 06:53:00 +0000
Message-ID: <VI1PR0402MB3854BD46A68F8127B5779116970A0@VI1PR0402MB3854.eurprd04.prod.outlook.com>
References: <20180817101920.20503-1-prabhakar.kushwaha@nxp.com>
 <CADRPPNRkJ0Hz0yyB8jKqGPn2+zq+xJa1L9Vc3_8ai06+tO7t1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CADRPPNRkJ0Hz0yyB8jKqGPn2+zq+xJa1L9Vc3_8ai06+tO7t1Q@mail.gmail.com>
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
To: Leo Li <leoyang.li@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Alison Wang <alison.wang@nxp.com>, Jagdish Gediya <jagdish.gediya@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi leo

> -----Original Message-----
> From: Li Yang <leoyang.li@nxp.com>
> Sent: Tuesday, August 28, 2018 1:00 AM
> To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> Cc: open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> <devicetree@vger.kernel.org>; Rob Herring <robh@kernel.org>; Mark
> Rutland <mark.rutland@arm.com>; Shawn Guo <shawnguo@kernel.org>;
> moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE <linux-arm-
> kernel@lists.infradead.org>; Alison Wang <alison.wang@nxp.com>; Jagdish
> Gediya <jagdish.gediya@nxp.com>
> Subject: Re: [PATCH 1/3] ARM: dts: Add big-endian for IFC on LS1021A
> 
> On Fri, Aug 17, 2018 at 5:20 AM Prabhakar Kushwaha
> <prabhakar.kushwaha@nxp.com> wrote:
> >
> > Register space of IFC controller is big-endian.
> >
> > So add big-endian in IFC device tree node.
> 
> Is this change necessary?  The current binding of IFC says:
> 
> - little-endian : If this property is absent, the big-endian mode will
>                   be in use as default for registers.
> 

I agree.. this patch is not required.

But your comments has remind me to remove big-endian property from ls1043a and ls0146a also under IFC controller.

Thanks
--pk
