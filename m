From: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Subject: Re: GPIO - marking individual pins (not) available in device tree
Date: Fri, 24 Oct 2008 17:17:42 -0500
Message-ID: <49024986.5030406@genesi-usa.com>
References: <4900ED81.3040202@genesi-usa.com>
	<20081024164120.GA14350@oksana.dev.rtsoft.ru>
	<20081024170128.GA20577@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20081024170128.GA20577-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org
Cc: linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



Anton Vorontsov wrote:
> On Fri, Oct 24, 2008 at 08:41:20PM +0400, Anton Vorontsov wrote:
> [...]
>>> Would we suggest a node;
>>>
>>> gpio-header {
>>> 	compatible = "bplan,efika-gpio";
>>> 	gpios = <&gpio-standard 16 0 17 0>;
>>> };
>>>
>>> gpio-header2 {
>>> 	compatible = "bplan,efika-gpio-wkup";
>>> 	gpios = <&gpio-wkup 18 0>;
>>> };
>> IMO this looks very reasonable. You properly describe the hardware:
>> physical device (header) and its resources.
> 
> If there are actually two headers, that is. If you use two nodes
> just to specify which gpio is wkup, that is's a bit ugly... Why not
> 
> gpio-header {
> 	compatible = "bplan,<board>-gpio-header";
> 	gpios = <&standard 16 0
> 		 &standard 17 0
> 		 &wakeup 18 0>;
> }
> 
> And the driver whould know that on this particular <board>
> third gpio is the wakeup one?

Good point, I concede to your much better plan :D

Back to the other discussion, where we give individual GPIOs some
names so they are detectable and not just programmable as a bank,
do you have any ideas about that? :/

-- 
Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Genesi, Manager, Developer Relations
