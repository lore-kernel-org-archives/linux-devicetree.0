From: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Tue, 3 May 2016 17:52:09 +0200
Message-ID: <5728C929.3040709@schinagl.nl>
References: <1461827998-12192-1-git-send-email-oliver@schinagl.nl>
 <f3da30a6-9ac0-4d5e-8611-ebb80cb3589e@googlegroups.com>
 <20160503131437.GV17159@lukather>
 <66e4c452-1e34-474b-8973-2d57d9f036d0@googlegroups.com>
Reply-To: oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDC2JNWXZAJBBL4SUO4QKGQEKEZOX6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <66e4c452-1e34-474b-8973-2d57d9f036d0-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hey all,

On 03-05-16 17:02, christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> On Tuesday, May 3, 2016 at 4:14:41 PM UTC+3, Maxime Ripard wrote:
>> Hi,
>>
>> On Tue, May 03, 2016 at 4:12:06 PM UTC+3, Christo Radev wrote:
>>> Hi to All,
>>>
>>> I have already solved and tested this issue on Armbian build.  Find
>>> patches for both legacy (3.4.111) and mainline (4.5.2) kernels on:
>>> http://forum.armbian.com/index.php/topic/853-armbian-customization/page-2#entry7494
>>> There it is also described how to do eMMC bootable and much more.
>>>
>>> About the board - Olimex already sold all 3 kinds after migration to
>>> their HW rev. E. One have to specify Lime2-eMMC as
>>> A20-Olinuxino-Lime2-eMMC instead of their old 2 options
>>> A20-Olinuxino-Lime2(-4GB).
>> Interesting, you have a link to that device?
>>
>> Thanks,
>> Maxime
>>
>> -- 
>> Maxime Ripard, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
> I have really 2 boards delivered by their local distributor.
>
> Unfortunately, they do not update their site. Use the link for NAND option:
> https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXIno-LIME2-4GB/open-source-hardware
> There you can find Users Manual where it is described that eMMC option is available from HW rev. D. The schematic for HW rev. E is also available on their repository:
> https://github.com/OLIMEX/OLINUXINO/tree/master/HARDWARE/A20-OLinuXino-LIME2
>
> On the board both 4GB NAND and eMMC Flash chips can be placed alternatively on the same place. There is difference in some other components as well.
>
> If one want to order it from the site probably has to order A20-Olinuxino-Lime2-4GB with note that eMMC option is required. The price is the same.
Sorry for the late reply, but yeah the board exists, we asked Olimex to 
develop the eMMC variant for us. I currently have a dozen or so on my 
desk :)

I don't know when Olimex will update their webshop with the new designs, 
but they simply might not have enough eMMC chips available yet?
