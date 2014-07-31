From: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [2/2] powerpc/fsl-booke: Add initial T1042RDB_PI board support
Date: Thu, 31 Jul 2014 04:37:22 +0000
Message-ID: <946e9d7e260c4d78b3c025c3eaeec0f5@BY1PR0301MB0853.namprd03.prod.outlook.com>
References: <1404879851-2914-1-git-send-email-Priyanka.Jain@freescale.com>
 <20140730201250.GA29789@home.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140730201250.GA29789-vONcSABrMOVpTrP2zolEsF6hYfS7NtTn@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "Poonam.Aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Poonam.Aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org



-----Original Message-----
From: Wood Scott-B07421 
Sent: Thursday, July 31, 2014 1:43 AM
To: Jain Priyanka-B32167
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Aggrwal Poonam-B10812; Kushwaha Prabhakar-B32579
Subject: Re: [2/2] powerpc/fsl-booke: Add initial T1042RDB_PI board support

On Wed, Jul 09, 2014 at 09:54:11AM +0530, Priyanka Jain wrote:
> diff --git a/arch/powerpc/boot/dts/t104xrdb.dtsi 
> b/arch/powerpc/boot/dts/t104xrdb.dtsi
> index 9aaefa5..e7e765f 100644
> --- a/arch/powerpc/boot/dts/t104xrdb.dtsi
> +++ b/arch/powerpc/boot/dts/t104xrdb.dtsi
> @@ -57,7 +57,8 @@
>  		};
>  
>  		cpld@3,0 {
> -			compatible = "fsl,t1040rdb-cpld","fsl,t1042rdb-cpld";
> +			compatible = "fsl,t1040rdb-cpld","fsl,t1042rdb-cpld",
> +					"fsl,t1042rdb_pi-cpld";
>  			reg = <3 0 0x300>;
>  		};
>  	};

What's going on here?  This file is used by all three boards.  If you need to distinguish one board's CPLD from another's, you'll have to do it somewhere else.  If the CPLDs are exactly the same and no distinction needs to be made, then you don't need three compatible strings.  Even then, you may wish to specify the exact board as the first compatible string, but again you'll need to patch that in elsewhere so that it actually matches the board
.
As the register set of CPLD for all three boards is same, I am thinking of replacing this with t104srdb-cpld
compatible = "fsl,t104xrdb-cpld","
Is this OK?

-Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
