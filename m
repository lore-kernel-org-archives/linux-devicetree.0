From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: rename oxnas dts files
Date: Mon, 15 Jan 2018 15:54:31 +0100
Message-ID: <05179c69-5878-f8ec-76f1-00de21e1b75d@baylibre.com>
References: <20180113173553.GA30727@makrotopia.org>
 <CAK8P3a1NUww8pGWr=gvxSDk4p7Emoq9NJyGfs8N86bU_sqgnpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a1NUww8pGWr=gvxSDk4p7Emoq9NJyGfs8N86bU_sqgnpQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Cc: DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 15/01/2018 15:45, Arnd Bergmann wrote:
> On Sat, Jan 13, 2018 at 6:35 PM, Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org> wrote:
>> Other platforms' device-tree files start with a platform prefix, such as
>> sun7i-a20-*.dts or at91-*.dts.
>> This naming scheme turns out to be handy when using multi-platform build
>> systems such as OpenWrt.
>> Prepend oxnas files with their platform prefix to comply with the naming
>> scheme already used for most other platforms.
>>
>> Signed-off-by: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
> 
> There are few changes to oxnas in general, and Neil doesn't appear to be around
> to ask at the moment.
> I assume he doesn't mind me picking it up into next/dt directly.
> 
> Merged now, thanks,
> 
>         Arnd
> 


Hi Daniel,

Thanks for pushing this change, these a low-priority supported devices, OK to rename them.

(I must no forget to changes my test scripts, or I will get a huge headache)

Arnd, thanks for taking this directly.

Neil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
