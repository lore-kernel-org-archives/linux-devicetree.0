From: Thor Thayer <tthayer.linux@gmail.com>
Subject: Re: [PATCHv3 1/3] dts: socfpga: Add bindings for Altera SoC SDRAM controller
Date: Tue, 6 May 2014 13:34:36 -0500
Message-ID: <CAF03EBfO9JELqJim10r7dJnmLH41i_VxZt_vnRKaOOO96eH_JA@mail.gmail.com>
References: <1399330337-16748-1-git-send-email-tthayer@altera.com>
	<1399330337-16748-2-git-send-email-tthayer@altera.com>
	<ba35254f-4ba5-4b2c-8056-cde5c693b0ff@CH1EHSMHS009.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ba35254f-4ba5-4b2c-8056-cde5c693b0ff@CH1EHSMHS009.ehs.local>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Thor Thayer <tthayer@altera.com>, robherring2@gmail.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, Dinh Nguyen <dinguyen@altera.com>, dougthompson@xmission.com, grant.likely@linaro.org, Borislav Petkov <bp@alien8.de>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi S=C3=B6ren

On Mon, May 5, 2014 at 6:16 PM, S=C3=B6ren Brinkmann
<soren.brinkmann@xilinx.com> wrote:
>
> Hi Thor,
>
> On Mon, 2014-05-05 at 05:52PM -0500, tthayer@altera.com wrote:
> > From: Thor Thayer <tthayer@altera.com>
> >
> > Addition of the Altera SDRAM controller bindings and device
> > tree changes to the Altera SoC project. The "syscon" parameter
> > is included here because the SDRAM EDAC bits are shared with the SD=
RAM
> > configuration bits.
> > ---
> > v2: Changes to SoC SDRAM EDAC code.
> >
> > V3: Implement code suggestions for SDRAM EDAC code.
> >
> > Signed-off-by: Thor Thayer <tthayer@altera.com>
> > ---
> >  .../bindings/arm/altera/socfpga-sdram.txt          |   14 ++++++++=
++++++
> >  arch/arm/boot/dts/socfpga.dtsi                     |    5 +++++
> >  2 files changed, 19 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/altera/so=
cfpga-sdram.txt
> >
> > diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-s=
dram.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram.t=
xt
> > new file mode 100644
> > index 0000000..525cb76
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram.tx=
t
> > @@ -0,0 +1,14 @@
> > +Altera SOCFPGA SDRAM Controller
> > +
> > +Required properties:
> > +- compatible : "altr,sdr-ctl", "syscon";
> > +                Note that syscon is invoked for this device to sup=
port the FPGA
> > +             bridge driver, EDAC driver and other devices that sha=
re the
> > +             registers.
>
> This sounds like implementation specifics, which shouldn't be part of
> the bindings.
>
>         S=C3=B6ren
>
I see your point and will remove. Thanks!
