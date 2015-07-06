From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCHv6 1/2] dts: Adding docs for Xilinx LogiCORE IP mailbox
 driver.
Date: Mon, 6 Jul 2015 10:27:27 -0700
Message-ID: <20150706172727.GH6550@xsjsorenbubuntu>
References: <1436202963-16922-1-git-send-email-moritz.fischer@ettus.com>
 <1436202963-16922-2-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1436202963-16922-2-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, akpm@linux-foundation.org, gregkh@linuxfoundation.org, mchehab@osg.samsung.com, arnd@arndb.de, joe@perches.com, jingoohan1@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-07-06 at 10:16AM -0700, Moritz Fischer wrote:
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---
>  .../devicetree/bindings/mailbox/xilinx-mailbox.txt | 44 ++++++++++++=
++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/xilinx-=
mailbox.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/xilinx-mailbox=
=2Etxt b/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt
> new file mode 100644
> index 0000000..97b81f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt
> @@ -0,0 +1,44 @@
> +Xilinx Mailbox Driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Required properties:
> +- compatible       : "xlnx,mailbox-2.1".
> +- reg              :  physical base address of the mailbox and lengt=
h of
> +                      memory mapped region.
> +- #mbox-cells      :  common mailbox binding property to identify th=
e number
> +                      of cells required for the mailbox specifier, s=
hould be 0
> +- clocks           :  phandle to clock provider
> +- clock-names      :  must be 'mbox'
> +
> +Optional properties:
> +- interrupt-parent : interrupt source phandle
> +- interrupts       : interrupt number, The interrupt specifier forma=
t
> +                     depends on the interrupt controller parent.
> +
> +Example:
> +	mbox: mailbox@40400000 {
> +		compatible =3D "xlnx,mailbox-2.1";
> +		reg =3D <0x40400000 0x100>;
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <5>;
> +		#mbox-cells =3D <0>;
> +		clocks =3D <&clkc 15>;
> +		clock-names =3D "mbox";
> +	};
> +
> +Mailbox client
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +"mboxes" and the optional "mbox-names" (please see
> +Documentation/devicetree/bindings/mailbox/mailbox.txt for details). =
Each value
> +of the mboxes property should contain a phandle to the mailbox contr=
oller
> +device node and second argument is the channel index. It must be 0 (=
hardware
> +support only one channel). The equivalent "mbox-names" property valu=
e can be
> +used to give a name to the communication channel to be used by the c=
lient user.
> +
> +Example:
> +	mclient0: mclient0@400 {
> +		compatible =3D "client-1.0";
> +		reg =3D <0x400 0x10>;
> +		mbox-names =3D "mbox";
> +		mboxes =3D <&mbox 0>;

Sorry, to bring this up again, but I'm confused regarding the #mbox-cel=
ls
thing. Above it says #mbox-cells is 0. In that case, shouldn't the
'mboxes' property not only be '<&mbox>'?

Moreover, the generic mailbox bindings
(https://www.kernel.org/doc/Documentation/devicetree/bindings/mailbox/m=
ailbox.txt)
mandate #mbox-cells to be at least 1.

Does something need to be aligned here?

	S=C3=B6ren
