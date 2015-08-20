From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] Altera Modular ADC driver device tree binding
Date: Thu, 20 Aug 2015 17:54:04 +0200
Message-ID: <55D5F81C.40904@metafoo.de>
References: <1440056795-6190-1-git-send-email-cnphoon@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440056795-6190-1-git-send-email-cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chee Nouk Phoo <cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, cnphoon.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/20/2015 09:46 AM, Chee Nouk Phoo wrote:
> From: Chee Nouk Phoon <cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> 
> Altera Modular ADC is soft IP that wraps the hardened ADC block in a Max1
> device. It can be configured to dual ADC mode that supports two channel
> synchronous sampling or independent single ADCs. ADC sampled values will be
> written into memory slots in sequence determined by a user configurable
> sequencer block.
> 
> This patch adds device tree binding for Altera Modular ADC driver

Is there also a driver for the device? Would be nice to see some of the DT
properties in context.

[...]
> +- altr,adc-slot-count : specify number of conversion slot in use
> +
> +- altr,adc<ADC index>-slot-sequence-<slot index>: specify ADC channel 
> +  conversion sequence
> +  <ADC index>: instantiated ADC number
> +  <slot index>: slot index for ADC memory slot
> +

These attributes for example sound like a software rather than a hardware
configuration.
