From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: MediaTek: Add binding document for the
 AUXADC
Date: Wed, 24 Feb 2016 15:36:46 +0100
Message-ID: <56CDBFFE.9050406@gmail.com>
References: <1455866326-15095-1-git-send-email-s.hauer@pengutronix.de>
 <20160223203254.GA14660@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160223203254.GA14660@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 23/02/16 21:32, Rob Herring wrote:
> On Fri, Feb 19, 2016 at 08:18:46AM +0100, Sascha Hauer wrote:
>> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> ---
>>
>> This is a supplement to the MTK Thermal series which was lacking the
>> description for the AUXADC.
>
> So it will be applied with that I presume.
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>

Well the basic problem that I see is, that the auxadc has some more 
registers (at least in mt6589) for the touch screen registers.
So this makes it a candidate for syscon and regmap.
But this needs a patch in the thermal driver first...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
