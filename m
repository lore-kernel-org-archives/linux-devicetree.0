From: Brandon Martin <martinbv-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
Subject: Re: [PATCH 1/2] rtc: v3020: Add documentation for DT bindings
Date: Mon, 28 Aug 2017 22:30:58 -0400
Message-ID: <59A4D1E2.3010208@mothictech.com>
References: <b832db93-9885-adfe-39b4-1950851b391d@mothictech.com> <660fa006-4f91-2fb5-ef98-ba0482e1ecff@mothictech.com> <20170825215457.qcd5paiw5qtuybxv@rob-hp-laptop> <59A0A664.7040904@mothictech.com> <CAL_JsqLgxQ1xKg6mWHQTjq-u3ukOu7n1kwBspVnpF6XDxWpVFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLgxQ1xKg6mWHQTjq-u3ukOu7n1kwBspVnpF6XDxWpVFw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/28/2017 02:36 PM, Rob Herring wrote:
> I only meant for the GPIO based connection, that it looks like SPI bitbanging.

I guess the question then becomes if that's an appropriate thing to do 
as part of a change set intended only to add DT bindings to an existing 
driver.  It wouldn't remove much code since much of the bit-banging type 
code still needs to remain to support the MMIO mode.

The chip does explicitly support a SPI type connection, but I'm unaware 
of any boards using it with a real SPI controller.
-- 
Brandon Martin
Mothic Technologies
317-565-1357 x7000
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
