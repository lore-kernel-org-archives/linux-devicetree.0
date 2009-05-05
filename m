From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: esdhc binding compatiable
Date: Tue, 5 May 2009 06:29:38 -0500
Message-ID: <12EB7A56-CD13-4F7F-9E36-CDD6D579AC3A@kernel.crashing.org>
References: <54E4E37F-460A-4BB4-9DE1-670360D649A6@kernel.crashing.org>
	<20090504211110.GC28413@ld0162-tx32.am.freescale.net>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090504211110.GC28413-VKaLA/mbEU932VTgPCOETVjVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, Phillips Kim-R1AAHA <Kim.Phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On May 4, 2009, at 4:11 PM, Scott Wood wrote:

> On Mon, May 04, 2009 at 08:54:28AM -0500, Kumar Gala wrote:
>> There has been some discussion on various lists about what the  
>> binding
>> doc says w/regards to compat binding for eSHDC on 83xx, 85xx, pxxxx.
>>
>> My thinking is that we wanted to avoid "fsl,eshdc" as possibly being
>> to generic (some theory that esdhc might be same or similar  
>> controller
>> on iMX devices from FSL).  If that's the case I'm thinking something
>> like:
>
> If it's the *same* controller, then it should have the same compatible
> (and the same driver).

Define the *same*.  I believe things might be 90/95% the same but  
there is probably some 5/10% SoC unique integration changes between an  
eSDHC on a PPC vs ARM SoC from FSL.  For example in the imx version  
they have a few registers called ADMA Error Status & ADMA Address  
which we don't have on PQ devices.

- k
