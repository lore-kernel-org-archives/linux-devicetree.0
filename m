From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCH v2 2/3] ARM: dts: socfpga: fpga bridges bindings docs
Date: Sat, 25 Oct 2014 16:42:29 +0200
Message-ID: <20141025144229.GR10262@pengutronix.de>
References: <1414108267-22058-1-git-send-email-atull@opensource.altera.com>
 <1414108267-22058-3-git-send-email-atull@opensource.altera.com>
 <20141024070042.GL10262@pengutronix.de>
 <5FB7B7FD-7B5B-4250-BADE-85573FDBBE48@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5FB7B7FD-7B5B-4250-BADE-85573FDBBE48@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: atull@opensource.altera.com, jgunthorpe@obsidianresearch.com, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, michal.simek@xilinx.com, rdunlap@infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, mgerlach@opensource.altera.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

Hi Pantelis!

On Fri, Oct 24, 2014 at 12:20:53PM +0300, Pantelis Antoniou wrote:
> Hi Stefan, Allan,
>=20
> Sorry, haven=E2=80=99t had a chance to review all this yet; will do s=
o in the weekend.
> Just wanted to pop in and comment on a few things.
>=20
> > On Oct 24, 2014, at 10:00 AM, Steffen Trumtrar <s.trumtrar@pengutro=
nix.de> wrote:
> >=20
> > Hi!
> >=20
> > On Thu, Oct 23, 2014 at 06:51:06PM -0500, atull@opensource.altera.c=
om wrote:
> >> From: Alan Tull <atull@opensource.altera.com>
> >=20
> > (...)
> >=20
> >> diff --git a/Documentation/devicetree/bindings/fpga/altera-hps2fpg=
a-bridge.txt b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-b=
ridge.txt
> >> new file mode 100644
> >> index 0000000..bc24a2e
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridg=
e.txt
> >> @@ -0,0 +1,53 @@
> >> +Altera FPGA/HPS Bridge Driver
> >> +
> >> +This driver manages a bridge between a FPGA and a host processor =
system (HPS).
> >> +User space can enable or disable the bridge by writing a "1" or a=
 "0",
> >> +respectively, to its enable file under bridge's entry in
> >> +/sys/class/fpga-bridge.  Typically, one disables the bridges befo=
re
> >> +reprogramming the FPGA.  Once the FPGA is reprogrammed, the bridg=
es are
> >> +reenabled.
> >> +
> >=20
> > NAK.
> >=20
> > This is all linux specific and doesn't belong here.
> >=20
>=20
> We know. The DT spec hasn=E2=80=99t been updated for a while, and thi=
s is going to be
> part of what we want to do with the restarting of the ePAPR spec proc=
ess.
>

As we don't have a new spec yet, I go with the current state of the art=
=2E
And I don't see how "file under ... /sys/class/fpga-bridge" fits the
current spec.

> So absolutes like =E2=80=9CDT is a hardware description only" might b=
e too strong statements, that
> do not work in practice anymore.
>=20
> There=E2=80=99s no such thing as pure hardware devices lately - there=
 is always a configuration
> component; some of it OS specific, some of it not.
>=20

If it really is necessary, I'm not against it, don't get me wrong.
But in the grand scheme I wouldn't say that this fits my experience.
There are some devices that need configuration and often when it is
done in the DT, it is just a shortcut or not thought through.
And can be also introspected dynamically. With some discussion on the
list these bindings often change.

Regarding OS specifics: already there, e.g. console setup in the chosen=
 node.
And other things I saw are ethernet aliases just for u-boot. Not a prob=
lem
of the spec, just a problem of u-boot and unneccessary "configuration".
Just to fix a bad bootloader. barebox can handle this without any
such stuff. Maybe we should integrate the DT "overlays" barebox uses in=
to
the in-kernel DTs as well...but does it really help/interest someone wh=
o
decides to use u-boot where barebox stores its environment? I guess not=
=2E

> We have to be engaged in the process and figure out how to update the=
 spec for what is
> now the state of the art in the industry.
>=20

Again, not against that if it is necessary. For example your overlay st=
uff might
be a good update to the spec. Would be better if it is official instead=
 of a "hack".
I want that for SoCFPGA.

But having looked at one or two vendor kernels+DTs, the state of the ar=
t in the
industry is: using DT wrong. (And doing HW wrong, which makes some upda=
tes to the
ePAPR necessary ;-))

Regards,
Steffen

--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
