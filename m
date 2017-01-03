From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC PATCH 0/5] overlay: tool to convert old overlay style dts to new style
Date: Tue, 3 Jan 2017 14:13:53 +0200
Message-ID: <00322597-9F32-42AC-925A-38E977046F24@konsulko.com>
References: <1482909617-31950-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482909617-31950-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Frank,

> On Dec 28, 2016, at 09:20 , frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>=20
> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>=20
> In response to "Subject: Re: [PATCH v11 5/7] overlay: Documentation =
for the
> overlay sugar syntax" I suggested a tool to convert the old style of =
dts
> overlay files to use the new syntactic sugar [1]:
>=20
>>>> I can imagine some reasons to support the fully written out =
version,
>>>> but can we document what those reasons are?
>>>=20
>>> I believe the main one is the dts files in this format out in the
>>> field.  Mind you, I guess we're already requiring them to tweak how
>>> they declare the /plugin/ option.
>>=20
>> It might be easy to write a program that transforms the expanded
>> format to the simple format.  I'll try to make some time to see
>> how difficult it is.  The transformation is relatively easy to
>> do manually, but I don't know how many dts files would need to
>> be converted.
>=20
> My goal is to minimize legacy issues of dts files that expose the
> internal implementation of overlays, such as the fragment and
> __overlay__ nodes.  Pantelis has submitted the dtc patches to add
> the necessary syntactic sugar, and these appear to be moving toward
> acceptance.
>=20
> I have created a perl script to create a new style dts overlay file
> from an old style dts overlay file.  I have also created a shell
> script to provide some error checking and to validate that the
> new dts file compiles to the same result as the old dts file.
>=20
> I treat the issue as a simplistic text processing exercise instead
> of using a more complex approach with the hope that this is
> sufficient to process the bulk of the existing in the wild overlay
> dts files.
>=20
> I do not think it is worth cluttering the dtc git repo with these
> tools, but have no objection to them being hosted there if David
> prefers.  I can host them on github, elinux.org, or anywhere else
> that makes sense for a (hopefully) short lived tool.
>=20
> Patches 3, 4, and 5 are sample old style dts overlay files and
> are not intended to be committed.
>=20
> Following are several examples of use.  One example that converts
> properly and two that show how convsersion a malformed old style
> dts is reported.
>=20
> -----  example 1
>=20
> $ export PATH=3D"$PATH:/home/frowand/nobackup/src/github_pantelis/dtc/"
> $ ./overlay_convert_old_to_new a.dts b.dts
>=20
> $ cat a.dts
> /dts-v1/;
> /plugin/;
>=20
> / {
> 	fragment@0 {
> 		target =3D <&am3353x_pinmux>;
>=20
> 		__overlay__ {
>=20
> 			i2c1_pins: pinmux_i2c1_pins {
> 				pinctrl-single,pins =3D <
> 					0x158 0x72
> 					0x15c 0x72
> 				>;
> 			};
> 		};
> 	};
>=20
> 	fragment@1 {
> 		target =3D <&i2c1>;
>=20
> 		__overlay__ {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
> 			pinctrl-names =3D "default";
> 			pinctrl-0 =3D <&i2c1_pins>;
> 			clock-frequency =3D <400000>;
> 			status =3D "okay";
>=20
> 			at24@50 {
> 				compatible =3D "at,24c256";
> 				pagesize =3D <64>;
> 				reg =3D <0x50>;
> 			};
> 		};
> 	};
> };
> $ cat b.dts
> /dts-v1/;
> /plugin/;
>=20
> 		&am3353x_pinmux {
>=20
> 			i2c1_pins: pinmux_i2c1_pins {
> 				pinctrl-single,pins =3D <
> 					0x158 0x72
> 					0x15c 0x72
> 				>;
> 			};
> 		};
>=20
> 		&i2c1 {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
> 			pinctrl-names =3D "default";
> 			pinctrl-0 =3D <&i2c1_pins>;
> 			clock-frequency =3D <400000>;
> 			status =3D "okay";
>=20
> 			at24@50 {
> 				compatible =3D "at,24c256";
> 				pagesize =3D <64>;
> 				reg =3D <0x50>;
> 			};
> 		};
> $ diff -u a.dts b.dts
> --- a.dts	2016-12-27 15:51:36.433101164 -0800
> +++ b.dts	2016-12-27 22:01:28.541530464 -0800
> @@ -1,11 +1,7 @@
> /dts-v1/;
> /plugin/;
>=20
> -/ {
> -	fragment@0 {
> -		target =3D <&am3353x_pinmux>;
> -
> -		__overlay__ {
> +		&am3353x_pinmux {
>=20
> 			i2c1_pins: pinmux_i2c1_pins {
> 				pinctrl-single,pins =3D <
> @@ -14,12 +10,8 @@
> 				>;
> 			};
> 		};
> -	};
> -
> -	fragment@1 {
> -		target =3D <&i2c1>;
>=20
> -		__overlay__ {
> +		&i2c1 {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
> 			pinctrl-names =3D "default";
> @@ -33,5 +25,3 @@
> 				reg =3D <0x50>;
> 			};
> 		};
> -	};
> -};
>=20
>=20
> -----  example 2
>=20
> $ export PATH=3D"$PATH:/home/frowand/nobackup/src/github_pantelis/dtc/"
> $ ./overlay_convert_old_to_new bad_a_1.dts bad_b_1.dts
> No 'target' property in node fragment@0
>=20
> ERROR: unable to convert bad_a_1.dts
>=20
> $ cat bad_a_1.dts
> /dts-v1/;
> /plugin/;
>=20
> / {
> 	fragment@0 {
>=20
> 		__overlay__ {
>=20
> 			i2c1_pins: pinmux_i2c1_pins {
> 				pinctrl-single,pins =3D <
> 					0x158 0x72
> 					0x15c 0x72
> 				>;
> 			};
> 		};
> 	};
>=20
> 	fragment@1 {
> 		target =3D <&i2c1>;
>=20
> 		__overlay__ {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
> 			pinctrl-names =3D "default";
> 			pinctrl-0 =3D <&i2c1_pins>;
> 			clock-frequency =3D <400000>;
> 			status =3D "okay";
>=20
> 			at24@50 {
> 				compatible =3D "at,24c256";
> 				pagesize =3D <64>;
> 				reg =3D <0x50>;
> 			};
> 		};
> 	};
> };
>=20
>=20
> -----  example 3
>=20
> $ export PATH=3D"$PATH:/home/frowand/nobackup/src/github_pantelis/dtc/"
> $ ./overlay_convert_old_to_new bad_a_2.dts bad_b_2.dts
> No 'target' property in node fragment@1
>=20
> ERROR: unable to convert bad_a_2.dts
>=20
> $ cat bad_a_2.dts
> /dts-v1/;
> /plugin/;
>=20
> / {
> 	fragment@0 {
> 		target =3D <&am3353x_pinmux>;
>=20
> 		__overlay__ {
>=20
> 			i2c1_pins: pinmux_i2c1_pins {
> 				pinctrl-single,pins =3D <
> 					0x158 0x72
> 					0x15c 0x72
> 				>;
> 			};
> 		};
> 	};
>=20
> 	fragment@1 {
>=20
> 		__overlay__ {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
> 			pinctrl-names =3D "default";
> 			pinctrl-0 =3D <&i2c1_pins>;
> 			clock-frequency =3D <400000>;
> 			status =3D "okay";
>=20
> 			at24@50 {
> 				compatible =3D "at,24c256";
> 				pagesize =3D <64>;
> 				reg =3D <0x50>;
> 			};
> 		};
> 	};
> };
>=20
>=20
>=20
> [1] http://www.spinics.net/lists/devicetree/msg152891.html
>=20

Very interesting and helpful.

Thanks for the good work. I would support converting all overlays in the =
wild
to the new format to get going on the connector problem.

> Frank Rowand (5):
>  perl script to convert dts from old overlay style to new overlay =
style
>  shell script to make overlay_convert easier to use
>  a.dts: example of an old style dts file to be converted
>  bad_a_1.dts: example of an old style dts file unable to be converted
>  bad_a_2.dts: example of an old style dts file to be converted
>=20

Regards

=E2=80=94 Pantelis
