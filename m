From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: sti: stih410-clocks: Add PROC_STFE as a critical
 clock
Date: Wed, 26 Oct 2016 09:51:41 +0100
Message-ID: <20161026085141.GJ8574@dell>
References: <1476804957-24000-1-git-send-email-peter.griffin@linaro.org>
 <20161024085304.GE14477@dell>
 <20161024134416.GB10440@griffinp-ThinkPad-X1-Carbon-2nd>
 <20161025074257.GF8574@dell>
 <20161025093926.GA3206@griffinp-ThinkPad-X1-Carbon-2nd>
 <20161025100141.GH8574@dell>
 <20161025134940.GA3993@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161025134940.GA3993@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > > If the clock is enabled when Linux boots, the Linux clock framework *needs*
> > > to assume the hardware may have been used in previous boot stages, and it should
> > > not attempt to disable the clock.
> > 
> > None of the boot loaders we use do this.
> 
> But the Linux kernel isn't just used by us. It is not uncommon for STB
> bootloaders to get information from the frontend as part of the boot process. 

Okay, this is the clincher.  Since we need to support non-standard
bootloaders, it's difficult to guarantee that the clock will be
disabled at boot.  For this reason, I believe that we can call this a
critical clock.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
