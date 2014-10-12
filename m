From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC 6/7] ARM: vf610m4: HACK: get dtb pointer from SRC_GPR3
Date: Sun, 12 Oct 2014 21:00:52 +0200
Message-ID: <1815119.sje1JPFb29@wuerfel>
References: <cover.1413136383.git.stefan@agner.ch> <2bdc44912522eb02db2e4612738fe9f0545b36d9.1413136383.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2bdc44912522eb02db2e4612738fe9f0545b36d9.1413136383.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 12 October 2014 20:14:00 Stefan Agner wrote:
> Get DTB pointer (located in r2) from SRC_GPR3 (argument register
> for secondary core)
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
> This is clearly a hack but it works around the need of a boot loader
> on the Cortex-M4. I guess there is no way neither its acceptable to
> do this on machine level..? But then, this can also be done with a
> minimal boot loader loaded just in front of the kernel by the m4boot
> utility.
> 

How do you actually enter the kernel on the m4? Do you use a
decompressor or XIP_KERNEL at the moment? There are probably 
lots of ways to do this, my first idea would be to have a vybrid
specific boot wrapper that consists of just a few assembly
instructions to set up the initial environment from wherever
it gets started.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
