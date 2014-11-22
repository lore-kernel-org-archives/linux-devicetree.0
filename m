From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCHv6 00/10] arm: mvebu: add Synology DS213j and DS414 .dts files
Date: Sat, 22 Nov 2014 09:13:33 +0100
Message-ID: <87h9xrfyaa.fsf@natisbad.org>
References: <cover.1416613429.git.arno@natisbad.org>
	<20141122045430.GU22670@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jason,

Sorry for the trouble w/ my patches. I'll try and avoid such issues in
the future.

Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> writes:

>> Arnaud Ebalard (10):
>
> These three patches had trouble:
>
>>   arm: mvebu: move Armada 370/XP pinctrl node definition armada-370-xp.dtsi
>
> armada-370-db needed to be hand-jammed.  Please double-check that it
> went through correctly.  The error was something about missing repository
> info.  Usually that means the patch was based on something weird...

After pushing v2, Sebastian's pointed there was some of the patches I
had which he had already done and were sitting in your mvebu/dt banch.
So I rebased my whole series on your mvebu/dt but used mvebu-dt-3.19
at some point, which was behind the tip, i.e. had not the following
patches:

commit ab1e85372168892387dd1ac171158fc8c3119be4 <- your tip
commit ad6a1b445bdc19199933051840a53fdd30b8f961
commit ebf50c9651ff28341b76e78c531592d7d3489bc6
commit 5e949f0c79917f3fd8512a3b66b0c861e03ec5a6
commit 9ef90cbb0860d3434fdc4bf9674adca1b762f95e
commit a6b334514be27aec1bf31c7673c2f55bd6fbd3e6
commit b4607572ef86b288a856b9df410ea593c5371dec
commit f5ed9ccc4c2dc275a13b765c88fa13211f60b57f <- mvebu-dt-3.19


>>   arm: mvebu: define and use common Armada 370 UART pinctrl settings
>
> Same here, 'patch -Np1 <...patch' went fine, though.  Please double
> check.

I will take a thorough look today at what you currently have in your
tree (and more specifically regarding DS414) and do more tests on both
NAS next week.

>>   arm: mvebu: add .dts file for Synology DS414
>
> This broke the build :(  I did s/ge[01]_rgmii_pins/pmx_ge[01]_rgmii/ to
> fix the issue.  Did you run 'make dtbs' before you sent?

Each series was compiled and tested on the DS213j because DS414 is
painful to handle (SAR issue pointed in the .dts file which requires
unplugging/plugging the USB/serial + longer time to boot). The thing is
when I merged the two development tres I had for the DS213j and DS414, I
used the DS213j config ... which did not have CONFIG_MACH_ARMADA_XP.

Again, my apologies for the trouble and manual handling.

> At any rate, whole series applied to mvebu/dt.

Thanks,

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
