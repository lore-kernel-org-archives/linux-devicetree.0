Return-Path: <SRS0=T388=NA=buserror.net=oss@kernel.org>
Message-ID: <bb158670f1556156f17c3a9eefaa0a5e35c1591e.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
Date: Sat, 20 Oct 2018 18:53:58 -0500
In-Reply-To: <20180919073906.34187-2-andy.tang@nxp.com>
References: <20180919073906.34187-1-andy.tang@nxp.com>
	 <20180919073906.34187-2-andy.tang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/3] powerpc: t102x: upgrade the legacy clock node
To: andy.tang@nxp.com, mturquette@baylibre.com
Cc: sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, 2018-09-19 at 15:39 +0800, andy.tang@nxp.com wrote:
> +clockgen: global-utilities@e1000 {
> +	compatible = "fsl,qoriq-clockgen";

Where does this compatible string come from?

> +		compatible = "fsl,t1023-clockgen";
>  	};

And here you overwrite it with only the chip-specific compatible?

Is t1023 incompatible with both fsl,qoriq-clockgen-1.0 and fsl,qoriq-clockgen-
2.0?  The existing dts says 2.0; is that wrong?

BTW, assuming it is 2.0 compatible and thus the use of qoriq-clockgen2.dtsi is
correct, the best course of action is probably to to remove the legacy stuff
from all fsl chips, rather than introduce a new dtsi.  In fact it'd be nice to
see it all removed in any case. :-)

Also, please post any patches that you want me to apply to the linuxppc-dev
mailing list.

-Scott
