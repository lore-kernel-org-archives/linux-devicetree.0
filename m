From: <Alexander.Steffen-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org>
Subject: Problem with commit to add overlay symbols to live device tree
Date: Thu, 19 Oct 2017 17:06:06 +0000
Message-ID: <85c5a40bb6eb4d4ebe522b3034528a36@infineon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frank.rowand-7U/KSKJipcs@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Frank, Rob,

I ran some tests with kernel v4.14-rc2, where I came across an issue with y=
our commit "of: overlay: add overlay symbols to live device tree" (d1651b03=
c2df75db8eda3fbcd3a07adb337ee8b0, https://git.kernel.org/pub/scm/linux/kern=
el/git/torvalds/linux.git/commit/drivers/of?h=3Dv4.14-rc5&id=3Dd1651b03c2df=
75db8eda3fbcd3a07adb337ee8b0). I am not sure whether this is a problem with=
 your change or whether I made a mistake somewhere.

Without this commit, the following device tree overlay works fine on a Rasp=
berry Pi:

/dts-v1/;
/plugin/;

/ {
	fragment@0 {
		target-path =3D "/soc/spi@7e204000";
		__overlay__ {
			#address-cells =3D <1>;
			#size-cells =3D <0>;
			status =3D "okay";

		        spidev1: spi@1 {
				compatible =3D "spidev";
				reg =3D <1>;
				spi-max-frequency =3D <5000000>;
			};
		};
	};
};

But with the commit, it is rejected:

OF: overlay: no symbols in root of device tree.
OF: overlay: of_build_overlay_info() failed for tree@/
create_overlay: Failed to create overlay (err=3D-22)

Only if I remove the spidev1 label, it continues to work with the commit (b=
ut this is not always possible in more complex overlays).

I hope this does not make a difference, but I use the configfs interface to=
 load the overlay, that is not part of mainline, but shipped by several dis=
tributions nonetheless (for example in the Raspberry Pi kernel, https://git=
hub.com/raspberrypi/linux/commit/cccc24635da69799335566eb464a4c9e1fb4a8ad).

Could you tell me whether this change in behavior is intentional and whethe=
r I have to fix something in my usage?

Thanks
Alexander
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
