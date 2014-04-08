From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 3/3] edac: altera: Add SDRAM EDAC support for
 CycloneV/ArriaV
Date: Tue, 8 Apr 2014 12:08:51 +0200
Message-ID: <20140408100851.GF30077@pd.tnic>
References: <1396907649-20212-1-git-send-email-tthayer@altera.com>
 <1396907649-20212-4-git-send-email-tthayer@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1396907649-20212-4-git-send-email-tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org
Cc: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 07, 2014 at 04:54:09PM -0500, tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
> From: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> 
> Added EDAC support for reporting ECC errors of CycloneV
> and ArriaV SDRAM controller.
> - The SDRAM Controller registers are used by the FPGA bridge so
>   these are accessed through the syscon interface.
> - The configuration of the SDRAM memory size for the EDAC framework
>   is discovered from the memory node of the device tree.
> - Documentation of the bindings in devicetree/bindings/arm/altera/
>   socfpga-sdram-edac.txt
> - Correction of single bit errors, detection of double bit errors.

Before I go and take a look at this further, is anyone at Altera going
to maintain this driver in case of bug reports and issues with it?

Also, I see patch 3/3. Are the other two related? I see they are
devicetree additions and, as such, all three should go together...

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
