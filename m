From: Li Xiubo <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCHv6 0/4] Add Freescale FTM PWM driver.
Date: Fri, 22 Nov 2013 07:18:54 +0000
Message-ID: <1DD289F6464F0949A2FCA5AA6DC23F828C7A6E@039-SN2MPN1-012.039d.mgd.msft.net>
References: <1384220218-12716-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384220218-12716-1-git-send-email-Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org" <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-pwm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pwm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thierry,

Could you help review this series of patches please ? 

And could it be merged into the PWM next tree?

Thanks very much.

--


> Subject: [PATCHv6 0/4] Add Freescale FTM PWM driver.
> 
> Hello Thierry,
> 
> The series of patches for this version has been reviewed and acked
> already.
> To see each patch for detail.
> 
> 
> ------------------
> ------------------
> 
> This patch series is the Freescale FTM PWM implementation. And there are
> 8 channels most supported by the FTM PWM. This implementation is only
> compatible with device tree definition.
> 
> This patch series is based on linux-next and has been tested on Vybrid
> VF610 Tower board using device tree.
> 
> 
> 
> Changes in v6:
> - Nothing.
> 
> Changes in RFCv2 of PATVHv5:
> - Remove "fsl,pwm-counter-clk".
> 
> Changes in v5:
> - Remove active/idle pinctrl stuff.
> 
> Changes in v4:
> - Check for the result and return an error for devm_kzalloc().
> - Move pinmux setting from the SoC file to the board specific file.
> - Revise the written mistake of 'ret |= FTMSC_CLKEXT;' --> 'reg |=
> FTMSC_CLKEXT;'.
> 
> 
> Changes in v3:
> - Remove "availabe" field.
> - Remove "fsl,pwm-avaliable-chs" property.
> - ...
> 
> Changes in v2:
> - Remove PWM CPWM/EPWM feature and sysfs.
> - Remove some redundant code.
> - Revise some code for more readable.
> - Remove "fsl,pwm-clk-ps", "fsl,pwm-number", "fsl,pwm-channels",etc.
> - Add "fsl,pwm-avaliable-chs", "fsl,pwm-counter-clk", etc.
> - Support 8 channels default in dtsi file.
> - Add counter clock source selection.
> - Rename some function name, macro name, etc.
> - Use PWM's and OF's existing function interfaces.
> - Split clk_unprepare_enable to clk_unprepare and clk_enable,etc.
> - ...
> 
> Added in v1:
> - Add Freescale FTM PWM driver support.
> - Add Freescale FTM PWM node for VF610.
> - Enable Enables FTM PWM device for Vybrid VF610 TOWER.
> - Add device tree bindings for Freescale.
> 
> 
> 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pwm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
