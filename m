From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: RFC: Zynq Clock Controller
Date: Tue, 5 Mar 2013 12:04:28 -0800
Message-ID: <37032699-343e-485c-80e0-9b23e3706c58@VA3EHSMHS013.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Josh Cartwright <josh.cartwright@ni.com>, Michal Simek <michal.simek@xilinx.com>, Peter Crosthwaite <pcrost@xilinx.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, git@xilinx.com
List-Id: devicetree@vger.kernel.org

Hi,

As you know, I'm reviewing Zynq's clock implementation and try to find =
a way to go forward. It looks like most archs contain all clocks within=
 a clock controller block which provides all the output clocks which ar=
e then used by device drivers etc. E.g. the Tegra CAR.

I do also see some benefits of this approach:
 - The DT description should never change even when the clock tree and/=
or functionality within the controller changes (assuming all required o=
utputs are present)
 - the controller can handle more sophisticated clock operations, which=
 go beyond the simple enable/disable the device drivers are doing

=46or this reasons, I'd like to propose moving Zynq into the same direc=
tion. I.e. adding a clock controller with the following DT description =
(details may change but the general idea should become clear):
	clkc: clkc {
                #clock-cells =3D <1>;
                compatible =3D "xlnx,ps7-clkc";
                ps_clk_frequency =3D <33333333>;	# board x-tal
                # optional props
                gem0_emio_clk_freq =3D <125000000>;
                gem1_emio_clk_freq =3D <50000000>;
                can_mio_clk_freq_xx =3D <1234>; # this is possible 54 t=
imes with xx =3D 00..53
        };

=46or the PLLs we can use Josh's implementation and extend it where nee=
ded. For everything else we can then use the clock primitives instead o=
f using custom implementations, I think. The node should be a subnode t=
o Zynq's SLCR.

Currently I have identified the following output clocks:
        armpll, ddrpll, iopll,
        cpu_6or4x, cpu_3or2x, cpu_2x, cpu_1x,
        ddr2x, ddr3x, dci,
        lqspi, smc, pcap, gem0, gem1, fclk0, fclk1, fclk2, fclk3, can0,=
 can1,
        sdio0, sdio1, uart0, uart1, spi0, spi1,
        dma_aper, usb0_aper, usb1_aper, gem0_aper, gem1_aper,
        sdio0_aper, sdio1_aper, spi0_aper, spi1_aper, can0_aper, can1_a=
per,
        i2c0_aper, i2c1_aper, uart0_aper, uart1_aper, gpio_aper, lqspi_=
aper,
        smc_aper


Clock consumers would work as described in the clock bindings:
	consumer: zynq_dummy_peripheral {
	        compatible =3D "xlnx,foobar";
	        clocks =3D <&clkc 69>;
	};


Is this an acceptable solution? Does anybody see issues or has other fe=
edback?

	Thanks,
	S=C3=B6ren
