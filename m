From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RESEND PATCHv3 2/2] regulator: fixed: Handle optional
 overcurrent pin
Date: Thu, 15 Dec 2016 14:03:40 +0100
Message-ID: <CAKXjFTOSRm=EJLB2pokQW=ZeqJzN1KUG4Eti6LEoGPZMmRj2mg@mail.gmail.com>
References: <20161215112856.9541-3-ahaslam@baylibre.com> <20161215121958.klssvbtbuhsz3pga@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161215121958.klssvbtbuhsz3pga-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 15, 2016 at 1:19 PM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Dec 15, 2016 at 12:28:56PM +0100, Axel Haslam wrote:
>
>> +             ret = devm_request_threaded_irq(&pdev->dev,
>> +                             gpiod_to_irq(drvdata->oc_gpio), NULL,
>> +                             reg_fixed_overcurrent_irq, irqflags,
>> +                             "over_current", drvdata);
>
>>       drvdata->dev = devm_regulator_register(&pdev->dev, &drvdata->desc,
>>                                              &cfg);
>
> We are registering a managed interrupt for the interrupt handler and we
> are registering it before we register the regulator.  This means that
> the interrupt may fire in both probe and remove paths without the
> regulator which it will then try to use in the interrupt handler,
> potentially crashing the system.  It's better to register the interrupt
> after the regulator (which will make the managed bit OK) to avoid this
> possibility.

will fix, and send v4.

Regards,
Axel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
