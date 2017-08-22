From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: r8a7743: add IIC cores to dtsi
Date: Tue, 22 Aug 2017 15:23:39 +0300
Message-ID: <b7434757-b151-5971-2b5f-525eeaf11467@cogentembedded.com>
References: <12d923ba-184c-ef59-f27b-41a7592a5f93@cogentembedded.com>
 <1502704398-28378-1-git-send-email-biju.das@bp.renesas.com>
 <TY1PR06MB07027D9A55FBFE2D591CEDCFB7840@TY1PR06MB0702.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <TY1PR06MB07027D9A55FBFE2D591CEDCFB7840-/PRLmSCtZ14u2TXDOttQZW0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-MW
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/22/2017 12:10 PM, Chris Paterson wrote:

>> From: Biju Das [mailto:biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org]
>> Sent: 14 August 2017 10:53
>>
>> Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>> ---
>> v1-->v2
>>     Corrected the resets property for i2c6 device node.
> 
> Are you happy with this version of the patch?
> 
> Or is the discussion for moving to 'iic' still alive?

    Yes, appears so. I'd like the labels to be named iic<n>.

> Thanks, Chris

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
