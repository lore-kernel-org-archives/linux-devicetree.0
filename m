From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] of/fdt: skip unflattening of disabled nodes
Date: Thu, 5 Oct 2017 14:29:33 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1710051427000.1693@knanqh.ubzr>
References: <20171003161815.25999-1-robh@kernel.org> <20171003161815.25999-2-robh@kernel.org> <nycvar.YSQ.7.76.1710031444060.5407@knanqh.ubzr> <59D40813.4020009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59D40813.4020009-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 3 Oct 2017, Frank Rowand wrote:

> On 10/03/17 11:46, Nicolas Pitre wrote:
> > On Tue, 3 Oct 2017, Rob Herring wrote:
> > 
> >> For static DT usecases, we don't need the disabled nodes and can skip
> >> unflattening. This saves a significant amount of RAM in memory constrained
> >> cases. In one example on STM32F469, the RAM usage goes from 118K to 26K.
> >>
> >> There are a few cases in the kernel that modify the status property
> >> dynamically. These all are changes from enabled to disabled, depend on
> >> OF_DYNAMIC or are not FDT based (PDT based).
> >>
> >> Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > 
> > Tested-by: Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > 
> >> ---
> >> For more background, see this presentation from Nico:
> >>
> >> https://connect.linaro.org/resource/sfo17/sfo17-100/
> > 
> > Oh my ... this is horrible ...
> 
> I found the presentation to be quite good and useful.

Thanks. I think the content is good. I'm just a terrible speaker.

> The Linaro site does not have the slides, could you please send
> me a copy?

I've asked for the slides to be uploaded to the site. I've sent you a 
copy privately in the mean time.


Nicolas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
