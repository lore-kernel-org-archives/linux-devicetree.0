From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] MIPS: Add device tree support to MIPS
Date: Thu, 29 Jul 2010 13:40:31 -0600
Message-ID: <AANLkTinCcV48iFiPY-iKKb_HqRP4BteG-amaFkwwsiFu@mail.gmail.com>
References: <AANLkTi=74zoQziQTmAGo-cNtF9FAT77h+KZagsNEFjEf@mail.gmail.com>
	<7A9214B0DEB2074FBCA688B30B04400D013FA46D@XMB-RCD-208.cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <7A9214B0DEB2074FBCA688B30B04400D013FA46D-2KNrN6/GZtCQwNoRDPPJJaBKnGwkPULj@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Dezhong Diao (dediao)" <dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, "David VomLehn (dvomlehn)" <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 28, 2010 at 2:47 PM, Dezhong Diao (dediao) <dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> wrote:
> Grant,
>
> I agree with your approach. Please go ahead to make changes and get the patches working with latest code in test tree. Or I am able to make changes in terms of your comments too.

It would be better if you respin and retest.  I can compile MIPS
kernels, but I don't have any hardware to boot them on.  And I'm busy,
so there is less likelyhood that I'll get around to reworking it.  :-)

> It is best we can have MIPS OF support in 2.6.36, but I have you and Ralf decide it.

I'd be happy to merge it into 2.6.36.  I've got a concern about the
2nd patch, but the first one looks pretty sane and should be
mergeable.

Comments on the .dts file follow...

> /dts-v1/;
>
> / {
> 	model = "Explorer";
> 	compatible = "Explorer", "Calliope";

Compatible values must be in the form "<vendor>,<model>", and ideally
in lowercase.  Also, it is very unlikely that claiming compatibility
with other parts at the board level is a sane thing to do (what does
it really mean to be compatible with a different part?  Is the new
board absolutely 100% backwards compatible with the previous board?).

> 	copyright = "Copyright (c) 2008 Cisco Systems, Inc.  All Rights Reserved.";

Vendor specific property, prefix it with the vendor name:

cisco,copyright = "..."

> 	#address-cells = <0x1>;
> 	#size-cells = <0x1>;
>
> 	cpus {
> 		name = "cpus";
> 		#address-cells = <0x1>;
> 		#size-cells = <0x0>;
>
> 		24k@0 {

follow the generic names recommended practice on node name:

cpu@0 {

> 			device_type = "cpu";
> 			reg = <0x0>;
> 			clock-frequency = <0x5f5e1000>;
> 			timebase-frequency = <0x1fca055>;

You can specify values in decimal too.  Frequencies are usually best
represented in base 10:

clock-frequency = <1600000000>;
timebase-frequency = <33333333>;

> 			i-cache-size = <0x8000>;
> 			d-cache-size = <0x8000>;
> 		};
> 	};
>
> 	memories {
> 		name = "memories";

dtc automatically sets the name property for you.  Drop this line.

> 		device_type = "memory";
> 		#address-cells = <0x3>;
> 		#size-cells = <0x0>;

This looks messed up.

>
> 		memory@0 {
> 			memory_type = "low";
> 			reg = <0x10000000 0x20000000 0xfc00000>;
> 		};
>
> 		memory@1 {
> 			memory_type = "MIPS reset vector";
> 			reg = <0x1fc00000 0x7fcffff 0x400000>;
> 		};
>
> 		memory@2 {
> 			memory_type = "gp-sram";
> 			reg = <0x9040000 0x9040000 0x30000>;
> 		};
>
> 		memory@3 {
> 			memory_type = "high";
> 			reg = <0x2fc00000 0x2fc00000 0x400000>;
> 		};
>
> 		memory@4 {
> 			memory_type = "high";
> 			reg = <0x60000000 0x60000000 0x10000000>;
> 		};
> 	};

I have no idea what is being done here.  I need a description.

>
> 	options {
> 		name = "options";
> 		moca-populated = "true";
> 		hd-populated = "false";
> 		ir-protocol = "MOT";
> 		nvm-size = <0x100>;
> 		front-panel-button = "button";
> 		push-button-matrix = "matrix";
> 		tuning-range = <0x33428f00>;
> 		rear-usb = "true";
> 		video-support = "true";
> 		cable-card = "false";
> 		ethernet = "true";
> 		moca-range = "D1-D8";
> 		usb-20-hub = "false";
> 		second-qpsk-rx = "true";
> 		front-panel = "four";
> 		tuner-ic2-clock-freq = <0x32>;
> 		memory-encryption-scheme = "fixed-key";
> 	};

I see what you're doing here, but it is rather baroque.  The node name
should probably be named something non-generic so that it won't be
accidentally mistaken for something parsable by common code.
Prefixing with "cisco," is a good idea.  In fact, you should consider
moving this stuff into the chosen node and prefixing all of these
property names with "cisco," because it is very machine/arch specific.
 Oh, and document what all of these mean on devicetree.org.

Do you plan on replacing any of this with proper device nodes that
describe each peripheral individually?

> 	chosen {
> 		name = "chosen";

Drop this line.

> 		bootargs = "root=/dev/sda2";
> 		linux,platform = "1kg6";

What does linux,platform mean?

> 	};
> };

Cheers,
g.
