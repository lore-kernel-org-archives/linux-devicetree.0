From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v8] reset: Add driver for gpio-controlled reset pins
Date: Tue, 16 Jul 2013 09:47:02 -0600
Message-ID: <51E56AF6.30506@wwwdotorg.org>
References: <1369904940-716-1-git-send-email-p.zabel@pengutronix.de>
 <20130716015038.GD28375@S2101-09.ap.freescale.net>
 <20130716065130.GB30067@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130716065130.GB30067-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Len Brown <len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/16/2013 12:51 AM, Shawn Guo wrote:
> On Tue, Jul 16, 2013 at 09:50:42AM +0800, Shawn Guo wrote:
>> Hi Philipp,
>>
>> On Thu, May 30, 2013 at 11:09:00AM +0200, Philipp Zabel wrote:
>>> This driver implements a reset controller device that toggle a gpio
>>> connected to a reset pin of a peripheral IC. The delay between assertion
>>> and de-assertion of the reset signal can be configured via device tree.
>>>
>>> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> I see this patch is very useful, as GPIOs are widely used to reset
>> components/devices on board.  But I do not find the patch in v3.11-rc1.
>> What's your plan about it?
>>
>> Also, I'm wondering if we should register the driver a little bit
>> early.  Please see the following patch.  If it makes sense to you,
>> I can send the patch to you, or you can just quash it into yours.
> 
> And here is another change request.

> diff --git a/drivers/reset/gpio-reset.c b/drivers/reset/gpio-reset.c

> -	gpio_set_value(drvdata->gpio, value);
> +	if (gpio_cansleep(drvdata->gpio))
> +		gpio_set_value_cansleep(drvdata->gpio, value);
> +	else
> +		gpio_set_value(drvdata->gpio, value);

That's not right. Calling gpio_set_value() v.s.
gpio_set_value_cansleep() should be based on the properties of the
calling context, not the GPIO being controlled. In other words, if it's
permissible to call gpio_set_value_cansleep() at this point in the code,
simply always call that, and remove the conditional logic.
