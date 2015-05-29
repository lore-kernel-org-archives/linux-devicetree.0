From: David Lang <david-gFPdbfVZQbY@public.gmane.org>
Subject: Re: Device Tree Blob (DTB) licence
Date: Fri, 29 May 2015 15:16:42 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1505291512000.4429@nftneq.ynat.uz>
References: <1430820315.19516.26.camel@opteya.com> <CAL_Jsq+T5c7qornpRVCduEjUSCeM+0xqbtVYovtH76y=4BqhLQ@mail.gmail.com> <1432289148.5304.58.camel@opteya.com> <1432322832.5304.63.camel@opteya.com> <CAOS_Y6Q37ps+VEnzUZ_uwX++qrRm9Hgx45Q_pmiZSLSNjmKwZg@mail.gmail.com>
 <55670AD4.8020705@melag.de> <20150528133429.GD2067@n2100.arm.linux.org.uk> <556747E4.6070403@melag.de> <20150529064741.GB25351@1wt.eu> <55684F07.7050402@melag.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55684F07.7050402-d/C+FbuhHiA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Enrico Weigelt, metux IT consult" <weigelt-d/C+FbuhHiA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Yann Droneaud <ydroneaud-RlY5vtjFyJ3QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 29 May 2015, Enrico Weigelt, metux IT consult wrote:

>>> And why should they fear "poisoning" ?
>> 
>> Search for "GPL contamination", the problem is quite common, GPL
>> can turn anything GPL-compatible into GPL. So for a non-GPL project
>> it's very hard to adopt GPL code.
>
> Yes, that's the whole purpose of the GPL. The deal is pretty simple:
> if you take some GPL'ed software and change it, you'll have to publish
> your changes under the same rules. For entirely separate entities
> (eg. dedicated programs) that's not an big issue. And for libraries,
> we have LGPL.
>
> If the DTS license would be a problem, it would be worse w/ ACPI
> and any proprietary firmware/BIOSes.

not true, with a proprietary bios it's a clear "pay this much money and don't 
worry about it" while with GPL there's a nagging fear that someone you never 
heard of may sue you a decade from now claiming you need to give them the source 
to your OS.

Is having the DTB GPL so impartant that you would rather let things fall into 
the windows trap ("well it booted windows, so it must be right") instead of 
allowing a proprietary OS to use your description of the hardware?

note, this whole discussion assumes that the DTB is even copyrightable. Since 
it's intended to be strictly a functional description of what the hardware is 
able to do, that could be questioned

David Lang
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
