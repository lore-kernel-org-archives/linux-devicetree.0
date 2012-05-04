From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 04/14] OF: pinctrl: MIPS: lantiq: implement lantiq/xway
 pinctrl support
Date: Fri, 04 May 2012 23:29:53 +0200
Message-ID: <4FA44A51.9070204@openwrt.org>
References: <1336133919-26525-1-git-send-email-blogic@openwrt.org>
 <1336133919-26525-4-git-send-email-blogic@openwrt.org>
 <4FA442B6.1020501@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FA442B6.1020501-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

Thanks for the comments
> Overall looks pretty reasonable. Some comments below.
>
> There doesn't appear to be binding documentation. Something is needed to
> describe how to instantiate the pinctrl driver, and the format of the
> "pin configuration nodes". See
> Documentation/devicetree/bindings/pinctrl/ for some examples.
>
I am expecting to send a V2 of the series. This will include a patch
with the binding documentation. I am still fine tuning the patch.
>> +int irq_to_gpio(unsigned int gpio)
>> +{
>> +	return -EINVAL;
>> +}
>> +EXPORT_SYMBOL(irq_to_gpio);
> Hasn't this function been removed? Perhaps it's only ARM that removed it.

We need it on MIPS. I am not sure if other arches need it.  OF does
obselete this function i guess.

>> +static inline int xway_gpio_pin_count(void)
>> +{
>> +	if (of_machine_is_compatible("lantiq,ar9") ||
>> +			of_machine_is_compatible("lantiq,gr9") ||
>> +			of_machine_is_compatible("lantiq,vr9"))
>> +		return 56;
>> +	return 32;
>> +}
> What are those compatible values? Are they SoC variants or boards?

These are the adsl, vdsl and no dsl SoCs. I don't really want this info
inside the DT as it is static. I will follow the .data variant you proposed.
> Presumably, of_gpiochip_add() above dynamically allocates the base GPIO
> number? If so, that value needs to be transferred into
> xway_gpio_range.base too.
>

Yes, i missed that one.


Thanks,
John
