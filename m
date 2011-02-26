From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] arm/dt: add very basic dts file for babbage board
Date: Sat, 26 Feb 2011 22:30:31 +0800
Message-ID: <AANLkTimQk_KOjr7zOS+82GD9DkfHaMi=0bY-YpWuNxGW@mail.gmail.com>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
	<1298016730-22761-3-git-send-email-r64343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1298016730-22761-3-git-send-email-r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 18 February 2011 16:12, Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> =A0arch/arm/boot/dts/babbage.dts | =A0117 +++++++++++++++++++++++++++++++=
++++++++++
> =A01 files changed, 117 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage.dts
> new file mode 100644
> index 0000000..7ee26f1
> --- /dev/null
> +++ b/arch/arm/boot/dts/babbage.dts
> @@ -0,0 +1,117 @@
> +/dts-v1/;
> +
> +/ {
> + =A0 =A0 =A0 model =3D "mx51_babbage";
> + =A0 =A0 =A0 compatible =3D "fsl,mx51_babbage";
> + =A0 =A0 =A0 #address-cells =3D <0x1>;
> + =A0 =A0 =A0 #size-cells =3D <0x1>;
> + =A0 =A0 =A0 #interrupt-cells =3D <0x1>;
> + =A0 =A0 =A0 interrupt-parent =3D <0x1>;
> +
> + =A0 =A0 =A0 memory {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "memory";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x90000000 0x20000000>;
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 chosen {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D "console=3Dttymxc1,115200n8 de=
bug earlyprintk";
> + =A0 =A0 =A0 };

I was confused by this a little bit.  We used to have ttymxc0 than
ttymxc1 here for bootargs.  Per this dts file, we have the imx uart
nodes in order of imx-uart.2 (0x7000c000) --> imx-uart.0 (0x73fbc000)
--> mx-uart.1 (0x73fc0000).  That is why we have the following message
of of_platform_bus_probe().

of_platform_bus_probe()
 starting at: /
  match: /soc
   create child: /soc/tzic
  match: /spba@70000000
   create child: /spba@70000000/imx-uart@C000
  match: /aips@73f00000
   create child: /aips@73f00000/imx-uart@BC000
   create child: /aips@73f00000/imx-uart@C0000
  match: /aips@83f00000
   create child: /aips@83f00000/fec@EC000

That is to say imx-uart.2 will get probed as the first one before
imx-uart.0.  Meanwhile, the '[PATCH 3/3] serial/imx: parse from device
tree support' assumes it's the usual order, imx-uart.0 --> imx-uart.1
--> imx-uart.2.

=3D=3D=3D=3D=3D=3D
+#ifdef CONFIG_OF
+static int serial_imx_probe_dt(struct imx_port *sport,
+               struct platform_device *pdev)
+{
+       struct device_node *node =3D pdev->dev.of_node;
+       static int line;
+
+       if (!node)
+               return -ENODEV;
+
+       if (of_get_property(node, "rts-cts", NULL))
+               sport->have_rtscts =3D 1;
+
+#ifdef CONFIG_IRDA
+       if (of_get_property(node, "irda", NULL))
+               sport->use_irda =3D 1;
+#endif
+       sport->port.line =3D line++;
+
+       return 0;
+}
+#else
+static int serial_imx_probe_dt(struct imx_port *sport,
+               struct platform_device *pdev)
+{
+       return -ENODEV;
+}
+#endif
+
[...]
@@ -1236,6 +1288,12 @@ static int serial_imx_probe(struct platform_device *=
pdev)
       if (!sport)
               return -ENOMEM;

+       ret =3D serial_imx_probe_dt(sport, pdev);
+       if (ret =3D=3D -ENODEV)
+               ret =3D serial_imx_probe_pdata(sport, pdev);
+       if (ret)
+               goto free;
+
=3D=3D=3D=3D=3D=3D

That's probably we have to tell console=3Dttymxc1 in bootargs, however
ttymxc0 hardware is actually being used.

> +
> + =A0 =A0 =A0 soc {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "soc";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x0 0xffffffff>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tzic {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xe0000000 0x1000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,tzic";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "tzic";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phandle =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 clocks {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_clk0: uart@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uart=
.0";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_clk1: uart@1{
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uart=
.1";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_clk2: uart@2{
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "imx-uart=
.2";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fec_clk: @0{
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "clock";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "fec.0";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 spba@70000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "soc";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x70000000 0x100000>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@C000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "imx-uart";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc000 0x1000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x21>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rts-cts;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D < &uart_clk2=
 >, "uart";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 aips@73f00000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "soc";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x73f00000 0x100000>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@BC000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "imx-uart";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xbc000 0x1000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x1f>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rts-cts;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D < &uart_clk0=
 >, "uart";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx-uart@C0000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "imx-uart";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc0000 0x1000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x20>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rts-cts;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart-clock =3D <&uart_clk1>=
, "uart";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 aips@83f00000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0x1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "soc";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D <0x0 0x83f00000 0x100000>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fec@EC000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fec";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xec000 0x1000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0x57>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fec_clk-clock =3D < &fec_cl=
k >, "fec";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +};
> --
> 1.7.0.4
>
>
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
>



-- =

Regards,
Shawn
