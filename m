From: Stefan Wahren <info-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>
Subject: Re: strange dtc errors after adding sram node
Date: Wed, 27 Apr 2016 22:16:42 +0200
Message-ID: <57211E2A.5060807@lategoodbye.de>
References: <571B283F.8010707@lategoodbye.de>
 <1461407589.1986.3.camel@embedded.rocks> <571DB385.9010305@lategoodbye.de>
 <10749204.4vhK495hJd@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10749204.4vhK495hJd@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause-L1vi/lXTdtsfGbAt6QbQcg@public.gmane.org>, kernelnewbies-7JyXY6prKcjpASu1u0TL5ti2O/JbrIOy@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Am 25.04.2016 um 15:06 schrieb Arnd Bergmann:
> On Monday 25 April 2016 08:04:53 Stefan Wahren wrote:
>>
>> i've found reason for these errors. I missed to adjust the affected dts
>> files which refer to the ahb node.
>
> Makes sense. Maybe you can just remove the address and 'reg' property from
> the ahb node?

is this a proposal for a patch set?

Does it apply to all top-level nodes like apb?

> That should solve the dtc problem and make the contents
> more like what we have elsewhere.

Does it refer to a specific patch / discussion or something?

Regards
Stefan

>
> 	Arnd
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
