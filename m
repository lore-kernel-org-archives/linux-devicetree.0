From: Thierry Reding <treding@nvidia.com>
Subject: Re: [RFC 0/2] drm/dsi: DSI for devices with different control bus
Date: Thu, 10 Sep 2015 09:32:54 +0200
Message-ID: <20150910073252.GA8756@ulmo.nvidia.com>
References: <1439993828.31432.28.camel@pengutronix.de>
 <20150819143452.GH15607@ulmo.nvidia.com>
 <1439995944.31432.34.camel@pengutronix.de>
 <20150819150207.GJ15607@ulmo.nvidia.com>
 <55D5548E.9030608@codeaurora.org>
 <20150820114815.GB7479@ulmo.nvidia.com>
 <55D6C07D.4050405@codeaurora.org> <55ED7921.2030103@codeaurora.org>
 <55EEB82C.2070805@samsung.com> <55F12007.6020307@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0962716216=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55F12007.6020307@codeaurora.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Archit Taneja <architt@codeaurora.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

--===============0962716216==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2015 at 11:45:35AM +0530, Archit Taneja wrote:
>=20
>=20
> On 09/08/2015 03:57 PM, Andrzej Hajda wrote:
> >On 09/07/2015 01:46 PM, Archit Taneja wrote:
> >>Thierry,
> >>
> >>On 08/21/2015 11:39 AM, Archit Taneja wrote:
> >>>
> >>>
> >>>On 08/20/2015 05:18 PM, Thierry Reding wrote:
> >>>>On Thu, Aug 20, 2015 at 09:46:14AM +0530, Archit Taneja wrote:
> >>>>>Hi Thierry, Lucas,
> >>>>>
> >>>>>
> >>>>>On 08/19/2015 08:32 PM, Thierry Reding wrote:
> >>>>>>On Wed, Aug 19, 2015 at 04:52:24PM +0200, Lucas Stach wrote:
> >>>>>>>Am Mittwoch, den 19.08.2015, 16:34 +0200 schrieb Thierry Reding:
> >>>>>>>>On Wed, Aug 19, 2015 at 04:17:08PM +0200, Lucas Stach wrote:
> >>>>>>>>>Hi Thierry, Archit,
> >>>>>>>>>
> >>>>>>>[...]
> >>>>>>>>>>Perhaps a better way would be to invert this relationship.
> >>>>>>>>>>According to
> >>>>>>>>>>your proposal we'd have to have DT like this:
> >>>>>>>>>>
> >>>>>>>>>>     i2c@... {
> >>>>>>>>>>         ...
> >>>>>>>>>>
> >>>>>>>>>>         dsi-device@... {
> >>>>>>>>>>             ...
> >>>>>>>>>>             dsi-bus =3D <&dsi>;
> >>>>>>>>>>             ...
> >>>>>>>>>>         };
> >>>>>>>>>>
> >>>>>>>>>>         ...
> >>>>>>>>>>     };
> >>>>>>>>>>
> >>>>>>>>>>     dsi@... {
> >>>>>>>>>>         ...
> >>>>>>>>>>     };
> >>>>>>>>>>
> >>>>>>>>>>Inversing the relationship would become something like this:
> >>>>>>>>>>
> >>>>>>>>>>     i2c@... {
> >>>>>>>>>>         ...
> >>>>>>>>>>     };
> >>>>>>>>>>
> >>>>>>>>>>     dsi@... {
> >>>>>>>>>>         ...
> >>>>>>>>>>
> >>>>>>>>>>         peripheral@... {
> >>>>>>>>>>             ...
> >>>>>>>>>>             i2c-bus =3D <&i2c>;
> >>>>>>>>>>             ...
> >>>>>>>>>>         };
> >>>>>>>>>>
> >>>>>>>>>>         ...
> >>>>>>>>>>     };
> >>>>>>>>>>
> >>>>>>>>>>Both of those aren't fundamentally different, and they both have
> >>>>>>>>>>the
> >>>>>>>>>>disavantage of lacking ways to transport configuration data that
> >>>>>>>>>>the
> >>>>>>>>>>other bus needs to instantiate the dummy device (such as the reg
> >>>>>>>>>>property for example, denoting the I2C slave address or the DSI
> >>>>>>>>>>VC).
> >>>>>>>>>>
> >>>>>>>>>>So how about we create two devices in the device tree and fuse
> >>>>>>>>>>them at
> >>>>>>>>>>the driver level:
> >>>>>>>>>>
> >>>>>>>>>>     i2c@... {
> >>>>>>>>>>         ...
> >>>>>>>>>>
> >>>>>>>>>>         i2cdsi: dsi-device@... {
> >>>>>>>>>>             ...
> >>>>>>>>>>         };
> >>>>>>>>>>
> >>>>>>>>>>         ...
> >>>>>>>>>>     };
> >>>>>>>>>>
> >>>>>>>>>>     dsi@... {
> >>>>>>>>>>         ...
> >>>>>>>>>>
> >>>>>>>>>>         peripheral@... {
> >>>>>>>>>>             ...
> >>>>>>>>>>             control =3D <&i2cdsi>;
> >>>>>>>>>>             ...
> >>>>>>>>>>         };
> >>>>>>>>>>
> >>>>>>>>>>         ...
> >>>>>>>>>>     };
> >>>>>>>>>>
> >>>>>>>>>>This way we'll get both an I2C device and a DSI device that we
> >>>>>>>>>>can fully
> >>>>>>>>>>describe using the standard device tree bindings. At driver time
> >>>>>>>>>>we can
> >>>>>>>>>>get the I2C device from the phandle in the control property of
> >>>>>>>>>>the DSI
> >>>>>>>>>>device and use it to execute I2C transactions.
> >>>>>>>>>>
> >>>>>>>>>I don't really like to see that you are inventing yet-another-wa=
y to
> >>>>>>>>>handle devices connected to multiple buses.
> >>>>>>>>>
> >>>>>>>>>Devicetree is structured along the control buses, even if the
> >>>>>>>>>devices
> >>>>>>>>>are connected to multiple buses, in the DT they are always
> >>>>>>>>>children of
> >>>>>>>>>the bus that is used to control their registers from the CPUs
> >>>>>>>>>perspective. So a DSI encoder that is controlled through i2c is
> >>>>>>>>>clearly
> >>>>>>>>>a child of the i2c master controller and only of that one.
> >>>>>>>>
> >>>>>>>>I think that's a flawed interpretation of what's going on here. T=
he
> >>>>>>>>device in fact has two interfaces: one is I2C, the other is DSI.
> >>>>>>>>In my
> >>>>>>>>opinion that's reason enough to represent it as two logical devic=
es.
> >>>>>>>>
> >>>>>>>Does it really have 2 control interfaces that are used at the same
> >>>>>>>time?
> >>>>>>>Or is the DSI connection a passive data bus if the register control
> >>>>>>>happens through i2c?
> >>>>>>
> >>>>>>The interfaces may not be used at the same time, and the DSI interf=
ace
> >>>>>>may even be crippled, but the device is still addressable from the =
DSI
> >>>>>>host controller, if for nothing else than for routing the video str=
eam.
> >>>>>>
> >>>>>>>>>If you need to model connections between devices that are not
> >>>>>>>>>reflected
> >>>>>>>>>through the control bus hierarchy you should really consider
> >>>>>>>>>using the
> >>>>>>>>>standardized of-graph bindings.
> >>>>>>>>>(Documentation/devicetree/bindings/graph.txt)
> >>>>>>>>
> >>>>>>>>The problem is that the original proposal would instantiate a dum=
my
> >>>>>>>>device, so it wouldn't be represented in DT at all. So unless you
> >>>>>>>>do add
> >>>>>>>>two logical devices to DT (one for each bus interface), you don't
> >>>>>>>>have
> >>>>>>>>anything to glue together with an OF graph.
> >>>>>>>>
> >>>>>>>I see that the having dummy device is the least desirable solution.
> >>>>>>>But
> >>>>>>>if there is only one control bus to the device I think it should be
> >>>>>>>one
> >>>>>>>device sitting beneath the control bus.
> >>>>>>>
> >>>>>>>You can then use of-graph to model the data path between the DSI
> >>>>>>>encoder
> >>>>>>>and device.
> >>>>>>
> >>>>>>But you will be needing a device below the DSI host controller to
> >>>>>>represent that endpoint of the connection. The DSI host controller
> >>>>>>itself is in no way connected to the I2C adapter. You would have to
> >>>>>>add some sort of quirk to the DSI controller binding to allow it to
> >>>>>
> >>>>>Thanks for the review.
> >>>>>
> >>>>>I implemented this to support ADV7533 DSI to HDMI encoder chip, which
> >>>>>has a DSI video bus and an i2c control bus.
> >>>>>
> >>>>>There weren't any quirks as such in the device tree when I tried to
> >>>>>implement this. The DT seems to manage fine without a node
> >>>>>corresponding to a mipi_dsi_device:
> >>>>>
> >>>>>i2c_adap@.. {
> >>>>>     adv7533@.. {
> >>>>>
> >>>>>         port {
> >>>>>             adv_in: endpoint {
> >>>>>                 remote-endpoint =3D <&dsi_out>;
> >>>>>             };
> >>>>>         };
> >>>>>     };
> >>>>>};
> >>>>>
> >>>>>dsi_host@.. {
> >>>>>     ...
> >>>>>     ...
> >>>>>
> >>>>>     port {
> >>>>>         dsi_out: endpoint {
> >>>>>             remote-endpoint =3D <&adv_in>;
> >>>>>         }
> >>>>>     };
> >>>>>};
> >>>>>
> >>>>>It's the i2c driver's job to parse the graph and retrieve the
> >>>>>phandle to the dsi host. Using this, it can proceed with
> >>>>>registering itself to this host using the new dsi funcs. This
> >>>>>patch does the same for the adv7533 i2c driver:
> >>>>>
> >>>>>http://www.spinics.net/lists/dri-devel/msg86840.html
> >>>>>
> >>>>>>hook up with a control endpoint. And then you'll need more quirks
> >>>>>>to describe what kind of DSI device this is.
> >>>>>
> >>>>>Could you explain what you meant by this? I.e. describing the kind
> >>>>>of DSI device?
> >>>>
> >>>>Describing the number of lanes, specifying the virtual channel, mode
> >>>>flags, etc. You could probably set the number of lanes and mode flags
> >>>>via the I2C driver, but especially the virtual channel cannot be set
> >>>>because it isn't known to the I2C DT branch of the device.
> >>>
> >>>I agree with the VC part. It could be a DT entry within the i2c client
> >>>node, but that does make it seem like a quirk. The 'reg' way under the
> >>>DSI host is definitely better to populate the virtual channel.
> >>>
> >>>>
> >>>>>The dsi device created isn't really a dummy device as such. It's
> >>>>>dummy in the sense that there isn't a real dsi driver associated
> >>>>>with it. The dsi device is still used to attach to a mipi dsi host,
> >>>>>the way normal dsi devices do.
> >>>>
> >>>>I understand, but I don't see why it has to be instantiated by the I2C
> >>>>driver, that's what I find backwards. There is already a standard way
> >>>>for instantiating DSI devices, why not use it?
> >>>
> >>>I assumed we could either represent the device using an i2c driver, or
> >>>dsi, but not both. Hence, I came up with this approach.
> >>>
> >>>>
> >>>>>>On the other hand if you properly instantiate the DSI device you can
> >>>>>>easily write a driver for it, and the driver will set up the correct
> >>>>>>properties as implied by the compatible string. Once you have that =
you
> >>>>>>can easily hook it up to the I2C control interface in whatever way =
you
> >>>>>>like, be that an OF graph or just a simple unidirectional link by
> >>>>>>phandle.
> >>>>>>
> >>>>>
> >>>>>With the fused approach you suggested, we would have 2 drivers: one =
i2c
> >>>>>and the other dsi. The i2c client driver would be more or less minim=
al,
> >>>>>preparing an i2c_client device for the dsi driver to use. Is my
> >>>>>understanding correct?
> >>>>
> >>>>Correct. That's kind of similar to the way an HDMI encoder driver wou=
ld
> >>>>use an I2C adapter to query EDID. The i2c_client device would be a me=
ans
> >>>>for the DSI driver to access the control interface.
> >>>
> >>>Okay.
> >>>
> >>>Although, I'm not sure about the HDMI encoder example. An HDMI
> >>>encoder would read off edid directly from the adapter(with an address
> >>>specified), it wouldn't need to create an i2c client device. Therefore,
> >>>an HDMI encoder wouldn't need to have a separate node for i2c in DT.
> >>>
> >>>>
> >>>>>We can do without dummy dsi devices with this method. But, represent=
ing
> >>>>>a device with 2 DT nodes seems a bit off. We'd also need to compatib=
le
> >>>>>strings for the same device, one for the i2c part, and the other for
> >>>>>the dsi part.
> >>>>
> >>>>I agree that this somewhat stretches the capabilities of device tree.
> >>>>Another alternative I guess would be to not have a compatible string =
for
> >>>>the I2C device at all (that's technically not valid, I guess) because=
 we
> >>>>really don't need an I2C driver for the device. What we really need i=
s a
> >>>>DSI driver with a means to talk over some I2C bus with some other part
> >>>>of its device.
> >>>
> >>>I think what the driver should 'really' be is a bit subjective, and can
> >>>vary based on what the buses are used for in the device. For the Toshi=
ba
> >>>chip that Jani mentioned, it tends more towards a DSI driver. Whereas,
> >>>for an ADV75xx chip, it's closer to an I2C driver since only I2C can be
> >>>used to configure the chip registers.
> >>>
> >>>Although, I agree with the point you made about the DSI bus here:
> >>>
> >>>"and the DSI interface may even be crippled, but the device is still
> >>>addressable from the DSI host controller, if for nothing else than for
> >>>routing the video stream."
> >>>
> >>>The fact that the data on the DSI bus contains routing information (i.=
e,
> >>>virtual channel number) always gives it some 'control' aspect.
> >>>
> >>>>
> >>>>>  From an adv75xx driver perspective, it should also support the ADV=
7511
> >>>>>chip, which is a RGB/DPI to HDMI encoder. For adv7511, we don't need=
 a
> >>>>>DSI DT node. It would be a bit inconsistent to have the bindings
> >>>>>require both DSI and I2C nodes for one chip, and only I2C node for t=
he
> >>>>>other, with both chips being supported by the same driver.
> >>>>
> >>>>Why would that be inconsistent? That sounds like the most accurate
> >>>>representation of the hardware to me.
> >>>
> >>>Inconsistent wasn't the right term. I should have used 'uncommon' :)
> >>>It's common for two chips of the same family to have a different set
> >>>optional properties in DT, but it's not common for two chips of the
> >>>same family to be represented by a different number of devices in
> >>>DT.
> >>>
> >>>I don't have an issue with the fused approach you suggested, as long
> >>>as people are okay with the DT parts. Especially the part of needing 2
> >>>compatible strings in the DT.
> >>
> >>I implemented the ADV7533 driver with the approach you suggested above
> >>(2 drivers for 2 different components of the chip). I posted it out
> >>just a while back (with you in loop).
> >>
> >>The DT node with this apporach would look like this:
> >>
> >>https://github.com/boddob/linux/blob/c24cbf63a6998d00095c10122ce5e37b76=
4c7dba/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi#L162
> >>
> >>The main irritant with the '2 driver' approach is that we need to
> >>share the per-device driver data with them. For ADV7533, I've made
> >>the i2c driver allocate driver data (struct adv7511).
> >>
> >>The dsi driver gets the driver data in the following way:
> >>
> >>- The i2c driver sets the driver data as its client data using
> >>    i2c_set_clientdata()
> >>- Parse the i2c-control phandle to get the corresponding i2c client.
> >>- Extract the adv7511 struct by getting i2c_get_clientdata()
> >>
> >>This way of getting the same driver data is a bit strange, but it
> >>works. For this, we do need to ensure that the dsi driver defers
> >>as long as the i2c driver isn't probed.
> >>
> >>I've now implemented both approaches for the driver. The first using
> >>a dummy dsi device, and this one using 2 drivers (with both being
> >>represented in DT). The advantage of the latter is that we don't need
> >>to create any dummy device stuff, the disadvantage is that DT is a bit
> >>uncommon.
> >>
> >>Can we now come to a conclusion on what approach is better?
> >
> >DSI by design is data bus which can be used additionally as a control bu=
s, but
> >in this particular case it is purely data bus. So of-graph bindings seem=
 to be
> >better choice. As already Lucas Stach said DT hierarchy should describe =
control
> >buses and of-graph bindings should describe data bus. Argument that hw h=
as two
> >interfaces does not seem to be valid here - it has only one control inte=
rface.
> >The other one is only for data, representing every data interface using =
DT
> >hierarchy would lead to inflation of pseudo devices.
> >
> >On the other side I do not see dummy device approach ideal solution, I g=
uess
> >lightweight framework providing DSI hosts detached from Linux device mod=
el could
> >work better here.
> >The only problem here is that it should coexist somehow with dsi bus use=
d to
> >control devices. Anyway implementing it shouldn't be hard, question is i=
f it
> >would be eventually accepted :) I guess we can live for now with dummy d=
evs.
> >
> >Summarizing I would prefer version with dummy devices, as it seems more
> >compatible with DT design.
>=20
> Thanks for the feedback. I'll spin a newer version of the dummy dsi dev
> patches after waiting for some more comments.

Let's wait for someone from the device tree maintainers to comment
instead of going around in circles.

Thierry

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV8TIiAAoJEN0jrNd/PrOhKUwP/AgMN4sPL78OC30l//P/cNzk
sio6rL0KSbHTUq2zTNd2EPy0m1651fIVajHjDbglxTsf/FElq+gwqkjNeXrS5lID
F+DfSRF6CUc/fFwUrRF4urlbePx0q9AY4BC5LA877njCH5fy4KNQPHPuHvLYhI+U
bPIeRQqAntF6fLPuL+YwjWkV2VlEl+RPs3AlSWlQVNm+8LrokIN+5RVLKJhH10TI
H+i8ku2NrCY/krfAjmyMIrTXG/4ZGZwpEB6LeJCQTB3P2vX+rSP+bq8OoqZqTob7
IYVtsq7FC7omGBcrXyWOUr27TdI320dZlzK75SDKJgQNZuubUvxFM1HPxE/0W1bv
5mfr0VW+XFsxEbInVvbMur81cIg4Fjfgf4U8+oAnDb4UnR/4g5kXmkkFzu+gK/X4
5BPrmnRBVt9HMXIAiZuiNX3hl4/obAjd3HQ4mZFdiurmxecIxFRiT5Im50I3GC4Z
5yfd+c9oLWkX/t4WGkDH5tnun1NH6GX8sskAXlaF7lZi9GwtKTnD/o6OijZzNqeN
mjRPA20rmi53CK6WrZ2q8hubRb8JPHh3CWYH+R0VnndU9jqLANK4FUpR+x0y6atR
esutjTY1FtNEwoI19aHgxxTiiK2M6DOY3LuiewPGcY7t4I6oJMZDOtFUp1MDPKF3
5nEAolYBRo7hFARO9A/c
=AdtE
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--

--===============0962716216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0962716216==--
