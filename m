From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH 0/3] Using SPI NOR flah on sunxi.
Date: Mon, 4 May 2015 12:32:51 +0200
Message-ID: <CAOMqctT42f0RuShMb5BU_4Qun-qouS3HCj7_=8-oEY9h-zVimg@mail.gmail.com>
References: <cover.1430403750.git.hramrach@gmail.com> <jwv4mnwfppf.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <jwv4mnwfppf.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi-mXXj517/zsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On 1 May 2015 at 14:27, Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org> wrote:
>> The SPI driver returns an error when more than 64 bytes are
>> transferred at once due to lack of DMA support.
>
> Have you tried the dmaengine patch and make the SPI driver use it?
>

The dmaengine is already merged or queued in sunxi-wip but the SPI
glue fell through the cracks. I found it after digging through the
archives so I will see if it works for me.

Thanks

Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
