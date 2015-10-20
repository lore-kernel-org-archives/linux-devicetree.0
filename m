From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: Using CONFIG_ARM_APPENDED_DTB with multiple device trees
Date: Tue, 20 Oct 2015 06:04:45 +0200
Message-ID: <20151020040445.GA4478@lunn.ch>
References: <fce90e91fe3c452b80bcd2113f267003@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fce90e91fe3c452b80bcd2113f267003-5g7mGxlPNYb6GjIOKuZY+ItlCAj8ZROq@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 20, 2015 at 03:27:15AM +0000, Chris Packham wrote:
> Hi,
> 
> We currently have several boards based around the 88f6281 (kirkwood) ARM 
> CPU.
> 
> The boards all share a kernel image (currently 3.16 based but we're in 
> the process of moving to 4.3). We use the machine id (and some other 
> eeprom type information) to distinguish the boards.
> 
> We'd like to move to a device tree based model but we're restricted in 
> that updating the bootloaders to a DT-aware u-boot is impractical. 
> CONFIG_ARM_APPENDED_DTB allows us to append a device tree but we still 
> need to account for the differences between the boards.

Hi Chris

You might want to look at what Debian does. When installing the
kernel, it appends the correct DT blob depending on what the current
running kernel is, to the new kernel image before writing it to the
boot medium.

Another option is the pxa-impedance-matcher.

     Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
