From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [BUG] GPIO: irq: no irq domain found for
Date: Thu, 23 May 2013 10:42:50 +0200
Message-ID: <20130523084250.GJ1952@game.jcrosoft.org>
References: <20130521203935.GI1952@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130521203935.GI1952-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 22:39 Tue 21 May     , Jean-Christophe PLAGNIOL-VILLARD wrote:
> Hi,
> 
> 	I'm currently adding the ks8851-ml support to a at91 board
> 
> 	On this board we use a gpio as interrupt but I found an issue
> 
> 	when populating the platfomr devices we try found the virq for the
> 	ks8851 but the irq domain is not yet present as the gpio driver (a
> 	platform device is not probed) so we get this
> 
> 	irq: no irq domain found for /ahb/apb/pinctrl@fffff400/gpio@fffffa00 !
> 
> 	if we use a gpio irq for a i2c or spi devices it will work as the spi
> 	bus will be populate after the gpio driver will be probed
> 
> 	Do you have any idea how can we delay the population of the
> 	ks8851 device? via -EPROBE_DEFER?

I continue to debug and found that to make it work we need to have a specific
driver init

we need before calling
	 of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
to create all the irq domain

so we need to probe the gpio driver before, but as the gpio driver (on at91
the same driver do pintrl + gpio) is a platform_device, we need to call

of_platform_device_create_pdata(np, NULL, NULL, NULL);

on the gpio nodes and pinctrl

but as of_platform_populate & co does not check if a node is already handled
we need modify it to track it

Grant do you want to do this way or do you have something else in mind

Best Regards,
J.
