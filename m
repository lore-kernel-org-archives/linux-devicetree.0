From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: Added syscon-reboot node for FSL's LS2085A
 SoC
Date: Fri, 30 Oct 2015 14:32:20 +0000
Message-ID: <20151030143220.GC31073@leverpostej>
References: <1445650280-9966-1-git-send-email-German.Rivera@freescale.com>
 <20151027163441.GK3091@leverpostej>
 <CY1PR0301MB07480A8EC25BB6987883AE5687220@CY1PR0301MB0748.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CY1PR0301MB07480A8EC25BB6987883AE5687220-YrwGdl+PljkyhdUd3pz1uJwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sharma Bhupesh <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Leo <LeoLi-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jose Rivera <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 27, 2015 at 06:25:04PM +0000, Stuart Yoder wrote:
> I think that comment "Currently supported enable-method is psci v0.2" is a statement of
> intent, not what is available currently.   And the only plan I am aware of is PSCI
> with UEFI based firmware.
> 
> U-boot is a key firmware platform for us and has no PSCI implementation available.

Please note that PSCI isn't implemented by UEFI. On ARM Juno (and other
platforms), PSCI is implemented by ARM Trusted Firmware [1], and the non-secure
side can be UEFI (EDK2), U-Boot, or something else entirely.

> So, we need this.  The device tree simply describes the hardware that is
> there and that's what this patch exposes.
>
> If down the road all firmware provides a PSCI based reset interface then
> we will naturally use that.  But we need something in the meantime to
> let us reboot the system.

I appreciate that you need this if you do not have a PSCI implementation. I was
mislead by the comment.

Thanks,
Mark.

[1] https://github.com/ARM-software/arm-trusted-firmware
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
