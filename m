From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: esdhc binding compatiable
Date: Mon, 4 May 2009 08:54:28 -0500
Message-ID: <54E4E37F-460A-4BB4-9DE1-670360D649A6@kernel.crashing.org>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Phillips Kim-R1AAHA <Kim.Phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There has been some discussion on various lists about what the binding  
doc says w/regards to compat binding for eSHDC on 83xx, 85xx, pxxxx.

My thinking is that we wanted to avoid "fsl,eshdc" as possibly being  
to generic (some theory that esdhc might be same or similar controller  
on iMX devices from FSL).  If that's the case I'm thinking something  
like:

fsl,pq-eshdc	(covers 83xx, 85xx family)
fsl,qoirq-esdhc (covers any new p2xxx, p4xxx, etc..)

and if imx needs it

fsl,imx-esdhc

this would be the base compatible.  In addition to that we've  
discussed having a fsl,pq-eshdc-vX.Y compat to match the IP version in  
the specific SoC.

thoughts?

- k
