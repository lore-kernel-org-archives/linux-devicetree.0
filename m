From: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARC: [axs10x] Specify reserved memory for frame
 buffer
Date: Thu, 28 Apr 2016 13:46:22 +0000
Message-ID: <1461851171.3673.30.camel@synopsys.com>
References: <1461767701-12208-1-git-send-email-abrodkin@synopsys.com>
	 <1461767701-12208-3-git-send-email-abrodkin@synopsys.com>
	 <572190F3.3020709@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <572190F3.3020709-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Content-ID: <D2CFECB45A302F46A3E2015D709B998C-z7JfP6tgrtVBCHUSTMH8dZqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vineet,

On Thu, 2016-04-28 at 09:56 +-0530, Vineet Gupta wrote:

+AFs-snip+AF0-

+AD4- +AD4- 
+AD4- +AD4- diff --git a/arch/arc/boot/dts/axc001.dtsi b/arch/arc/boot/dts/axc001.dtsi
+AD4- +AD4- index 420dcfd..ae6162d 100644
+AD4- +AD4- --- a/arch/arc/boot/dts/axc001.dtsi
+AD4- +AD4- +-+-+- b/arch/arc/boot/dts/axc001.dtsi
+AD4- +AD4- +AEAAQA- -95,6 +-95,24 +AEAAQA-
+AD4- +AD4- +AKA-		+ACM-size-cells +AD0- +ADw-1+AD4AOw-
+AD4- +AD4- +AKA-		ranges +AD0- +ADw-0x00000000 0x80000000 0x40000000+AD4AOw-
+AD4- +AD4- +AKA-		device+AF8-type +AD0- +ACI-memory+ACIAOw-
+AD4- +AD4- -		reg +AD0- +ADw-0x80000000 0x20000000+AD4AOw-	/+ACo- 512MiB +ACo-/
+AD4- +AD4- +-		reg +AD0- +ADw-0x80000000 0x1f000000+AD4AOw-	/+ACo- 512 - 16 MiB +ACo-/
+AD4- Is 16MB fixed size or is this a function of display resolution / density etc.

Indeed this value depends on screen resolution and bpp and double-
or even tripple-buffering (once this becomes supported in the driver).

So as of now the corner case would be 1920x1080, 16 bits per pixel
which gives +AH4-4Mb. Now if we add support of triple-buffering we'll
need +AH4-12Mb so I booked a little bit more - 16Mb.

But now I recalled that we also support+AKA-r8g8b8 mode and in this case
3 bytes are used for color encoding, which effectively gives +AH4-6Mb for
1 FullHD frame. And for tripple-buffering we'll need +AD4- 18Mb, so probably
we'll need to go for 24 or even 32 Mb.

+AFs-snip+AF0-

+AD4- +AD4- +-
+AD4- +AD4- +-	reserved-memory +AHs-
+AD4- +AD4- +-		+ACM-address-cells +AD0- +ADw-1+AD4AOw-
+AD4- +AD4- +-		+ACM-size-cells +AD0- +ADw-1+AD4AOw-
+AD4- +AD4- +-		ranges+ADs-
+AD4- +AD4- +-		/+ACo-
+AD4- +AD4- +-		+AKAAKg- Move frame buffer out of IOC aperture (0x8z-0xAz).
+AD4- +AD4- +-		+AKAAKg-/
+AD4- +AD4- +-		frame+AF8-buffer: frame+AF8-buffer+AEA-bf000000 +AHs-
+AD4- +AD4- +-			compatible +AD0- +ACI-shared-dma-pool+ACIAOw-
+AD4- +AD4- +-			reg +AD0- +ADw-0xbf000000 0x1000000+AD4AOw-
+AD4- Can this be made a bit more future safe. AXS103 has 1 GB of DDR while kernel
+AD4- currently only uses 512M. Once we increase that, this will need fixing too. Better
+AD4- to make this as far possible.

Makes sense. Will move it to the very end of 1Gb.

+AD4- Note that the IOC start alignment needs to follow
+AD4- max(4k, size). What will be maximum size of frame buffer - 16M always +ACE-

What do you mean by that?

-Alexey--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
