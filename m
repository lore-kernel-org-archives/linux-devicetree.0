From: "Timo Sigurdsson" <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Add regulators for
 LeMaker BananaPi
Date: Mon,  5 Oct 2015 19:39:57 +0200 (CEST)
Message-ID: <20151005173957.B1BD16C8150E@dd34104.kasserver.com>
References: <1438532305-5884-1-git-send-email-public_timo.s@silentcreek.de> <20150818153631.GH2547@lukather><CAMAWPa-Q7o+Ys2FjhLZt6Nwq=Ja6TTdWFDZFTCYLkoLGjpLpxw@mail.gmail.com>
Reply-To: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_1afed22d9abe79f6c1fbf3ac172aabb3"
Return-path: <linux-sunxi+bncBCSJLSE35MGBB3XLZKYAKGQEQQSHHSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAMAWPa-Q7o+Ys2FjhLZt6Nwq=Ja6TTdWFDZFTCYLkoLGjpLpxw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: devicetree@vger.kernel.org


This is a multi-part message in MIME format  --  Dies ist eine mehrteilige Nachricht im MIME-Format
--=_1afed22d9abe79f6c1fbf3ac172aabb3
Content-Type: text/plain; charset=UTF-8

Hi Kevin,

Kevin Hilman schrieb am 24.09.2015 19:57:
> kernelci.org started finding boot faiulres[1] on bananapi linux-next
> around next-20150918, but it was only failing in some labs and not
> others.  I finally bisected it down to this patch, which landed in
> linux-next in the form of 2d665a8a8350 ARM: dts: sunxi: Add regulators
> for LeMaker BananaPi.  Reverting that commit on top of next-20150923
> gets my bananapi booting again.
> 
> Note it's kind of an interesting boot failure.  The kernel boots fully
> to a shell, but panics after running a few commands.  In particular
> 'dmesg -n1' seems to trigger it usually[2].
> 
> Kevin
> 
> [1]
> http://kernelci.org/boot/sun7i-a20-bananapi/job/next/kernel/next-20150923/defconfig/multi_v7_defconfig/lab/lab-khilman/?_id=5602504359b514be146c326f
> [2]
> http://storage.kernelci.org/next/next-20150923/arm-multi_v7_defconfig/lab-khilman/boot-sun7i-a20-bananapi.html

following up on my last email: I'm back from my vacation and I tried to
reproduce your problem, but my board doesn't seem to be affected, so I
cannot trigger it.

I still think that the lower voltages may be the cause of your problem
with that specific board, so could you please test the attached patch on
top of my patch that you first experienced the problem with? Please let 
us know whether this solves your issue or whether we need to dig deeper.

Has anybody else been able to reproduce Kevin's issue?

Kind regards,

Timo

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--=_1afed22d9abe79f6c1fbf3ac172aabb3
Content-Transfer-Encoding: 7bit
Content-Type: text/x-diff; charset=us-ascii;
 name=0001-Add-board-specific-opp-for-LeMaker-BananaPi.patch
Content-Disposition: attachment;
 filename=0001-Add-board-specific-opp-for-LeMaker-BananaPi.patch

diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
index 74382f3..39b6b67b 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
@@ -94,6 +94,16 @@
 
 &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
+	operating-points = <
+		/* kHz	  uV */
+		960000	1400000
+		912000	1400000
+		864000	1350000
+		720000	1250000
+		528000	1150000
+		312000	1100000
+		144000	1050000
+		>;
 };
 
 &ehci0 {
--=_1afed22d9abe79f6c1fbf3ac172aabb3--
