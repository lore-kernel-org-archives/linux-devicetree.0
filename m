From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v12 RESEND 0/4] generic TEE subsystem
Date: Tue, 1 Nov 2016 14:20:58 -0500
Message-ID: <4eb80778-cfe3-f4c0-d1ee-0d798c8ddd35@ti.com>
References: <1477649984-16777-1-git-send-email-jens.wiklander@linaro.org>
 <1e532aeb-4944-62e4-c8c4-1e23438b92cd@ti.com>
 <20161028181914.xkse5orwwp42dvj3@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161028181914.xkse5orwwp42dvj3-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/28/2016 01:19 PM, Mark Brown wrote:
> On Fri, Oct 28, 2016 at 10:43:24AM -0500, Andrew F. Davis wrote:
> 
>> Do we see this as a chicken and egg situation, or is there any harm
>> beyond the pains of supporting an out-of-tree driver for a while, to
>> wait until we have at least one other TEE to add to this subsystem
>> before merging?
> 
> We haven't been overburneded with TEE vendors wanting to get their
> driver code into mainline - do we have any reasonable prospect of other
> TEE vendors with an interest in mainline turning up in any kind of
> reasonable timeframe?
> 

Doesn't look like anyone has near-term plans for upstreaming non-OPTEE
TEEs, we don't at least (TI), so I guess I see no reason right now to
delay upstreaming of this TEE's driver on the off-chance it is
incompatible with a TEE that may or may not try to get upstreamed later.
I'll redact my objection for now.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
