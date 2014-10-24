From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: socfpga: fpga bridges bindings docs
Date: Fri, 24 Oct 2014 12:20:53 +0300
Message-ID: <5FB7B7FD-7B5B-4250-BADE-85573FDBBE48@konsulko.com>
References: <1414108267-22058-1-git-send-email-atull@opensource.altera.com> <1414108267-22058-3-git-send-email-atull@opensource.altera.com> <20141024070042.GL10262@pengutronix.de>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141024070042.GL10262@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: atull@opensource.altera.com, jgunthorpe@obsidianresearch.com, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, michal.simek@xilinx.com, rdunlap@infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, mgerlach@opensource.altera.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

Hi Stefan, Allan,

Sorry, haven=E2=80=99t had a chance to review all this yet; will do so =
in the weekend.
Just wanted to pop in and comment on a few things.

> On Oct 24, 2014, at 10:00 AM, Steffen Trumtrar <s.trumtrar@pengutroni=
x.de> wrote:
>=20
> Hi!
>=20
> On Thu, Oct 23, 2014 at 06:51:06PM -0500, atull@opensource.altera.com=
 wrote:
>> From: Alan Tull <atull@opensource.altera.com>
>=20
> (...)
>=20
>> diff --git a/Documentation/devicetree/bindings/fpga/altera-hps2fpga-=
bridge.txt b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bri=
dge.txt
>> new file mode 100644
>> index 0000000..bc24a2e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.=
txt
>> @@ -0,0 +1,53 @@
>> +Altera FPGA/HPS Bridge Driver
>> +
>> +This driver manages a bridge between a FPGA and a host processor sy=
stem (HPS).
>> +User space can enable or disable the bridge by writing a "1" or a "=
0",
>> +respectively, to its enable file under bridge's entry in
>> +/sys/class/fpga-bridge.  Typically, one disables the bridges before
>> +reprogramming the FPGA.  Once the FPGA is reprogrammed, the bridges=
 are
>> +reenabled.
>> +
>=20
> NAK.
>=20
> This is all linux specific and doesn't belong here.
>=20

We know. The DT spec hasn=E2=80=99t been updated for a while, and this =
is going to be
part of what we want to do with the restarting of the ePAPR spec proces=
s.

So absolutes like =E2=80=9CDT is a hardware description only" might be =
too strong statements, that
do not work in practice anymore.

There=E2=80=99s no such thing as pure hardware devices lately - there i=
s always a configuration
component; some of it OS specific, some of it not.

We have to be engaged in the process and figure out how to update the s=
pec for what is
now the state of the art in the industry.

Regards

=E2=80=94 Pantelis
