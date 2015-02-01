From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: dts: pxa: add pxa-timer to pxa27x
Date: Sun, 01 Feb 2015 20:43:33 +0100
Message-ID: <87egq9beoq.fsf@free.fr>
References: <1422744510-3179-1-git-send-email-robert.jarzmik@free.fr>
	<1422744510-3179-5-git-send-email-robert.jarzmik@free.fr>
	<20150201130755.GA25767@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150201130755.GA25767@leverpostej> (Mark Rutland's message of
	"Sun, 1 Feb 2015 13:07:55 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:

> On Sat, Jan 31, 2015 at 10:48:30PM +0000, Robert Jarzmik wrote:
>> +	clocksources {
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges;
>> +
>
> There is absolutely no need for this container node.
>
> Please get rid of it and place the node below directly under the parent
> node.
OK.

Cheers.

--
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
