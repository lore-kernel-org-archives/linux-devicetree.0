From: Tabi Timur-B04825 <B04825@freescale.com>
Subject: Re: [PATCH] powerpc/85xx: clean up FPGA device tree nodes for
	Freecsale QorIQ boards
Date: Wed, 31 Aug 2011 02:51:57 +0000
Message-ID: <4E5DA1CC.1020808@freescale.com>
References: <1314644999-16955-1-git-send-email-timur@freescale.com>
	<3F34FBCD-3F0B-4D59-A947-C16CC812B42E@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <3F34FBCD-3F0B-4D59-A947-C16CC812B42E@freescale.com>
Content-Language: en-US
Content-ID: <EC74057E1F014640BFC185168AB7D65A@freescale.net>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Gala Kumar-B11780 <B11780@freescale.com>
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Kumar Gala wrote:
> Do we really want the generic "fsl,fpga-cpld"&  "fsl,fpga-pixis"?  This seems to vague.

Yes, the PIXIS is generally register compatible across all boards.  There 
may be some minor differences, but the OCM driver can work with all PIXIS 
boards that have an PIXIS.

>  Also you need "pixis" on MPC8544DS, MPC8572DS, MPC8536DS.

Ok.

> Also fpga-cpld makes no sense if we keep this.  You are either a CPLD or FPGA not both.

Then I don't understand what the CPLD is.

-- 
Timur Tabi
Linux kernel developer at Freescale
