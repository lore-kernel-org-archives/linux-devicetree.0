From: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 01/12] ARM: dts: imx51-ts4800: Fix syscon and
 touschscreen nodes
Date: Fri, 1 Dec 2017 14:45:16 -0500
Message-ID: <20171201194516.ix2oa7waxy5ph55s@workotop.localdomain>
References: <1512156285-18451-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512156285-18451-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Dec 01, 2017 at 05:24:34PM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> 
> The syscon node has an incorrect notation for its unit address and the
> wdt node has an unneeded unit address.
> 
> Fix them so that the following build warnings with W=1 are gone:
> 
> arch/arm/boot/dts/imx51-ts4800.dtb: Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
> arch/arm/boot/dts/imx51-ts4800.dtb: Warning (unit_address_vs_reg): Node /soc/aips@80000000/weim@83fda000/fpga@0/syscon@b0010000/wdt@e has a unit name, but no reg property
> arch/arm/boot/dts/imx51-ts4800.dtb: Warning (unit_address_vs_reg): Node /soc/aips@80000000/weim@83fda000/fpga@0/touchscreen has a reg or ranges property, but no unit name
> arch/arm/boot/dts/imx51-ts4800.dtb: Warning (simple_bus_reg): Node /soc/aips@80000000/weim@83fda000/fpga@0/syscon@b0010000 simple-bus unit address format error, expected "10000"
> arch/arm/boot/dts/imx51-ts4800.dtb: Warning (simple_bus_reg): Node /soc/aips@80000000/weim@83fda000/fpga@0/touchscreen simple-bus unit address format error, expected "12000"
> 
> Cc: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Changes are fine to me, thank you for fixing the warnings. I don't know
what the rule is and if I should reply with a tag like Reviewed-by or
anything else, please let me know.

-- 
Damien
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
