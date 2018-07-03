From: Luis Araneda <luaraneda@gmail.com>
Subject: Re: [RFC PATCH 4/5] arm: dts: zynq: rename board zed to zedboard
Date: Tue, 3 Jul 2018 02:56:42 -0400
Message-ID: <CAHbBuxr4ODSDy+ZMFbH-zit3DgY+ULX8OcNXcgD6ZTxvF+gt=Q@mail.gmail.com>
References: <20180628054205.17737-1-luaraneda@gmail.com> <20180628054205.17737-5-luaraneda@gmail.com>
 <9d00dae5-835f-43b4-0a78-2aa43bbcff54@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9d00dae5-835f-43b4-0a78-2aa43bbcff54@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Michal,

On Thu, Jun 28, 2018 at 2:40 AM Michal Simek <michal.simek@xilinx.com> wrote:
> > diff --git a/arch/arm/boot/dts/zynq-zed.dts b/arch/arm/boot/dts/zynq-zedboard.dts
> > similarity index 93%
> > rename from arch/arm/boot/dts/zynq-zed.dts
> > rename to arch/arm/boot/dts/zynq-zedboard.dts
> > index bf3e26dbf..540581c56 100644
> > --- a/arch/arm/boot/dts/zynq-zed.dts
> > +++ b/arch/arm/boot/dts/zynq-zedboard.dts
> > @@ -8,7 +8,7 @@
> >
> >  / {
> >       model = "Avnet ZedBoard board";
> > -     compatible = "avnet,zynq-zed", "xlnx,zynq-7000";
> > +     compatible = "avnet,zynq-zedboard", "xlnx,zynq-7000";
> >
> >       aliases {
> >               ethernet0 = &gem0;
> >
>
> It will just cause confusion and I can't see any benefit to rename this
> file. If you want to state different compatible string with full board
> name I am fine with that but that's it.

Ok, I'll drop this patch for V2.


Thanks,

Luis Araneda.
