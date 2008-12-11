From: Trent Piepho <tpiepho-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/4] leds: Support OpenFirmware led bindings
Date: Thu, 11 Dec 2008 13:33:51 -0800 (PST)
Message-ID: <Pine.LNX.4.64.0812111326480.28806@t2.domain.actdsltmp>
References: <1228923703-16370-1-git-send-email-tpiepho@freescale.com>
	<20081210163217.GA20150@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20081210163217.GA20150-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
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
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Sean MacLennan <smaclennan-Qtffpm9i2AVWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 10 Dec 2008, Anton Vorontsov wrote:
>> +	gpio_direction_output(led_dat->gpio, led_dat->active_low);
>
> This can fail (yeah, the original code didn't check return value
> either).

I've added a check.

>> +		unsigned int flags;
>
> I think it would be better to use `enum of_gpio_flags' type here,
> just for clarity.

You're right, I forgot to change this after the of_get_gpio patch was
changed.

>> +		ret = create_gpio_led(&led, &pdata->led_data[pdata->num_leds++],
>> +				      &ofdev->dev, NULL);
>> +		if (ret < 0)
>
> of_node_put(np); is missing here.

of_node_put(child) you mean.  It's easy to forget this when one exits one
of these iterators early, since there's no explicit get or put otherwise.
