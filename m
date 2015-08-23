From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform devices
Date: Sun, 23 Aug 2015 16:52:46 -0500
Message-ID: <CAL_JsqJwpTdKdvDTUN5H3fjd9pDinShjk9Kp2J5=DUUo4iFsZg@mail.gmail.com>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
 <1433686811-12303-3-git-send-email-grant.likely@linaro.org>
 <20150615164630.GC1583@katana> <CAPybu_0S2b+xo3UJKbgpu39rtPT2x89+nEZ_hahLXiGbcCmeEA@mail.gmail.com>
 <CAPybu_0dYgQ_vKnXhZyOf-m5Z7DOnRKD4bB91dWk41pepmqDDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPybu_0dYgQ_vKnXhZyOf-m5Z7DOnRKD4bB91dWk41pepmqDDA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 16, 2015 at 3:33 PM, Ricardo Ribalda Delgado
<ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> ping?
>
> Hello Grant, Hello Greg
>
> Is there any planned timeframe for applying this patch into someones tree?

Greg is out ATM. I'll pick this up for 4.3.

Rob

>
>
> Thanks!
>
> On Tue, Jun 23, 2015 at 7:12 PM, Ricardo Ribalda Delgado
> <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hello
>>
>>> Tested-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
>>
>> This patch now have a bunch of tested-by and without it, the current
>> version of linux-next crash.
>>
>> Who will take it? Grant,  Greg? Please make sure to notify
>> linux-stable since at least 4.1
>>
>> Thanks!
>>
>>
>> --
>> Ricardo Ribalda
>
>
>
> --
> Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
