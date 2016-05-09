From: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Subject: Re: [PATCHv4] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Mon, 9 May 2016 11:53:16 +0200
Message-ID: <57305E0C.8040304@schinagl.nl>
References: <1462439332-26215-1-git-send-email-oliver@schinagl.nl>
 <20160508180941.GC6167@lukather>
Reply-To: oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDC2JNWXZAJBBF54YG4QKGQEUXWG3YY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160508180941.GC6167@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Tsvetan Usunov <tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, info-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hey Maxime,

On 08-05-16 20:09, Maxime Ripard wrote:
> On Thu, May 05, 2016 at 11:08:52AM +0200, Olliver Schinagl wrote:
>> There are 3 kinds of OLinuXino Lime2 boards.
>> One without any on board storage, one with NAND storage and one with
>> eMMC storage. This patch adds the eMMC variant of boards.
>>
>> eMMC storage is different from a regular SD card in that it is soldered
>> on the board and cannot be changed. Additionally, it shares pins with
>> the NAND module and with the second SPI port.
>>
>> Changeslog:
>>
>> v4:
>>    Add board compatibles
>>
>> v3:
>>    Add pwr-seq-emmc with the reset gpio
>>
>> v2:
>>    Remove unsupported no-1.8-v property, add vqmmc property
>>
>> v1:
>>    Initial bare bone version
> This is not something we want in the commit log. This should go below
> the --- so that it's dropped when applied.
Sorry about that, I didn't know the --- trick. ChenYu reminded of it 
however, so that'll go into my toolblox.
>
> Removed and applied.
Thanks for fixing it, much appreciated :)
>
> Thanks,
> Maxime
>
