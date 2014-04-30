From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [U-Boot] [Ac100] [PATCH v2 5/6] ARM: tegra: paz00: add dtbindings for nvec
Date: Wed, 30 Apr 2014 09:52:42 +0200
Message-ID: <2004470.cHRJ0azkU4@fb07-iapwap2>
References: <535EDE6D.2050505@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2768739.26gN9j9u5C"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <535EDE6D.2050505-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nextPart2768739.26gN9j9u5C
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

Am Montag, 28. April 2014, 17:04:13 schrieb Stephen Warren:
> On 04/26/2014 07:14 PM, Andrey Danin wrote:
> 
> This patch isn't adding DT bindings for NVEC, but rather add DT nodes.
> The binding is the schema, not the content.
>
> We need a DT binding document that's been reviewed by the DT binding
> maintainers. Can you please first submit a patch to the Linux kernel
> that modifies the existing I2C core and Tegra I2C controller binding
> documentation to add slave mode support. Once that's fully reviewed and
> ack'd, this patch series can implement support for it in U-Boot.

I'm sorry that I didn't came up with a proper kernel implementation, but while 
we are discussion the binding I just want to give some coins.

> > diff --git a/arch/arm/dts/tegra20-paz00.dts
> > b/arch/arm/dts/tegra20-paz00.dts> 
> >  	i2c@7000c500 {
> > 
> > -		status = "disabled";
> > +		status = "okay";
> > +		clock-frequency = <40000>;
> > +		slave-addr = <138>;
> > +		nvec {
> > +			compatible = "nvidia,tegra20-nvec";
> > +			request-gpios = <&gpio 170 0>; /* gpio PV2 */
> 
> The reg property is missing here. Since the i2c node has
> #address-cells/#size-cells, there must be a reg property in the children.
> 
> There's nothing here to indicate that this node is a slave device rather
> than a master device, and doesn't seem to be any allowance for a single
> I2C controller to support both master and slave nodes at the same time
> (which I think Tegra's controller can IIRC).
> 
> IIRC, I had previously suggested something like encoding master/slave
> into the reg property of the I2C child nodes. We could either do:
> 
> a) Set some top-bit to indicate a slave device.
> 
> b) If #address-cells=<1>, only master devices are present. If
> #address-cells=<2>, either master or slave devices could be present.
> Cell 0 could be 0==master, 1==slave, and cell 1 the actual I2C bus address.

I'm not sure if this is really needed. NVEC knows it has to configure the 
tegra controller as slave. I don't see a reason to double this fact in the 
device tree. I like the idea of how the downstream kernel does it. The driver 
calls something like tegra_i2c_init_slave with the slave address as an 
parameter. This means that the slave address is not a property of the i2c 
(slave-) controller, but of the master because it has the address hard coded 
in its firmware. So reg = <138>; would be sufficient here and it also enables 
multi-slave configs.

i2c-tegra must take care that only one transaction (slave or master) is 
running at a time. The client (e.g. nvec) is free to drop the excluse usage by 
calling tegra_i2c_stop_slave so master mode can be used again or another 
client (master device) can be started where the slave controller gets a 
different address.

Multi-master would require that only one master can hold the lock enabling 
slave mode, but that's all software stuff and not related to the binding.

Also the kernel binding would require that nvec node itself has subdevices for 
e.g. keyboard, mouse, power, ... which are connected to the internal ec bus. 
We can use the nvec protocol identifiers to assign an address here.

Ok, lets take a look at the binding now:

i2c@7000c500 {
		status = "okay";
		clock-frequency = <40000>;
		nvec@138 {
			compatible = "nvidia,nvec, simple-bus";
			#address-cells = <1>
			#size-cells = <0>;
			reg = <138>;
			request-gpios = <&gpio 170 0>; /* gpio PV2 */

			keyboard@5 {
				compatible = "nvidia,nvec-kbd";						
				reg = <5>;
			};
			mouse@6 {
				compatible = "nvidia,nvec-aux";
				reg = <6>;
				packet-size = <6>;
			};
		};
};

Only thing I'm not sure is where to put the clock-frequency because it really 
depends on the i2c clients and if we have multiple masters, we could use 
multiple frequencies. Or maybe the lowest supported must be used instead, in 
which case the clock-frequency is better placed in the controller node.

Marc
--nextPart2768739.26gN9j9u5C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAABAgAGBQJTYKvKAAoJEKyeR39HFBto4WYH/As7tluf8nggvhaK91AS6lG8
uXeN2wUaQLOthwl6TYTNSULJ1doap9ltntfN06WG0plk3icw2DXzrKQnh2Sp14Rj
uoY/zZmX4vLtketkZzgcSfek3a715aZrNp9ul90wdKVOvq6QUUkPXAoeYSmSkKT7
aFBE5W2iWmCdzjMxP41tDW1UIj4Tmysh6TNo6LlrcZ820lZ+A5JtYsY/mukNGL8o
uIOz/9K7hnOl424YO40FRJWLo161v6UdPPQIJBugxwjyl6PNRhcCS4xZbLBjNWEn
MXokUGXYntBVSpu7dIq5TOoPVfe0skTYNgYAp0qFP2H26N1IRFK2e3nrgVvzWDE=
=ZOej
-----END PGP SIGNATURE-----

--nextPart2768739.26gN9j9u5C--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
