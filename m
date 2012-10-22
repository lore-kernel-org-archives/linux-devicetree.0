From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 08/10] pinctrl: single: support pinconf generic
Date: Mon, 22 Oct 2012 10:09:18 -0700
Message-ID: <20121022170917.GB4730@atomide.com>
References: <1350551224-12857-1-git-send-email-haojian.zhuang@gmail.com>
 <1350551224-12857-8-git-send-email-haojian.zhuang@gmail.com>
 <20121019191333.GT4730@atomide.com>
 <CAN1soZzE_tTkmPBechvUcdAbWKSScwcaqe_cb0TTmnRJi9gtRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAN1soZzE_tTkmPBechvUcdAbWKSScwcaqe_cb0TTmnRJi9gtRg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [121022 03:11]:
> On Sat, Oct 20, 2012 at 3:13 AM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
> > * Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [121018 02:08]:
> >> Add pinconf generic support with POWER SOURCE, BIAS PULL.
> > ...
> >
> >> +     case PIN_CONFIG_POWER_SOURCE:
> >> +             if (pcs->psmask == PCS_OFF_DISABLED
> >> +                     || pcs->psshift == PCS_OFF_DISABLED)
> >> +                     return -ENOTSUPP;
> >> +             data &= pcs->psmask;
> >> +             data = data >> pcs->psshift;
> >> +             *config = data;
> >> +             return 0;
> >> +             break;
> >
> > Hmm, only slightly related to this patch, mostly a generic
> > question to others: Do others have any mux registers with
> > status bits for things like PIN_CONFIG_POWER_SOURCE?
> >
> > I could use PIN_CONFIG_POWER_SOURCE for controlling the PBIAS
> > for omap MMC. But there's also a status bit that needs to be
> > checked for that. I think there was some other similar mux
> > register for USB PHY that has a status register.
> >
> > So I'm wondering should the checking for status bit be handled
> > in the pinctrl consume driver? Or should we have some bindings
> > for that?
> >
> 
> Do you mean that the status register only exists in USB PHY controller or
> MMC controller?

The status register is in the MMC PBIAS register that is mux
related otherwise. From OMAP4470_ES1.0_PUBLIC_TRM_vE.pdf,
Table 19-599. CONTROL_PBIASLITE:

Bits
26	MMC1_PWDNZ
25	MMC1_PBIASLITE_HIZ_MODE
24	MMC1_PBIASLITE_SUPPLY_HI_OUT
23	MMC1_PBIASLITE_VMODE_ERROR	then this bit needs to clear..
22	MMC1_PBIASLITE_PWRDNZ
21	MMC1_PBIASLITE_VMODE		..after VMODE bit is set to 3V
 
> If so, could we use regulator framework in USB PHY or MMC driver?

Yes we could use regulator framework for that that. Or just read the
status in the MMC driver for that bit if nobody else has mixed
mux-regulator needs like this.

The sequence is MMC specific, so from that point of view it would
make sense to have the logic in the MMC driver.

Regards,

Tony
