From: Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] misc: added Spreadtrum's radio driver
Date: Wed, 5 Jul 2017 18:18:56 +0800
Message-ID: <CAAfSe-vj76psYw2uzC2w0pASRT-FGHqXph0zWE_3tmMVzMHKvg@mail.gmail.com>
References: <20170704101508.30946-1-chunyan.zhang@spreadtrum.com>
 <20170704101508.30946-3-chunyan.zhang@spreadtrum.com> <CAK8P3a0i-H=uU=9DNJbtK2EMX2GJ5cL_TW0roSHpa6tHTcZ2sg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a0i-H=uU=9DNJbtK2EMX2GJ5cL_TW0roSHpa6tHTcZ2sg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Songhe Wei <songhe.wei-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Zhongping Tan <zhongping.tan-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Orson Zhai <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 4 July 2017 at 18:51, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tue, Jul 4, 2017 at 12:15 PM, Chunyan Zhang
> <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> wrote:
>> This patch added FM radio driver for Spreadtrum's SC2342, which's
>> a WCN SoC, also added a new directory for Spreadtrum's WCN SoCs.
>>
>> Signed-off-by: Songhe Wei <songhe.wei-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
>> Signed-off-by: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
>
> (adding linux-media folks to Cc)

(You forgot to add them in :))

>
> Hi Chunyan,

Hi Arnd,

>
> Thanks for posting this for inclusion as Greg asked for. I'm not sure what
> the policy is for new radio drivers, but I assume this would have to go
> to drivers/staging/media/ as it is a driver for hardware that fits into
> drivers/media/radio but doesn't use the respective APIs.

Ok, I agree to let it go to drivers/staging/media/.

Like I mentioned, SC2342 includes many functions, this patch is only
adding FM radio function included in SC2342 to the kernel tree.  So I
figure that its lifetime probably will not be too long, will remove it
from the kernel tree when we have a clean enough version of the whole
SC2342 drivers for the official upstreaming.

Thanks,
Chunyan

>
>         Arnd
> ---
> end of message, full patch quoted for reference below
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
