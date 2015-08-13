From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] powerpc/85xx: Add binding for SCFG
Date: Thu, 13 Aug 2015 13:18:43 -0500
Message-ID: <1439489923.4099.93.camel@freescale.com>
References: <1439364555-1996-1-git-send-email-dongsheng.wang@freescale.com>
	 <1439393253.4099.87.camel@freescale.com>
	 <SN1PR0301MB161609299A2EEBB92AB232869D7D0@SN1PR0301MB1616.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <SN1PR0301MB161609299A2EEBB92AB232869D7D0-VLIetriUNobRRq1t3zq48ZwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wang Dongsheng-B40534 <Dongsheng.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Jain Priyanka-B32167 <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-08-12 at 20:55 -0500, Wang Dongsheng-B40534 wrote:
> 
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: Wednesday, August 12, 2015 11:28 PM
> > To: Wang Dongsheng-B40534
> > Cc: Jain Priyanka-B32167; ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org; 
> > robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Subject: Re: [PATCH v2 1/2] powerpc/85xx: Add binding for SCFG
> > 
> > On Wed, 2015-08-12 at 15:29 +0800, Dongsheng Wang wrote:
> > > From: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > 
> > > SCFG provides SoC specific configuration and status registers for the
> > > chip. Add this for powerpc platform.
> > > 
> > > Signed-off-by: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > ---
> > > *V2*
> > > - Remove scfg description in board.txt and create scfg.txt for scfg.
> > > - Change "fsl,<board>-scfg" to "fsl,<chip>-scfg"
> > 
> > If you want me to apply these patches they need to be sent to linuxppc-
> > dev-uLR06cmDAlY/bJ5BZ2RsieG/Ez6ZCGd0@public.gmane.org
> 
> Need I resend this patch to PPC maillist or reply the original +PPC 
> maillist?

Resend it so that it shows up in Patchwork.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
