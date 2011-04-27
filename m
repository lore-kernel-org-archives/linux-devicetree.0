From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: devicetree: Tegra I2C muxing, and of_i2c_register_devices
Date: Wed, 27 Apr 2011 10:05:10 -0600
Message-ID: <BANLkTi=6=K4egs=tqspB_eO9jNWB214YxA@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF04973BBDE6@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04973BBDE6-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[cc'ing devicetree-discuss, and also John Bonesio who is working on
Tegra device tree support]

On Tue, Apr 26, 2011 at 5:13 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Tegra's I2C driver has a unique feature built in (although not mainlined
> yet); it can multiplex the I2C bus onto different sets of pins using the
> Tegra pinmux module, and hence can register more than 1 I2C bus with the
> I2C core for each controller. The exact number of busses registers, and
> the pinmux settings to be used, are provided by platform data. See:
>
> http://git.chromium.org/git/kernel-next.git chromeos-2.6.38
> include/linux/i2c-tegra.h
> arch/arm/mach-tegra/board-seaboard.c
>
> If I understand the direction of devicetree on ARM, there should be a
> single devicetree node for the Tegra I2C controller, which will get
> matched up with a static platform device registration in e.g.
> mach-tegra/board-dt.c
>
> I can easily see how to provide the appropriate platform data to the
> Tegra I2C driver, by definining the appropriate fields in a custom
> devicetree binding.
>
> To cater for the multiple child busses, the simplest solution seems to
> be to define each child node's reg property to be a tuple, <sub_bus_id,
> i2c_address> (c.f. existing <i2c_address>). E.g.:
>
> IIC0: i2c@00000000 {
> =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra250-iic";
> =A0 =A0 =A0 =A0#address-cells =3D <2>;
> =A0 =A0 =A0 =A0#size-cells =3D <0>;
> =A0 =A0 =A0 =A0bus_muxes =3D <pinmuxid_1 pinmux_value_1 pinmuxid_2 pinmux=
_value_2>;
> =A0 =A0 =A0 =A0rtc@68 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "stm,m41t80";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0 0x68>;
> =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0sttm@48 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "ad,ad7414";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <1 0x48>;
> =A0 =A0 =A0 =A0};
> };
>
> The problem is then that of_i2c_register_devices won't work well for the
> Tegra I2C controller, since it enforces that each child node's reg
> property be a single value, the I2C address.
>
> To solve this, should we:
>
> a) Have each mux'd bus have a separate devicetree node underneath the
> main I2C device, e.g.:

Yes, this is exactly what you should do.

> IIC0: i2c@00000000 {
> =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra250-iic";
> =A0 =A0 =A0 =A0// @0 doesn't really end up matching a
> =A0 =A0 =A0 =A0// reg property within the child though
> =A0 =A0 =A0 =A0bus@0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#address-cells =3D <1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#size-cells =3D <0>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pinmux_group =3D <N>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pinmux_value =3D <M>;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rtc@68 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "stm,m41t80=
";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x68>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0bus@1 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#address-cells =3D <1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#size-cells =3D <0>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pinmux_group =3D <N>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pinmux_value =3D <M>;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sttm@48 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "ad,ad7414";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x48>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0}
> };
>
> Then, the bus@0 or bus@1 nodes could be placed into adap->dev.of_node,
> since the devices are hung off there.

Right.

>
> b)
>
> Implement custom devicetree child enumeration code in the Tegra I2C
> driver to replace of_i2c_register_devices, which implements the
> two-entry reg format. The first devicetree example in this email could
> then be used.

Blech!!!  :-)

>
> c)
>
> Perhaps remove the bus mux functionality from the Tegra I2C driver, and
> implement a separate I2C mux driver for it.

This would also be useful.  There are other systems that I think would
find this to be a useful feature.  The device tree layout would look
much the same as for option a), but the support code would become more
generic.  I've been thinking about trying to implement both i2c and
spi 'gateway' or 'bridge' drivers for a while now, so I think this is
worth exploring.

>
> I'm not sure if devicetree has a defined representation for I2C bus
> muxes, and even if it does, since the mux control isn't accessed by I2C
> registers (as most standalone I2C bus muxes are), but rather Tegra-
> specific pinmux API calls, I'm not quite sure how to represent it in
> device-tree.

There isn't an existing binding, but it will be pretty easy to key the
required behaviour off a new compatible value for the specific i2c
mux.  You just need a node for the i2c mux, and another node for each
child bus.  Alternately, the mux could do what you suggest for option
b which might end up being cleaner.  *HOWEVER* it is only cleaner if
the common i2c bus population code is modified to support it instead
of creating something custom.

g.

>
> Thanks for any thoughts!
>
> --
> nvpublic
>
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
