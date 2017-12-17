From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 2/9] ARM: dts: imx7-colibri: make sure multiplexed pins
 are not active
Date: Sun, 17 Dec 2017 21:02:56 +0100
Message-ID: <38b23042a694d56198c398f21c4aa5d1@agner.ch>
References: <20171206153005.6144-1-stefan@agner.ch>
 <20171206153005.6144-2-stefan@agner.ch>
 <CAOMZO5AD6bDEMStEWY8hRG_8gh0RAD_66zboTsKd-cFkPtiLKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5AD6bDEMStEWY8hRG_8gh0RAD_66zboTsKd-cFkPtiLKg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-12-16 15:01, Fabio Estevam wrote:
> On Wed, Dec 6, 2017 at 1:29 PM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
>> The Colibri pins PWM<A> and <D> are multiplexed on the module, make
>> sure the secondary SoC pin is not active.
>>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> 
> I haven't really understood the commit message, but this is probably
> because I don't have access to the schematics.

It means that the modules pins are connected to two SoC pads. It is also
mentioned in the Colibri iMX7 datasheet.

This allows to use the module pin for a different purpose, but we mux it
such that it is usable for the primary purpose (which is PWM).

> 
> Anyway:
> 
> Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Thanks!

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
