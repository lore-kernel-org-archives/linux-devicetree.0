From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [2/2] powerpc/fsl-booke: Add initial T1042RDB_PI board support
Date: Thu, 31 Jul 2014 00:07:40 -0500
Message-ID: <1406783260.29414.320.camel@snotra.buserror.net>
References: <1404879851-2914-1-git-send-email-Priyanka.Jain@freescale.com>
	 <20140730201250.GA29789@home.buserror.net>
	 <946e9d7e260c4d78b3c025c3eaeec0f5@BY1PR0301MB0853.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <946e9d7e260c4d78b3c025c3eaeec0f5-M1kb196zaorSs1RAMYuBhJwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jain Priyanka-B32167 <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Aggrwal Poonam-B10812 <Poonam.Aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kushwaha Prabhakar-B32579 <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-07-30 at 23:37 -0500, Jain Priyanka-B32167 wrote:
> 
> -----Original Message-----
> From: Wood Scott-B07421 
> Sent: Thursday, July 31, 2014 1:43 AM
> To: Jain Priyanka-B32167
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Aggrwal Poonam-B10812; Kushwaha Prabhakar-B32579
> Subject: Re: [2/2] powerpc/fsl-booke: Add initial T1042RDB_PI board support
> 
> On Wed, Jul 09, 2014 at 09:54:11AM +0530, Priyanka Jain wrote:
> > diff --git a/arch/powerpc/boot/dts/t104xrdb.dtsi 
> > b/arch/powerpc/boot/dts/t104xrdb.dtsi
> > index 9aaefa5..e7e765f 100644
> > --- a/arch/powerpc/boot/dts/t104xrdb.dtsi
> > +++ b/arch/powerpc/boot/dts/t104xrdb.dtsi
> > @@ -57,7 +57,8 @@
> >  		};
> >  
> >  		cpld@3,0 {
> > -			compatible = "fsl,t1040rdb-cpld","fsl,t1042rdb-cpld";
> > +			compatible = "fsl,t1040rdb-cpld","fsl,t1042rdb-cpld",
> > +					"fsl,t1042rdb_pi-cpld";
> >  			reg = <3 0 0x300>;
> >  		};
> >  	};
> 
> What's going on here?  This file is used by all three boards.  If you need to distinguish one board's CPLD from another's, you'll have to do it somewhere else.  If the CPLDs are exactly the same and no distinction needs to be made, then you don't need three compatible strings.  Even then, you may wish to specify the exact board as the first compatible string, but again you'll need to patch that in elsewhere so that it actually matches the board
> .
> As the register set of CPLD for all three boards is same, I am thinking of replacing this with t104srdb-cpld
> compatible = "fsl,t104xrdb-cpld","
> Is this OK?

No.  Wildcards aren't allowed in compatible strings, because you never
know what other devices might exist in the future that match the
wildcard.

If the CPLD logic is truly 100% identical, just pick one of the three to
be the canonical name.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
