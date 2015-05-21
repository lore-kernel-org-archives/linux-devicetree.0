From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl: Add FMan best effort port compatible
Date: Wed, 20 May 2015 22:04:21 -0500
Message-ID: <1432177461.27761.196.camel@freescale.com>
References: <1431938519-11343-1-git-send-email-igal.liberman@freescale.com>
	 <1431983358.27761.11.camel@freescale.com>
	 <DM2PR03MB383ED154B2D6379219C60E8E6C30@DM2PR03MB383.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DM2PR03MB383ED154B2D6379219C60E8E6C30-ufbTtyGzTTRJonC5hhDUuuO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liberman Igal-B31950 <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Bucur Madalin-Cristian-B32716 <madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-05-19 at 04:27 -0500, Liberman Igal-B31950 wrote:
> Hi Scott,
> I understand your point, let me please explain more about the hardware configuration and suggest another solution.
> I'm referring only to external ports (TX/RX), not OP.
> In FMan V3 we have maximum of 8 Port, it depends on the FMan revision (in B4, T2, T4 we have 8 ports, in T1024 and T1040 we have 4).
> The following configuration are valid:
> 	- All 8 ports can work as 1G ports. 
> 	- Ports 7, 8 (if available) can work as 10G (with full hardware resources).
> 	- Port 1, 2 (1 in T1024; 1, 2 in T2080) can be configured as 10G (with limited hardware resources).
> Currently we use only "fsl,fm-v3-port-rx/tx".
> 
> We can go 2 ways:
> 1. Having 2 compatibles:
> 	"fsl,fman-v3-port-rx/tx"
> 	"fsl,fman-v3-best-effort-port-rx/tx"
> 
> 	The driver can determine the port type of "fsl,fman-v3-port-rx/tx" by reading the HW port id.
> 	"fsl,fman-v3-best-effort-port-rx/tx" will let the driver know about the best effort port and it will be used instead of "fsl,fman-v3-port-rx/tx".
> 
> In your opinion, should we add "fsl,fman-v3-10g-port-rx/tx" for 10G (with full hardware resources)?
> In such chase, "fsl,fman-v3-port-rx/tx" will denote 1G explicitly.
> 
> In FMan V2, dual ports/MACs are not available, so no need change the compatibles.

The compatible string should describe what programming interface is
present.  Other information should be in other properties.  Having the
same compatible for tx and rx definitely seems wrong.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
