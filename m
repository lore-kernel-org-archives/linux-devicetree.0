From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v3 2/5] ARM: dts: pxa: add clocks
Date: Sat, 07 Feb 2015 14:16:06 +0100
Message-ID: <87a90p9815.fsf@free.fr>
References: <1423312760-15871-1-git-send-email-robert.jarzmik@free.fr>
	<1423312760-15871-2-git-send-email-robert.jarzmik@free.fr>
	<54D60B79.5060206@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54D60B79.5060206-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> (Sergei Shtylyov's message
	of "Sat, 07 Feb 2015 15:56:25 +0300")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> writes:

> Hello.
>
> On 2/7/2015 3:39 PM, Robert Jarzmik wrote:
>> +		stuart: uart@40700000 {
>> +			clocks = <&pxa2xx_clks CLK_STUART>;
>> +		};
>> +
>
>    The ePAPR standard tells to call such nodes "serial", not "uart".
Good to know, but not for this patch.

The naming is coming from pxa2xx.dtsi. And you're very welcome to post a patch
to fix that ;)

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
