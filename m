From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
Subject: Re: RFC: Zynq Clock Controller
Date: Wed, 06 Mar 2013 12:51:21 +0100
Message-ID: <1362570681.5269.98.camel@coredoba.hi.pengutronix.de>
References: <37032699-343e-485c-80e0-9b23e3706c58@VA3EHSMHS013.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <37032699-343e-485c-80e0-9b23e3706c58@VA3EHSMHS013.ehs.local>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Mike Turquette <mturquette@linaro.org>, Josh Cartwright <josh.cartwright@ni.com>, Michal Simek <michal.simek@xilinx.com>, Peter Crosthwaite <pcrost@xilinx.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, git@xilinx.com
List-Id: devicetree@vger.kernel.org

Hi S=C3=B6ren,

On Tue, 2013-03-05 at 12:04 -0800, S=C3=B6ren Brinkmann wrote:
> For this reasons, I'd like to propose moving Zynq into the same
> direction. I.e. adding a clock controller with the following DT
> description (details may change but the general idea should become
> clear):
> 	clkc: clkc {
>                 #clock-cells =3D <1>;
>                 compatible =3D "xlnx,ps7-clkc";
>                 ps_clk_frequency =3D <33333333>;	# board x-tal
>                 # optional props
>                 gem0_emio_clk_freq =3D <125000000>;
>                 gem1_emio_clk_freq =3D <50000000>;
>                 can_mio_clk_freq_xx =3D <1234>; # this is possible 54=
 times with xx =3D 00..53
>         };

The clock controller should only contain properties for input frequency
(which can obviously not be calculated at run-time).

Are the gem*, can* properties inputs? If they are actually outputs, the
corresponding frequencies should be requested by the clock consumers an=
d
not hard-coded in DT.

Please keep in mind that DT properties use dashes instead of
underscores.

Best regards,
Jan
--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
