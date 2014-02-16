From: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 00/10] Support TI Light Management Unit devices
Date: Mon, 17 Feb 2014 08:51:39 +0900
Message-ID: <53014F0B.6010708@ti.com>
References: <1392359410-6852-1-git-send-email-milo.kim@ti.com> <20140214101439.GA9462@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140214101439.GA9462@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 02/14/2014 07:14 PM, Lee Jones wrote:
>> Milo Kim (10):
>>    mfd: Add TI LMU driver
>>    backlight: Add TI LMU backlight common driver
>>    backlight: ti-lmu-backlight: Add LM3532 driver
>>    backlight: ti-lmu-backlight: Add LM3631 driver
>>    backlight: ti-lmu-backlight: Add LM3633 driver
>>    backlight: ti-lmu-backlight: Add LM3695 driver
>>    backlight: ti-lmu-backlight: Add LM3697 driver
>>    leds: Add LM3633 driver
>>    regulator: Add LM3631 driver
>>    Documentation: Add device tree bindings for TI LMU devices
>
> It makes it much easier to track if you send your patch set (shallow)
> threaded i.e. all patches attached to [PATCH 0/x]. Having all of the
> patches sent individually they will get split up and spread out all
> over the reviewers INBOX, which becomes unwieldy very quickly.
>
> Please see git send-email options:
>    `--[no-]thread` and `--[no-]chain-reply-to`
>

Oh, sorry. I made a mistake.

I copied patch files from my working machine and sent them by using git 
send-email.

I should run
   git send-email --thread --no-chain-reply-to *.patch

but I did for each patch file, stupidly.
   git send-email --thread --no-chain-reply-to 0000-cover.patch
   git send-email --thread --no-chain-reply-to 
0001-mfd-Add-TI-LMU-driver.patch
..
   git send-email --thread --no-chain-reply-to 
0010-Documentation-Add-device-tree-bindings-for-TI-LMU-de.patch

I'm so embarrassed..

Thanks for your advice.

Best regards,
Milo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
