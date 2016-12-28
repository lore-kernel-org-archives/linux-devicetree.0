From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [RFC PATCH 0/5] overlay: tool to convert old overlay style dts to new style
Date: Tue, 27 Dec 2016 23:20:12 -0800
Message-ID: <1482909617-31950-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

In response to "Subject: Re: [PATCH v11 5/7] overlay: Documentation for the
overlay sugar syntax" I suggested a tool to convert the old style of dts
overlay files to use the new syntactic sugar [1]:

>>> I can imagine some reasons to support the fully written out version,
>>> but can we document what those reasons are?
>> 
>> I believe the main one is the dts files in this format out in the
>> field.  Mind you, I guess we're already requiring them to tweak how
>> they declare the /plugin/ option.
>
> It might be easy to write a program that transforms the expanded
> format to the simple format.  I'll try to make some time to see
> how difficult it is.  The transformation is relatively easy to
> do manually, but I don't know how many dts files would need to
> be converted.

My goal is to minimize legacy issues of dts files that expose the
internal implementation of overlays, such as the fragment and
__overlay__ nodes.  Pantelis has submitted the dtc patches to add
the necessary syntactic sugar, and these appear to be moving toward
acceptance.

I have created a perl script to create a new style dts overlay file
from an old style dts overlay file.  I have also created a shell
script to provide some error checking and to validate that the
new dts file compiles to the same result as the old dts file.

I treat the issue as a simplistic text processing exercise instead
of using a more complex approach with the hope that this is
sufficient to process the bulk of the existing in the wild overlay
dts files.

I do not think it is worth cluttering the dtc git repo with these
tools, but have no objection to them being hosted there if David
prefers.  I can host them on github, elinux.org, or anywhere else
that makes sense for a (hopefully) short lived tool.

Patches 3, 4, and 5 are sample old style dts overlay files and
are not intended to be committed.

Following are several examples of use.  One example that converts
properly and two that show how convsersion a malformed old style
dts is reported.

-----  example 1

$ export PATH="$PATH:/home/frowand/nobackup/src/github_pantelis/dtc/"
$ ./overlay_convert_old_to_new a.dts b.dts

$ cat a.dts
/dts-v1/;
/plugin/;

/ {
	fragment@0 {
		target = <&am3353x_pinmux>;

		__overlay__ {

			i2c1_pins: pinmux_i2c1_pins {
				pinctrl-single,pins = <
					0x158 0x72
					0x15c 0x72
				>;
			};
		};
	};

	fragment@1 {
		target = <&i2c1>;

		__overlay__ {
			#address-cells = <1>;
			#size-cells = <0>;
			pinctrl-names = "default";
			pinctrl-0 = <&i2c1_pins>;
			clock-frequency = <400000>;
			status = "okay";

			at24@50 {
				compatible = "at,24c256";
				pagesize = <64>;
				reg = <0x50>;
			};
		};
	};
};
$ cat b.dts
/dts-v1/;
/plugin/;

		&am3353x_pinmux {

			i2c1_pins: pinmux_i2c1_pins {
				pinctrl-single,pins = <
					0x158 0x72
					0x15c 0x72
				>;
			};
		};

		&i2c1 {
			#address-cells = <1>;
			#size-cells = <0>;
			pinctrl-names = "default";
			pinctrl-0 = <&i2c1_pins>;
			clock-frequency = <400000>;
			status = "okay";

			at24@50 {
				compatible = "at,24c256";
				pagesize = <64>;
				reg = <0x50>;
			};
		};
$ diff -u a.dts b.dts
--- a.dts	2016-12-27 15:51:36.433101164 -0800
+++ b.dts	2016-12-27 22:01:28.541530464 -0800
@@ -1,11 +1,7 @@
 /dts-v1/;
 /plugin/;
 
-/ {
-	fragment@0 {
-		target = <&am3353x_pinmux>;
-
-		__overlay__ {
+		&am3353x_pinmux {
 
 			i2c1_pins: pinmux_i2c1_pins {
 				pinctrl-single,pins = <
@@ -14,12 +10,8 @@
 				>;
 			};
 		};
-	};
-
-	fragment@1 {
-		target = <&i2c1>;
 
-		__overlay__ {
+		&i2c1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			pinctrl-names = "default";
@@ -33,5 +25,3 @@
 				reg = <0x50>;
 			};
 		};
-	};
-};


-----  example 2

$ export PATH="$PATH:/home/frowand/nobackup/src/github_pantelis/dtc/"
$ ./overlay_convert_old_to_new bad_a_1.dts bad_b_1.dts
No 'target' property in node fragment@0

ERROR: unable to convert bad_a_1.dts

$ cat bad_a_1.dts
/dts-v1/;
/plugin/;

/ {
	fragment@0 {

		__overlay__ {

			i2c1_pins: pinmux_i2c1_pins {
				pinctrl-single,pins = <
					0x158 0x72
					0x15c 0x72
				>;
			};
		};
	};

	fragment@1 {
		target = <&i2c1>;

		__overlay__ {
			#address-cells = <1>;
			#size-cells = <0>;
			pinctrl-names = "default";
			pinctrl-0 = <&i2c1_pins>;
			clock-frequency = <400000>;
			status = "okay";

			at24@50 {
				compatible = "at,24c256";
				pagesize = <64>;
				reg = <0x50>;
			};
		};
	};
};


-----  example 3

$ export PATH="$PATH:/home/frowand/nobackup/src/github_pantelis/dtc/"
$ ./overlay_convert_old_to_new bad_a_2.dts bad_b_2.dts
No 'target' property in node fragment@1

ERROR: unable to convert bad_a_2.dts

$ cat bad_a_2.dts
/dts-v1/;
/plugin/;

/ {
	fragment@0 {
		target = <&am3353x_pinmux>;

		__overlay__ {

			i2c1_pins: pinmux_i2c1_pins {
				pinctrl-single,pins = <
					0x158 0x72
					0x15c 0x72
				>;
			};
		};
	};

	fragment@1 {

		__overlay__ {
			#address-cells = <1>;
			#size-cells = <0>;
			pinctrl-names = "default";
			pinctrl-0 = <&i2c1_pins>;
			clock-frequency = <400000>;
			status = "okay";

			at24@50 {
				compatible = "at,24c256";
				pagesize = <64>;
				reg = <0x50>;
			};
		};
	};
};



[1] http://www.spinics.net/lists/devicetree/msg152891.html

Frank Rowand (5):
  perl script to convert dts from old overlay style to new overlay style
  shell script to make overlay_convert easier to use
  a.dts: example of an old style dts file to be converted
  bad_a_1.dts: example of an old style dts file unable to be converted
  bad_a_2.dts: example of an old style dts file to be converted
