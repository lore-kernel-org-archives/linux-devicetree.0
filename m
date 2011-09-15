From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH] [v2] powerpc/85xx: clean up FPGA device tree nodes for
	Freecsale QorIQ boards
Date: Thu, 15 Sep 2011 12:55:24 -0500
Message-ID: <4E723C0C.103@freescale.com>
References: <1316036538-311-1-git-send-email-timur@freescale.com>
	<454A6F08-BD85-4C80-BF0D-3BC04D95EA36@freescale.com>,
	<4E722860.8090605@freescale.com>
	<95760360-FBCE-4D68-B2AB-A5270F8FBD0F@freescale.com>
	<4E723B0A.9000802@freescale.com>
	<45584309-BA30-4C2A-AF5E-AE22506D705D@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <45584309-BA30-4C2A-AF5E-AE22506D705D@freescale.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Kumar Gala <kumar.gala@freescale.com>
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, Gala Kumar-B11780 <B11780@freescale.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Kumar Gala wrote:
>> > 	compatible = "fsl,p3060qds-fpga", "fsl,fpga-qixis";

> Right, I pulled those bits out of your patch.

I was hoping you'd notice that in v3 of my patch, I changed fsl,p3060qds-qixis
to fsl,p3060qds-fpga.  I think

	"fsl,p3060qds-qixis", "fsl,fpga-qixis";

looks kinda dumb.

-- 
Timur Tabi
Linux kernel developer at Freescale
