From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: esdhc binding compatiable
Date: Tue, 05 May 2009 07:01:09 -1000
Message-ID: <4A0070D5.7090203@firmworks.com>
References: <54E4E37F-460A-4BB4-9DE1-670360D649A6@kernel.crashing.org>	<20090504211110.GC28413@ld0162-tx32.am.freescale.net>
	<12EB7A56-CD13-4F7F-9E36-CDD6D579AC3A@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <12EB7A56-CD13-4F7F-9E36-CDD6D579AC3A-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, Phillips Kim-R1AAHA <Kim.Phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>
> On May 4, 2009, at 4:11 PM, Scott Wood wrote:
>
>> On Mon, May 04, 2009 at 08:54:28AM -0500, Kumar Gala wrote:
>>> There has been some discussion on various lists about what the binding
>>> doc says w/regards to compat binding for eSHDC on 83xx, 85xx, pxxxx.
>>>
>>> My thinking is that we wanted to avoid "fsl,eshdc" as possibly being
>>> to generic (some theory that esdhc might be same or similar controller
>>> on iMX devices from FSL).  If that's the case I'm thinking something
>>> like:
>>
>> If it's the *same* controller, then it should have the same compatible
>> (and the same driver).
>
> Define the *same*.  I believe things might be 90/95% the same but 
> there is probably some 5/10% SoC unique integration changes between an 
> eSDHC on a PPC vs ARM SoC from FSL.  For example in the imx version 
> they have a few registers called ADMA Error Status & ADMA Address 
> which we don't have on PQ devices.


If the devices have the same basic programming model - which is pretty 
clearly the case if they are 90% identical - then you would want to 
maintain one driver instead of two.  The compatible property would be 
the same to bind the one driver.  Invent additional properties as 
necessary to describe variations.  Try to describe the differences 
directly, e.g. "has-adma-address", instead of having an ever-growing 
table in the driver that effectively says "if this is variant XYX from 
manufacturer PDQ, then we happen to know that has an ADMA address 
register".  That prevents having to rev the driver for every new model - 
you only have to rev the driver when a new kind of variation is invented.
