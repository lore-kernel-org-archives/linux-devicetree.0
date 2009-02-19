From: Laurent Gregoire <laurent.gregoire-Jdzig1fPfSTQT0dZR+AlfA@public.gmane.org>
Subject: RE: Of the device tree binary format endianness on
	little-endianplatform
Date: Thu, 19 Feb 2009 09:54:55 +0100
Message-ID: <1235033695.17001.142.camel@pc-laurentg.intra.local>
References: <1234975585.17001.131.camel@pc-laurentg.intra.local>
	<499C40F0.5020800@firmworks.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA304C9D5EA@az33exm25.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <9696D7A991D0824DBA8DFAC74A9C5FA304C9D5EA-ofAVchDyotYzzZk0BCvKg5jmvxFtTJ+o0e7PPNI6Mm0@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Yoder Stuart-B08248 <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> Please take a look at the ePAPR where the flattened 
> device tree format is formally speced out.
> 
> http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.pdf
> 
> Integers in property values and in the DTB structure
> are all big-endian.

According to all this discussion so far, we'll then keep the binary
format to big-endian, and dynamically switch endianness on the target
itself.

ARM could be configured in both mode anyway, so that also make sense to
always use the same endianness regardless of the target one.


Laurent GREGOIRE
Embedded Software Engineering | TomTom | www.tomtom.com
