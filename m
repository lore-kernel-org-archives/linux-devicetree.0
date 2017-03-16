From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 1/3] devicetree: add vendor prefix for Khadas
Date: Thu, 16 Mar 2017 07:00:55 +0100
Message-ID: <61778a7a-3d96-8de3-fd4f-f18aa0938a68@suse.de>
References: <20170304215126.7020-1-martin.blumenstingl@googlemail.com>
 <20170304215126.7020-2-martin.blumenstingl@googlemail.com>
 <20170315195737.vckgpw6qad4d4zjm@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170315195737.vckgpw6qad4d4zjm@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, gouwa-GEqbEQZgqepWk0Htik3J/w@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 15.03.2017 um 20:57 schrieb Rob Herring:
> On Sat, Mar 04, 2017 at 10:51:24PM +0100, Martin Blumenstingl wrote:
>> Khadas is a new sub-brand of Shenzhen Wesion Technology CO.,LTD. They
>> are developing Amlogic and Rockchip based "DIY boxes" (single board
>> computers): http://khadas.com/
>> They are best know for their latest product: the Khadas VIM (an Amlogic
>> GXL S905X based SBC).
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>  1 file changed, 1 insertion(+)
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Shouldn't the entry reflect what is in the commit message rather than
just repeat the prefix? I.e., something like "Khadas by Shenzhen Wesion
Technology Co., Ltd." (which I believe is the official spelling and
spacing of these abbreviations also for the commit message).

An Acked-by from the CC'ed vendor would also be desirable. :)

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
