From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [2/4] powerpc/rcpm: add RCPM driver
Date: Thu, 2 Apr 2015 10:50:50 -0500
Message-ID: <1427989850.22867.266.camel@freescale.com>
References: <1427365095-26396-2-git-send-email-chenhui.zhao@freescale.com>
	,<20150331013057.GB5667@home.buserror.net>
	 <1427970805609.21194@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427970805609.21194-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhao Chenhui-B35336 <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jin Zhengxiong-R64188 <Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-04-02 at 05:33 -0500, Zhao Chenhui-B35336 wrote:
> > +static int rcpm_v2_plat_enter_state(int state)
> > +{
> > +     u32 *pmcsr_reg = &rcpm_v2_regs->powmgtcsr;
> > +     int ret = 0;
> > +     int result;
> > +
> > +     switch (state) {
> > +     case PLAT_PM_LPM20:
> > +             /* clear previous LPM20 status */
> > +             setbits32(pmcsr_reg, RCPM_POWMGTCSR_P_LPM20_ST);
> 
> How would the bit be set when you enter here, given that you wait for it
> to clear when leaving?
> 
> [chenhui] Actually, the bit is not used by software. Just follow the instruction in RM.

Sorry, I missed the "_P_" and thought it was RCPM_POWMGTCSR_LPM20_ST.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
