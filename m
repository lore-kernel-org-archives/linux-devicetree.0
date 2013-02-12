From: "Vijay S" <vijay-EvXpCiN+lbve9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Reg:Trying to get the ADC working on the Beaglebone with 3.8 kernel
Date: Tue, 12 Feb 2013 18:49:19 +0530
Message-ID: <000001ce0923$9d97f510$ad0fa8c0@mistral.in>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_NextPart_000_0001_01CE0951.B7527B00"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.

------=_NextPart_000_0001_01CE0951.B7527B00
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0002_01CE0951.B7527B00"


------=_NextPart_001_0002_01CE0951.B7527B00
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Am trying to get the ADC working on the beagle bone. Have cloned/pulled the
latest kernel from the following branch
https://github.com/beagleboard/kernel/tree/3.8 , applied the patches and
built the kernel. 

 

Have included the below structure under the am335x-bone-common.dtsi
(attached herewith is the dts file for your reference)

 

tscadc@44e0d000 {

                                    status = "okay";

                                    compatible = "ti,ti-tscadc";

                                    reg = <0x44e0d000 0x1000>;

                        interrupt-parent = <&intc>;

                        interrupts = <16>;

                        ti,hwmods = "adc_tsc";

            };

 

&tscadc {

        tsc {

              ti,wires = <4>;

            ti,x-plate-resistance = <200>;

               ti,steps-to-configure = <5>;

             ti,wire-config = <0x00 0x11 0x22 0x33>;

        };

 

        adc {

                ti,adc-channels = <8>;

        };

 

 

The device is getting registered( [1.578678] input: ti-tsc as
/devices/ocp.2/44e0d000.tscadc/tsc/input/input0

[    1.586799] tsc tsc: Initialized OK) as can be seen from the attached
kernel log(3.8_kernel_ts_adc_sys_iio_devices.txt).

 

Am able to view the "tiadc" under the devices in the following path  cat
/sys/devices/ocp.2/44e0d000.tscadc/tiadc/iio\:device0/  and cat
/sys/bus/iio/devices/iio\:device0/ , but am not able to list out
"in_voltageX_raw" in either of the paths. 

 

Can you please suggest if am missing anything?

 

Regards,

Vijay

 


------=_NextPart_001_0002_01CE0951.B7527B00
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Batang;
	panose-1:2 3 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Century Gothic";
	panose-1:2 11 5 2 2 2 2 2 2 4;}
@font-face
	{font-family:"\@Batang";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Century Gothic";
	color:black;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
@page Section1
	{size:8.5in 11.0in;
	margin:.3in 1.0in .3in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3D"Century =
Gothic"><span
style=3D'font-size:10.0pt;font-family:"Century =
Gothic";color:black'>Hi,<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century Gothic"'>Am
trying to get the ADC working on the beagle bone. Have cloned/pulled the =
latest
kernel from the following branch <a
href=3D"https://github.com/beagleboard/kernel/tree/3.8">https://github.co=
m/beagleboard/kernel/tree/3.8</a>
, applied the patches and built the kernel. =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century Gothic"'>Have
included the below structure under the am335x-bone-common.dtsi (attached
herewith is the dts file for your =
reference)<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century Gothic"'>tscadc@44e0d000
{<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 status
=3D &quot;okay&quot;;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 compatible
=3D &quot;ti,ti-tscadc&quot;;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 reg
=3D &lt;0x44e0d000 0x1000&gt;;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;interru=
pt-parent =3D &lt;&amp;intc&gt;;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;
interrupts =3D &lt;16&gt;;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;
ti,hwmods =3D &quot;adc_tsc&quot;;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; };<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century Gothic"'>&amp;tscadc
{<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
tsc {<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;
ti,wires =3D &lt;4&gt;;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;
ti,x-plate-resistance =3D &lt;200&gt;;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;
ti,steps-to-configure =3D &lt;5&gt;;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;
ti,wire-config =3D &lt;0x00 0x11 0x22 =
0x33&gt;;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
};<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
adc {<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;
ti,adc-channels =3D &lt;8&gt;;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
};<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century Gothic"'>The
device is getting registered( [1.578678] input: ti-tsc as
/devices/ocp.2/44e0d000.tscadc/tsc/input/input0<o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>[&nbsp;&nbsp;&nbsp;
1.586799] tsc tsc: Initialized OK) as can be seen from the attached =
kernel
log(3.8_kernel_ts_adc_sys_iio_devices.txt).<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century Gothic"'>Am
able to view the &quot;tiadc&quot; under the devices in the following =
path&nbsp; cat
/sys/devices/ocp.2/44e0d000.tscadc/tiadc/iio\:device0/&nbsp; and cat
/sys/bus/iio/devices/iio\:device0/ , but am not able to list out
&quot;in_voltageX_raw&quot; in either of the paths. =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century Gothic"'>Can
you please suggest if am missing anything?<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>Regards,<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century =
Gothic"'>Vijay<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dblack face=3D"Century =
Gothic"><span
style=3D'font-size:10.0pt;font-family:"Century =
Gothic";color:black'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_001_0002_01CE0951.B7527B00--

------=_NextPart_000_0001_01CE0951.B7527B00
Content-Type: text/plain;
	name="3.8_kernel_ts_adc_sys_iio_device.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="3.8_kernel_ts_adc_sys_iio_device.txt"

=F0
U-Boot SPL 2012.10-rc3-00001-g786b399-dirty (Oct 26 2012 - 18:46:02)
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2012.10-rc3-00001-g786b399-dirty (Oct 26 2012 - 18:46:02)

I2C:   ready
DRAM:  512 MiB
WARNING: Caches not enabled
MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
Using default environment

Net:   cpsw
Hit any key to stop autoboot:  1  0=20
SD/MMC found on device 0
reading uEnv.txt

226 bytes read
Loaded environment from uEnv.txt
Importing environment from mmc ...
Running uenvcmd ...
Loading file "/boot/uImage" from mmc device 0:2
4487576 bytes read
Loading file "/boot/am335x-bonelt.dtb" from mmc device 0:2
21444 bytes read
## Booting kernel from Legacy Image at 80200000 ...
   Image Name:   Linux-3.8.0-rc6-00407-gd25e1e4-d
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    4487512 Bytes =3D 4.3 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 80f80000
   Booting using the fdt blob at 0x80f80000
   Loading Kernel Image ... OK
OK
   Loading Device Tree to 9fe62000, end 9fe6a3c3 ... OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 3.8.0-rc6-00407-gd25e1e4-dirty =
(root@mistral-Veriton-Series) (gcc version 4.5.3 20110311 (prerelease) =
(GCC) ) #1 SMP Mon Feb 11 20:13:10 IST 2013
[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), =
cr=3D10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing =
instruction cache
[    0.000000] Machine: Generic AM33XX (Flattened Device Tree), model: =
TI AM335x BeagleBone
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] AM335X ES1.0 (neon )
[    0.000000] PERCPU: Embedded 9 pages/cpu @c0cb4000 s13888 r8192 =
d14784 u36864
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  =
Total pages: 129792
[    0.000000] Kernel command line: console=3DttyO0,115200n8 =
consoleblank=3D0 root=3D/dev/mmcblk0p2 ro rootfstype=3Dext4 rootwait
[    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
[    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 =
bytes)
[    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 =
bytes)
[    0.000000] __ex_table already sorted, skipping sort
[    0.000000] Memory: 511MB =3D 511MB total
[    0.000000] Memory: 509784k/509784k available, 14504k reserved, 0K =
highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xe0800000 - 0xff000000   ( 488 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xe0000000   ( 512 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0xc0008000 - 0xc076d58c   (7574 kB)
[    0.000000]       .init : 0xc076e000 - 0xc07b3640   ( 278 kB)
[    0.000000]       .data : 0xc07b4000 - 0xc082a1d8   ( 473 kB)
[    0.000000]        .bss : 0xc082a1d8 - 0xc08a5040   ( 492 kB)
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	RCU restricting CPUs from NR_CPUS=3D4 to nr_cpu_ids=3D1.
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] IRQ: Found an INTC at 0xfa200000 (revision 5.0) with 128 =
interrupts
[    0.000000] Total of 128 interrupts on 1 active controller
[    0.000000] OMAP clockevent source: GPTIMER1 at 24000000 Hz
[    0.000000] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps =
every 178956ms
[    0.000000] OMAP clocksource: GPTIMER2 at 24000000 Hz
[    0.000000] Console: colour dummy device 80x30
[    0.000374] Calibrating delay loop... 363.67 BogoMIPS (lpj=3D354304)
[    0.017385] pid_max: default: 32768 minimum: 301
[    0.017636] Security Framework initialized
[    0.017736] Mount-cache hash table entries: 512
[    0.026618] CPU: Testing write buffer coherency: ok
[    0.027303] CPU0: thread -1, cpu 0, socket -1, mpidr 0
[    0.027387] Setting up static identity map for 0x80516860 - =
0x805168b8
[    0.028975] Brought up 1 CPUs
[    0.029001] SMP: Total of 1 processors activated (363.67 BogoMIPS).
[    0.030316] devtmpfs: initialized
[    0.094081] pinctrl core: initialized pinctrl subsystem
[    0.094768] regulator-dummy: no parameters
[    0.095294] NET: Registered protocol family 16
[    0.096165] DMA: preallocated 256 KiB pool for atomic coherent =
allocations
[    0.096511] omap-gpmc omap-gpmc: GPMC revision 6.0
[    0.096544] omap-gpmc omap-gpmc: failed to reserve memory
[    0.096598] omap-gpmc: probe of omap-gpmc failed with error -16
[    0.106359] pinctrl-single 44e10800.pinmux: prop pinctrl-0 index 0 =
invalid phandle
[    0.106550] pinctrl-single 44e10800.pinmux: 142 pins at pa f9e10800 =
size 568
[    0.107365] platform 49000000.edma: alias fck already exists
[    0.107398] platform 49000000.edma: alias fck already exists
[    0.107423] platform 49000000.edma: alias fck already exists
[    0.108752] OMAP GPIO hardware version 0.1
[    0.118348] hw-breakpoint: debug architecture 0x4 unsupported.
[    0.120598] cpsw.0: No hwaddr in dt. Using bc:6a:29:7a:f6:8d from =
efuse
[    0.120631] cpsw.1: No hwaddr in dt. Using bc:6a:29:7a:f6:8f from =
efuse
[    0.130856] bio: create slab <bio-0> at 0
[    0.142189] edma-dma-engine edma-dma-engine.0: TI EDMA DMA engine =
driver
[    0.144958] SCSI subsystem initialized
[    0.145437] usbcore: registered new interface driver usbfs
[    0.145579] usbcore: registered new interface driver hub
[    0.145913] usbcore: registered new device driver usb
[    0.148068] omap_i2c 44e0b000.i2c: bus 0 rev0.11 at 400 kHz
[    0.150578] DCDC1: at 1350 mV=20
[    0.151753] vdd_mpu: 925 <--> 1325 mV at 1100 mV=20
[    0.152951] vdd_core: 925 <--> 1150 mV at 1100 mV=20
[    0.154051] LDO1: at 1800 mV=20
[    0.155244] LDO2: at 3300 mV=20
[    0.156407] LDO3: 1800 <--> 3300 mV at 1800 mV=20
[    0.157509] LDO4: at 3300 mV=20
[    0.158606] tps65217 0-0024: TPS65217 ID 0xe version 1.2
[    0.159391] omap_i2c 44e0b000.i2c: unable to select pin group
[    0.160257] omap_i2c 4819c000.i2c: bus 1 rev0.11 at 100 kHz
[    0.162864] omap_i2c 4819c000.i2c: unable to select pin group
[    0.163683] Advanced Linux Sound Architecture Driver Initialized.
[    0.165078] Switching to clocksource gp_timer
[    0.216695] NET: Registered protocol family 2
[    0.217794] TCP established hash table entries: 4096 (order: 3, 32768 =
bytes)
[    0.218026] TCP bind hash table entries: 4096 (order: 4, 81920 bytes)
[    0.218177] TCP: Hash tables configured (established 4096 bind 4096)
[    0.218283] TCP: reno registered
[    0.218309] UDP hash table entries: 256 (order: 1, 12288 bytes)
[    0.218350] UDP-Lite hash table entries: 256 (order: 1, 12288 bytes)
[    0.218780] NET: Registered protocol family 1
[    0.219453] RPC: Registered named UNIX socket transport module.
[    0.219477] RPC: Registered udp transport module.
[    0.219490] RPC: Registered tcp transport module.
[    0.219503] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.220657] CPU PMU: probing PMU on CPU 0
[    0.220695] hw perfevents: enabled with ARMv7 Cortex-A8 PMU driver, 5 =
counters available
[    0.221211] omap2_mbox_probe: platform not supported
[    0.460431] VFS: Disk quotas dquot_6.5.2
[    0.460693] Dquot-cache hash table entries: 1024 (order 0, 4096 =
bytes)
[    0.461948] NFS: Registering the id_resolver key type
[    0.462190] Key type id_resolver registered
[    0.462210] Key type id_legacy registered
[    0.462283] jffs2: version 2.2. (NAND) (SUMMARY)  =A9 2001-2006 Red =
Hat, Inc.
[    0.462755] msgmni has been set to 995
[    0.465768] Block layer SCSI generic (bsg) driver version 0.4 loaded =
(major 251)
[    0.465796] io scheduler noop registered
[    0.465812] io scheduler deadline registered
[    0.465865] io scheduler cfq registered (default)
[    0.467154] tps65217-bl tps65217-bl: no platform data provided
[    0.467201] tps65217-bl: probe of tps65217-bl failed with error -22
[    0.468194] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.470783] omap_uart 44e09000.serial: did not get pins for uart0 =
error: -19
[    0.471128] 44e09000.serial: ttyO0 at MMIO 0x44e09000 (irq =3D 88) is =
a OMAP UART0
[    1.134031] console [ttyO0] enabled
[    1.138689] [drm] Initialized drm 1.1.0 20060810
[    1.156971] brd: module loaded
[    1.167304] loop: module loaded
[    1.170766] at24 0-0050: 32768 byte 24c256 EEPROM, writable, 1 =
bytes/write
[    1.178065] at24 1-0054: 32768 byte 24c256 EEPROM, writable, 1 =
bytes/write
[    1.185350] at24 1-0055: 32768 byte 24c256 EEPROM, writable, 1 =
bytes/write
[    1.192628] at24 1-0056: 32768 byte 24c256 EEPROM, writable, 1 =
bytes/write
[    1.199909] at24 1-0057: 32768 byte 24c256 EEPROM, writable, 1 =
bytes/write
[    1.213757] bone-capemgr bone_capemgr.8: Baseboard: =
'A335BONE,00A6,0313=FF=FF=FF=FF8963'
[    1.221560] bone-capemgr bone_capemgr.8: =
compatible-baseboard=3Dti,beaglebone
[    1.258962] bone-capemgr bone_capemgr.8: slot #0: No cape found
[    1.296068] bone-capemgr bone_capemgr.8: slot #1: No cape found
[    1.333177] bone-capemgr bone_capemgr.8: slot #2: No cape found
[    1.370285] bone-capemgr bone_capemgr.8: slot #3: No cape found
[    1.376664] bone-capemgr bone_capemgr.8: initialized OK.
[    1.383468] ti_tscadc 44e0d000.tscadc: Initialized OK.
[    1.390460] OneNAND driver initializing
[    1.395999] usbcore: registered new interface driver asix
[    1.401788] usbcore: registered new interface driver cdc_ether
[    1.408033] usbcore: registered new interface driver smsc95xx
[    1.414150] usbcore: registered new interface driver net1080
[    1.420171] usbcore: registered new interface driver cdc_subset
[    1.426457] usbcore: registered new interface driver zaurus
[    1.432446] usbcore: registered new interface driver cdc_ncm
[    1.439206] Initializing USB Mass Storage driver...
[    1.444527] usbcore: registered new interface driver usb-storage
[    1.450851] USB Mass Storage support registered.
[    1.455875] musb-hdrc: version 6.0, ?dma?, otg (peripheral+host)
[    1.462578] musb-hdrc musb-hdrc.0.auto: pdev->id =3D 0
[    1.467836] musb-hdrc musb-hdrc.0.auto: =
drivers/usb/musb/musb_dsps.c:460 dsps_musb_init: OK
[    1.476827] musb-hdrc musb-hdrc.0.auto: *** mode=3D3
[    1.481883] musb-hdrc musb-hdrc.0.auto: *** power=3D244
[    1.487944] musb-hdrc musb-hdrc.1.auto: pdev->id =3D 1
[    1.493213] musb-hdrc musb-hdrc.1.auto: =
drivers/usb/musb/musb_dsps.c:460 dsps_musb_init: OK
[    1.502185] musb-hdrc musb-hdrc.1.auto: *** mode=3D1
[    1.507244] musb-hdrc musb-hdrc.1.auto: *** power=3D244
[    1.512557] musb-hdrc musb-hdrc.1.auto: MUSB HDRC host driver
[    1.519011] musb-hdrc musb-hdrc.1.auto: new USB bus registered, =
assigned bus number 1
[    1.527493] usb usb1: New USB device found, idVendor=3D1d6b, =
idProduct=3D0002
[    1.534633] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, =
SerialNumber=3D1
[    1.542220] usb usb1: Product: MUSB HDRC host driver
[    1.547446] usb usb1: Manufacturer: Linux =
3.8.0-rc6-00407-gd25e1e4-dirty musb-hcd
[    1.555298] usb usb1: SerialNumber: musb-hdrc.1.auto
[    1.561606] hub 1-0:1.0: USB hub found
[    1.565686] hub 1-0:1.0: 1 port detected
[    1.571297] mousedev: PS/2 mouse device common for all mice
[    1.578678] input: ti-tsc as =
/devices/ocp.2/44e0d000.tscadc/tsc/input/input0
[    1.586799] tsc tsc: Initialized OK
[    1.591745] omap_rtc 44e3e000.rtc: rtc core: registered 44e3e000.rtc =
as rtc0
[    1.599477] i2c /dev entries driver
[    1.603807] Driver for 1-wire Dallas network protocol.
[    1.610727] omap_wdt: OMAP Watchdog Timer Rev 0x01: initial timeout =
60 sec
[    1.618316] cpuidle: using governor ladder
[    1.622653] cpuidle: using governor menu
[    1.627303] omap_hsmmc mmc.3: unable to select pin group
[    1.633207] edma-dma-engine edma-dma-engine.0: allocated channel for =
0:25
[    1.640428] edma-dma-engine edma-dma-engine.0: allocated channel for =
0:24
[    1.648117] mmc.3 supply vmmc_aux not found, using dummy regulator
[    1.655032] omap_hsmmc mmc.3: pins are not configured from the driver
[    1.690857] omap_hsmmc mmc.4: unable to select pin group
[    1.696778] edma-dma-engine edma-dma-engine.0: allocated channel for =
0:3
[    1.703992] edma-dma-engine edma-dma-engine.0: allocated channel for =
0:2
[    1.711557] mmc.4 supply vmmc_aux not found, using dummy regulator
[    1.718246] omap_hsmmc mmc.4: pins are not configured from the driver
[    1.753208] ledtrig-cpu: registered to indicate activity on CPUs
[    1.760095] edma-dma-engine edma-dma-engine.0: allocated channel for =
0:36
[    1.767413] omap-sham 53100000.sham: hw accel on OMAP rev 4.3
[    1.775883] omap-aes 53500000.aes: OMAP AES hw accel rev: 3.2
[    1.782460] edma-dma-engine edma-dma-engine.0: allocated channel for =
0:5
[    1.789598] mmc0: host does not support reading read-only switch. =
assuming write-enable.
[    1.798202] edma-dma-engine edma-dma-engine.0: allocated channel for =
0:6
[    1.806458] usbcore: registered new interface driver usbhid
[    1.812431] usbhid: USB HID core driver
[    1.816569] mmc0: new high speed SDHC card at address 1234
[    1.823003] tiadc tiadc: Initialized
[    1.829464] mmcblk0: mmc0:1234 SA04G 3.63 GiB=20
[    1.835038] TCP: cubic registered
[    1.838612] Initializing XFRM netlink socket
[    1.844276] NET: Registered protocol family 17
[    1.849229]  mmcblk0: p1 p2
[    1.852297] NET: Registered protocol family 15
[    1.858443] Key type dns_resolver registered
[    1.863260] VFP support v0.3: implementor 41 architecture 3 part 30 =
variant c rev 3
[    1.871460] ThumbEE CPU extension supported.
[    1.876036] Registering SWP/SWPB emulation handler
[    1.882256] registered taskstats version 1
[    1.938671] davinci_mdio 4a101000.mdio: davinci mdio revision 1.6
[    1.945149] davinci_mdio 4a101000.mdio: detected phy mask fffffffe
[    1.951662] mmc1: BKOPS_EN bit is not set
[    1.957039] libphy: 4a101000.mdio: probed
[    1.961371] davinci_mdio 4a101000.mdio: phy[0]: device =
4a101000.mdio:00, driver SMSC LAN8710/LAN8720
[    1.971286] Detected MACID =3D bc:6a:29:7a:f6:8d
[    1.976005] cpsw 4a100000.ethernet: NAPI disabled
[    1.982991] omap_rtc 44e3e000.rtc: setting system clock to 2000-01-01 =
00:00:00 UTC (946684800)
[    1.992853] mmc1: new high speed MMC card at address 0001
[    2.001788] ALSA device list:
[    2.004952]   No soundcards found.
[    2.008729] mmcblk1: mmc1:0001 MMC02G 1.78 GiB=20
[    2.014186] mmcblk1boot0: mmc1:0001 MMC02G partition 1 1.00 MiB
[    2.020731] mmcblk1boot1: mmc1:0001 MMC02G partition 2 1.00 MiB
[    2.028901]  mmcblk1: unknown partition table
[    2.035214]  mmcblk1boot1: unknown partition table
[    2.041861]  mmcblk1boot0: unknown partition table
[    2.052887] EXT4-fs (mmcblk0p2): INFO: recovery required on readonly =
filesystem
[    2.060547] EXT4-fs (mmcblk0p2): write access will be enabled during =
recovery
[   17.177077] EXT4-fs (mmcblk0p2): recovery complete
[   17.870519] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data =
mode. Opts: (null)
[   17.879294] VFS: Mounted root (ext4 filesystem) readonly on device =
179:2.
[   17.893166] devtmpfs: mounted
[   17.897460] Freeing init memory: 276K

Welcome to The =C5ngstr=F6m Distribution!

Starting udev Coldplug all Devices...                                    =
     =20
Starting Temporary Directory...                                          =
     =20
Starting Remount API VFS...                                              =
     =20
Starting udev Kernel Device Manager...                                   =
     =20
Starting Journal Service...                                              =
     =20
Started Journal Service                                                [ =
 OK  ]
Starting Apply Kernel Variables...                                       =
     =20
Started Huge Pages File System                                         [ =
 OK  ]
Starting Load Kernel Modules...                                          =
     =20
Starting File System Check on Root Device...                             =
     =20
Started Set Up Additional Binary Formats                               [ =
 OK  ]
Starting POSIX Message Queue File System...                              =
     =20
Starting Debug File System...                                            =
     =20
[   19.709960] udevd[81]: starting version 182
Started udev Kernel Device Manager                                     [ =
 OK  ]
Started Temporary Directory                                            [ =
 OK  ]
Started Apply Kernel Variables                                         [ =
 OK  ]
Started Debug File System                                              [ =
 OK  ]
Started POSIX Message Queue File System                                [ =
 OK  ]
Started Remount API VFS                                                [ =
 OK  ]
Failed to start Load Kernel Modules                                    =
[FAILED]
See 'systemctl status systemd-modules-load.service' for details.         =
     =20
Started Configuration File System                                      [ =
 OK  ]
Started FUSE Control File System                                       [ =
 OK  ]
Started File System Check on Root Device                               [ =
 OK  ]
Starting Remount Root FS...                                              =
     =20
Started udev Coldplug all Devices                                      [ =
 OK  ]
[   20.471345] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
systemd-fsck[87]: Angstrom: clean, 31255/233856 files, 353986/933778 =
blocks
Started Remount Root FS                                                [ =
 OK  ]
Started Machine ID first boot configure                                [ =
 OK  ]
Starting Recreate Volatile Files and Directories...                      =
     =20
Starting Load Random Seed...                                             =
     =20
Started Run pending postinsts                                          [ =
 OK  ]
Started Load Random Seed                                               [ =
 OK  ]
Started Recreate Volatile Files and Directories                        [ =
 OK  ]
Starting Console System Startup Logging...                               =
     =20
Starting Restore Sound Card State...                                     =
     =20
Starting Connection service...                                           =
     =20
Starting Periodic Command Scheduler...                                   =
     =20
Started Periodic Command Scheduler                                     [ =
 OK  ]
Starting Avahi mDNS/DNS-SD Stack...                                      =
     =20
Starting Timestamping service...                                         =
     =20
Started Timestamping service                                           [ =
 OK  ]
Starting Angstrom LED config...                                          =
     =20
Started Angstrom LED config                                            [ =
 OK  ]
Starting Beaglebone cape support...                                      =
     =20
Starting Start usb mass storage gadget...                                =
     =20
Started Start usb mass storage gadget                                  [ =
 OK  ]
Starting Beaglebone 101 presentation...                                  =
     =20
Started Beaglebone 101 presentation                                    [ =
 OK  ]
Starting Cloud9 IDE...                                                   =
     =20
Started Cloud9 IDE                                                     [ =
 OK  ]
Started SSH Key Generation                                             [ =
 OK  ]
Started BeagleBone Tester                                              [ =
 OK  ]
Starting Permit User Sessions...                                         =
     =20
Starting Login Service...                                                =
     =20
Starting pvr-init.service...                                             =
     =20
Starting D-Bus System Message Bus...                                     =
     =20
Started Console System Startup Logging                                 [ =
 OK  ]
Started Restore Sound Card State                                       [ =
 OK  ]
Started Permit User Sessions                                           [ =
 OK  ]
Started D-Bus System Message Bus                                       [ =
 OK  ]
Starting Serial Getty on ttyO0...                                        =
     =20
Started Serial Getty on ttyO0                                          [ =
 OK  ]
Started Beaglebone cape support                                        [ =
 OK  ]
Started pvr-init.service                                               [ =
 OK  ]
Starting Getty on tty1...                                                =
     =20
Started Getty on tty1                                                  [ =
 OK  ]
Started Connection service                                             [ =
 OK  ]
Started Avahi mDNS/DNS-SD Stack                                        [ =
 OK  ]
Started Login Service                                                  [ =
 OK  ]

.---O---.                                          =20
|       |                  .-.           o o       =20
|   |   |-----.-----.-----.| |   .----..-----.-----.
|       |     | __  |  ---'| '--.|  .-'|     |     |
|   |   |  |  |     |---  ||  --'|  |  |  '  | | | |
'---'---'--'--'--.  |-----''----''--'  '-----'-'-'-'
                -'  |
                '---'

The Angstrom Distribution beaglebone ttyO0

Angstrom v2012.05 - Kernel 3.8.0-rc6-00407-gd25e1e4-dirty

beaglebone login: Starting Gnome Display Manager...                      =
                       =20
Started Gnome Display Manager                                          [ =
 OK  ]
[   25.116513] net eth0: initializing cpsw version 1.12 (0)
[   25.152193] net eth0: phy found : id is : 0x7c0f1
[   25.184875] libphy: PHY 4a101000.mdio:01 not found
[   25.189986] net eth0: phy 4a101000.mdio:01 not found on slave 1

.---O---.                                          =20
|       |                  .-.           o o       =20
|   |   |-----.-----.-----.| |   .----..-----.-----.
|       |     | __  |  ---'| '--.|  .-'|     |     |
|   |   |  |  |     |---  ||  --'|  |  |  '  | | | |
'---'---'--'--'--.  |-----''----''--'  '-----'-'-'-'
                -'  |
                '---'

The Angstrom Distribution beaglebone ttyO0

Angstrom v2012.05 - Kernel 3.8.0-rc6-00407-gd25e1e4-dirty

beaglebone login: root
Last login: Fri Jun  8 09:25:06 UTC 2012 on ttyO0
root@beaglebone:~# ca /sys/devices/de  ocp.2/d =
/sys/devices/ocp.2/44e0d000.tscadc/tiadc/iio\:device0/
root@beaglebone:/sys/devices/ocp.2/44e0d000.tscadc/tiadc/iio:device0# ls
dev  name  power  subsystem  uevent
root@beaglebone:/sys/devices/ocp.2/44e0d000.tscadc/tiadc/iio:device0# cd =
/sys/bu s/^C
root@beaglebone:/sys/devices/ocp.2/44e0d000.tscadc/tiadc/iio:device0# cd
root@beaglebone:~# cd /sys/bus/iio/
devices/           drivers_autoprobe  uevent            =20
drivers/           drivers_probe     =20
root@beaglebone:~# cd /sys/bus/iio/devices/iio\:device0
root@beaglebone:/sys/bus/iio/devices/iio:device0# ls
dev  name  power  subsystem  uevent
root@beaglebone:/sys/bus/iio/devices/iio:device0# 
------=_NextPart_000_0001_01CE0951.B7527B00
Content-Type: application/octet-stream;
	name="am335x-bone-common.dtsi"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="am335x-bone-common.dtsi"

/*=0A=
 * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/=0A=
 *=0A=
 * This program is free software; you can redistribute it and/or modify=0A=
 * it under the terms of the GNU General Public License version 2 as=0A=
 * published by the Free Software Foundation.=0A=
 */=0A=
=0A=
/include/ "am33xx.dtsi"=0A=
=0A=
/ {=0A=
	model =3D "TI AM335x BeagleBone";=0A=
	compatible =3D "ti,am335x-bone", "ti,am33xx";=0A=
=0A=
	cpus {=0A=
		cpu@0 {=0A=
			cpu0-supply =3D <&dcdc2_reg>;=0A=
		};=0A=
	};=0A=
=0A=
	memory {=0A=
		device_type =3D "memory";=0A=
		reg =3D <0x80000000 0x10000000>; /* 256 MB */=0A=
	};=0A=
=0A=
	am33xx_pinmux: pinmux@44e10800 {=0A=
		pinctrl-names =3D "default";=0A=
		pinctrl-0 =3D <&userleds_pins>;=0A=
=0A=
		spi1_pins_s0: spi1_pins_s0 {=0A=
			pinctrl-single,pins =3D <=0A=
				0x190 0x33	/* mcasp0_aclkx.spi1_sclk, INPUT_PULLUP | MODE3 */=0A=
				0x194 0x33	/* mcasp0_fsx.spi1_d0, INPUT_PULLUP | MODE3 */=0A=
				0x198 0x13	/* mcasp0_axr0.spi1_d1, OUTPUT_PULLUP | MODE3 */=0A=
				0x19c 0x13	/* mcasp0_ahclkr.spi1_cs0, OUTPUT_PULLUP | MODE3 */=0A=
			>;=0A=
		};=0A=
		userled_pins: pinmux_userled_pins {=0A=
			pinctrl-single,pins =3D <=0A=
				0x54 0x7	/* gpmc_a5.gpio1_21, OUTPUT | MODE7 */=0A=
				0x58 0x17	/* gpmc_a6.gpio1_22, OUTPUT_PULLUP | MODE7 */=0A=
				0x5c 0x7	/* gpmc_a7.gpio1_23, OUTPUT | MODE7 */=0A=
				0x60 0x17	/* gpmc_a8.gpio1_24, OUTPUT_PULLUP | MODE7 */=0A=
			>;=0A=
		};=0A=
		i2c0_pins: pinmux_i2c0_pins {=0A=
			pinctrl-single,pins =3D <=0A=
				0x188 0x70 	/* i2c0_sda, SLEWCTRL_SLOW | INPUT_PULLUP | MODE0 */=0A=
				0x18c 0x70	/* i2c0_scl, SLEWCTRL_SLOW | INPUT_PULLUP | MODE0 */=0A=
			>;=0A=
		};=0A=
		i2c2_pins: pinmux_i2c2_pins {=0A=
			pinctrl-single,pins =3D <=0A=
				0x178 0x73 	/* uart1_ctsn.i2c2_sda, SLEWCTRL_SLOW | INPUT_PULLUP | =
MODE3 */=0A=
				0x17c 0x73	/* uart1_rtsn.i2c2_scl, SLEWCTRL_SLOW | INPUT_PULLUP | =
MODE3 */=0A=
			>;=0A=
		};=0A=
	};=0A=
=0A=
	ocp: ocp {=0A=
		uart1: serial@44e09000 {=0A=
			status =3D "okay";=0A=
		};=0A=
=0A=
		gpio-leds {=0A=
			compatible =3D "gpio-leds";=0A=
			pinctrl-names =3D "default";=0A=
			pinctrl-0 =3D <&userled_pins>;=0A=
=0A=
			led0 {=0A=
				label =3D "beaglebone:green:usr0";=0A=
				gpios =3D <&gpio2 21 0>;=0A=
				linux,default-trigger =3D "heartbeat";=0A=
				default-state =3D "off";=0A=
			};=0A=
=0A=
			led1 {=0A=
				label =3D "beaglebone:green:usr1";=0A=
				gpios =3D <&gpio2 22 0>;=0A=
				linux,default-trigger =3D "mmc0";=0A=
				default-state =3D "off";=0A=
			};=0A=
=0A=
			led2 {=0A=
				label =3D "beaglebone:green:usr2";=0A=
				gpios =3D <&gpio2 23 0>;=0A=
				linux,default-trigger =3D "cpu0";=0A=
				default-state =3D "off";=0A=
			};=0A=
=0A=
			led3 {=0A=
				label =3D "beaglebone:green:usr3";=0A=
				gpios =3D <&gpio2 24 0>;=0A=
				default-state =3D "off";=0A=
				linux,default-trigger =3D "mmc1";=0A=
			};=0A=
		};=0A=
=0A=
		rtc@44e3e000 {=0A=
			ti,system-power-controller;=0A=
		};=0A=
=0A=
		tscadc@44e0d000 {=0A=
			status =3D "okay";=0A=
			compatible =3D "ti,ti-tscadc";=0A=
			reg =3D <0x44e0d000 0x1000>;=0A=
                        interrupt-parent =3D <&intc>;=0A=
                        interrupts =3D <16>;=0A=
                        ti,hwmods =3D "adc_tsc";=0A=
	};=0A=
=0A=
=0A=
=0A=
	};=0A=
=0A=
	bone_capemgr {=0A=
		compatible =3D "ti,bone-capemgr";=0A=
		status =3D "okay";=0A=
=0A=
		eeprom =3D <&baseboard_eeprom>;=0A=
=0A=
		baseboardmaps {=0A=
			baseboard_beaglebone: board@0 {=0A=
				board-name =3D "A335BONE";=0A=
				compatible-name =3D "ti,beaglebone";=0A=
			};=0A=
=0A=
			baseboard_beaglebone_black: board@1 {=0A=
				board-name =3D "A335BNLT";=0A=
				compatible-name =3D "ti,beaglebone-black";=0A=
			};=0A=
		};=0A=
=0A=
		slots {=0A=
			slot@0 {=0A=
				eeprom =3D <&cape_eeprom0>;=0A=
			};=0A=
=0A=
			slot@1 {=0A=
				eeprom =3D <&cape_eeprom1>;=0A=
			};=0A=
=0A=
			slot@2 {=0A=
				eeprom =3D <&cape_eeprom2>;=0A=
			};=0A=
=0A=
			slot@3 {=0A=
				eeprom =3D <&cape_eeprom3>;=0A=
			};=0A=
=0A=
			/* Beaglebone black has it soldered on */=0A=
			 slot@4 {=0A=
			 	ti,cape-override;=0A=
			 	compatible =3D "ti,beaglebone-black";=0A=
			 	board-name =3D "Bone-LT-eMMC-2G";=0A=
			 	version =3D "00A0";=0A=
			 	manufacturer =3D "Texas Instruments";=0A=
			 	part-number =3D "BB-BONE-EMMC-2G";=0A=
			 };=0A=
=0A=
			/* geiger cape version A0 without an EEPROM */=0A=
			slot@5 {=0A=
				ti,cape-override;=0A=
				compatible =3D "kernel-command-line", "runtime";=0A=
				board-name =3D "Bone-Geiger";=0A=
				version =3D "00A0";=0A=
				manufacturer =3D "Geiger Inc.";=0A=
				part-number =3D "BB-BONE-GEIGER";=0A=
			};=0A=
=0A=
			/* Beaglebone black has it soldered on */=0A=
			slot@6 {=0A=
				ti,cape-override;=0A=
				compatible =3D "ti,beaglebone-black";=0A=
				board-name =3D "Bone-Black-HDMI";=0A=
				version =3D "00A0";=0A=
				manufacturer =3D "Texas Instruments";=0A=
				part-number =3D "BB-BONELT-HDMI";=0A=
			};=0A=
=0A=
			/* Nixie cape version A0 without an EEPROM */=0A=
			slot@7 {=0A=
				ti,cape-override;=0A=
				compatible =3D "kernel-command-line", "runtime";=0A=
				board-name =3D "Bone-Nixie";=0A=
				version =3D "00A0";=0A=
				manufacturer =3D "Ranostay Industries";=0A=
				part-number =3D "BB-BONE-NIXIE";=0A=
			};=0A=
=0A=
		};=0A=
=0A=
		/* mapping between board names and dtb objects */=0A=
		capemaps {=0A=
			/* DVI cape */=0A=
			cape@0 {=0A=
				/* board-name =3D "BeagleBone DVI-D CAPE"; */=0A=
				part-number =3D "BB-BONE-DVID-01";=0A=
				version@00A0 {=0A=
					version =3D "00A0";=0A=
					dtbo =3D "cape-bone-dvi-00A0.dtbo";=0A=
				};=0A=
				version@00A1 {=0A=
					version =3D "00A1", "01";=0A=
					dtbo =3D "cape-bone-dvi-00A1.dtbo";=0A=
				};=0A=
			};=0A=
=0A=
			/* beaglebone black emmc on board */=0A=
			cape@1 {=0A=
				/* board-name =3D "BeagleBone 2G eMMC1 CAPE"; */=0A=
				part-number =3D "BB-BONE-EMMC-2G";=0A=
				version@00A0 {=0A=
					version =3D "00A0";=0A=
					dtbo =3D "cape-bone-2g-emmc1.dtbo";=0A=
				};=0A=
			};=0A=
=0A=
			/* geiger cape */=0A=
			cape@2 {=0A=
				part-number =3D "BB-BONE-GEIGER";=0A=
				version@00A0 {=0A=
					version =3D "00A0";=0A=
					dtbo =3D "cape-bone-geiger-00A0.dtbo";=0A=
				};=0A=
			};=0A=
=0A=
			/* LCD3 cape */=0A=
			cape@3 {=0A=
				part-number =3D "BB-BONE-LCD3-01";=0A=
				version@00A0 {=0A=
					version =3D "00A0";=0A=
					dtbo =3D "cape-bone-lcd3-00A0.dtbo";=0A=
				};=0A=
				version@00A2 {=0A=
					version =3D "00A2";=0A=
					dtbo =3D "cape-bone-lcd3-00A2.dtbo";=0A=
				};=0A=
			};=0A=
=0A=
			/* Weather cape */=0A=
			cape@4 {=0A=
				part-number =3D "BB-BONE-WTHR-01";=0A=
				version@00A0 {=0A=
					version =3D "00A0";=0A=
					dtbo =3D "cape-bone-weather-00A0.dtbo";=0A=
				};=0A=
			};=0A=
=0A=
			/* beaglebone black hdmi on board */=0A=
			cape@5 {=0A=
				part-number =3D "BB-BONELT-HDMI";=0A=
				version@00A0 {=0A=
					version =3D "00A0";=0A=
					dtbo =3D "cape-boneblack-hdmi-00A0.dtbo";=0A=
				};=0A=
			};=0A=
=0A=
			/* nixie cape */=0A=
			cape@6 {=0A=
				part-number =3D "BB-BONE-NIXIE";=0A=
				version@00A0 {=0A=
					version =3D "00A0";=0A=
					dtbo =3D "cape-bone-nixie-00A0.dtbo";=0A=
				};=0A=
			};=0A=
		};=0A=
	};=0A=
};=0A=
=0A=
&i2c0 {=0A=
	status =3D "okay";=0A=
	clock-frequency =3D <400000>;=0A=
	pinctrl-names =3D "default";=0A=
	pinctrl-0 =3D <&i2c0_pins>;=0A=
=0A=
	tps: tps@24 {=0A=
		reg =3D <0x24>;=0A=
	};=0A=
=0A=
	baseboard_eeprom: baseboard_eeprom@50 {=0A=
		compatible =3D "at,24c256";=0A=
		reg =3D <0x50>;=0A=
	};=0A=
};=0A=
=0A=
&i2c2 {=0A=
	status =3D "okay";=0A=
	pinctrl-names =3D "default";=0A=
	pinctrl-0 =3D <&i2c2_pins>;=0A=
=0A=
	clock-frequency =3D <100000>;=0A=
=0A=
	cape_eeprom0: cape_eeprom0@54 {=0A=
		compatible =3D "at,24c256";=0A=
		reg =3D <0x54>;=0A=
	};=0A=
=0A=
	cape_eeprom1: cape_eeprom1@55 {=0A=
		compatible =3D "at,24c256";=0A=
		reg =3D <0x55>;=0A=
	};=0A=
=0A=
	cape_eeprom2: cape_eeprom2@56 {=0A=
		compatible =3D "at,24c256";=0A=
		reg =3D <0x56>;=0A=
	};=0A=
=0A=
	cape_eeprom3: cape_eeprom3@57 {=0A=
		compatible =3D "at,24c256";=0A=
		reg =3D <0x57>;=0A=
	};=0A=
};=0A=
=0A=
/include/ "tps65217.dtsi"=0A=
=0A=
&tps {=0A=
	ti,pmic-shutdown-controller;=0A=
=0A=
	regulators {=0A=
		dcdc1_reg: regulator@0 {=0A=
			regulator-always-on;=0A=
		};=0A=
=0A=
		dcdc2_reg: regulator@1 {=0A=
			/* VDD_MPU voltage limits 0.95V - 1.26V with +/-4% tolerance */=0A=
			regulator-name =3D "vdd_mpu";=0A=
			regulator-min-microvolt =3D <925000>;=0A=
			regulator-max-microvolt =3D <1325000>;=0A=
			regulator-boot-on;=0A=
			regulator-always-on;=0A=
		};=0A=
=0A=
		dcdc3_reg: regulator@2 {=0A=
			/* VDD_CORE voltage limits 0.95V - 1.1V with +/-4% tolerance */=0A=
			regulator-name =3D "vdd_core";=0A=
			regulator-min-microvolt =3D <925000>;=0A=
			regulator-max-microvolt =3D <1150000>;=0A=
			regulator-boot-on;=0A=
			regulator-always-on;=0A=
		};=0A=
=0A=
		ldo1_reg: regulator@3 {=0A=
			regulator-always-on;=0A=
		};=0A=
=0A=
		ldo2_reg: regulator@4 {=0A=
			regulator-always-on;=0A=
		};=0A=
=0A=
		ldo3_reg: regulator@5 {=0A=
			regulator-min-microvolt =3D <1800000>;=0A=
			regulator-max-microvolt =3D <3300000>;=0A=
			regulator-always-on;=0A=
		};=0A=
=0A=
		ldo4_reg: regulator@6 {=0A=
			regulator-always-on;=0A=
		};=0A=
	};=0A=
};=0A=
=0A=
&cpsw_emac0 {=0A=
	phy_id =3D <&davinci_mdio>, <0>;=0A=
};=0A=
=0A=
&cpsw_emac1 {=0A=
	phy_id =3D <&davinci_mdio>, <1>;=0A=
};=0A=
=0A=
&mmc1 {=0A=
	status =3D "okay";=0A=
	vmmc-supply =3D <&ldo3_reg>;=0A=
	ti,vcc-aux-disable-is-sleep;=0A=
};=0A=
=0A=
&edma {=0A=
	ti,edma-xbar-event-map =3D <32 12>;=0A=
};=0A=
=0A=
&sham {=0A=
	status =3D "okay";=0A=
};=0A=
=0A=
&aes {=0A=
	status =3D "okay";=0A=
};=0A=
=0A=
&usb_otg_hs {=0A=
	interface_type =3D <1>;=0A=
	power =3D <500>;=0A=
	status =3D "okay";=0A=
};=0A=
=0A=
&tscadc {=0A=
        tsc {=0A=
              ti,wires =3D <4>;=0A=
            ti,x-plate-resistance =3D <200>;=0A=
               ti,steps-to-configure =3D <5>;=0A=
             ti,wire-config =3D <0x00 0x11 0x22 0x33>;=0A=
        };=0A=
=0A=
        adc {=0A=
                ti,adc-channels =3D <4>;=0A=
        };=0A=
};=0A=
=0A=
=0A=

------=_NextPart_000_0001_01CE0951.B7527B00
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

------=_NextPart_000_0001_01CE0951.B7527B00--
