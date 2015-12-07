From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: mt8173: Add nor flash node
Date: Mon, 7 Dec 2015 16:19:53 +0800
Message-ID: <CAGS+omBycHuNaMy5vuEf0ZSRTniCS50qEdAY0=L1_1Wno4EBTQ@mail.gmail.com>
References: <1449460394-31601-1-git-send-email-bayi.cheng@mediatek.com>
 <CAGS+omCuB3VGcPk3fezakdVDnFB3GAmMD+wZ_6nGdv+uHoB40g@mail.gmail.com>
 <1449462852.9118.25.camel@mhfsdcap03> <1449463619.9118.31.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449463619.9118.31.camel@mhfsdcap03>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bayi cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Bayi,

On Mon, Dec 7, 2015 at 12:46 PM, bayi cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> On Mon, 2015-12-07 at 12:34 +0800, bayi cheng wrote:
>> On Mon, 2015-12-07 at 12:09 +0800, Daniel Kurtz wrote:
>> > Bayi,
>> >
>> > On Mon, Dec 7, 2015 at 11:53 AM, Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>> > > Add Mediatek nor flash node
>> > >
>> > > Signed-off-by: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> > > Acked-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > > ---
>> > > Previous version of this patch is
>> > > http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/386005.html
>> > > Drop flash node from mt8173.dtsi accroding review comment
>> >
>> > Is there a flash on mt8173-evb that can be accessed by the nor_flash ?
>> > If so, can you include flash@0 node in the mt8173-evb.dts.
>> >
>> > -Dan
>> >
>> Hi Daniel, Thanks for your comments! you are right, there is a flash on
>> mt8173-evb which can be accessed by the nor_flash, and I will include
>> flash@0 node in mt8173-evb.dts (kernel v3.18) too.
>>
>> Bayi
>
> Hi Dan, I have reworked a EVB board for spi nor verify, we replaced the
> spi nand flash with spi nor flash on EVB board,
> and our shipping EVB board haven't support spi nor flash, So I will not
> include flash@0 node in the mt8173-evb.dts. I am sorry to made you
> confused!

Thanks for confirming.

Reviewed-by: Daniel Kurtz <djkurtz@chromium. org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
