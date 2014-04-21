From: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv2 3/3] edac: altera: Add SDRAM EDAC support for
 CycloneV/ArriaV
Date: Mon, 21 Apr 2014 16:33:41 -0500
Message-ID: <1398116021.12716.1.camel@dinh-ubuntu>
References: <1397604610-20931-1-git-send-email-tthayer@altera.com>
	 <1397604610-20931-5-git-send-email-tthayer@altera.com>
	 <20140421102750.GA27209@amd.pavel.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140421102750.GA27209-tWAi6jLit6GreWDznjuHag@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kVAfugRpC6u6w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2014-04-21 at 12:27 +0200, Pavel Machek wrote:
> Hi!
> 
> > From: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> > 
> > Added EDAC support for reporting ECC errors of CycloneV
> > and ArriaV SDRAM controller.
> > - The SDRAM Controller registers are used by the FPGA bridge so
> >   these are accessed through the syscon interface.
> > - The configuration of the SDRAM memory size for the EDAC framework
> >   is discovered from the SDRAM Controller registers.
> > - Documentation of the bindings in devicetree/bindings/arm/altera/
> >   socfpga-sdram-edac.txt
> > - Correction of single bit errors, detection of double bit errors.
> > 
> > ---
> > v2: Use the SDRAM controller registers to calculate memory size
> >     instead of the Device Tree. Update To & Cc list. Add maintainer 
> >     information.
> 
> I'd reduce number of *s in the messages, otherwise
> 
> Reviewed-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> 
> for whole series.
> 								Pavel
> 
Hi Pavel.

Noted - I will make the change. Thank you for reviewing.

Thor

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
