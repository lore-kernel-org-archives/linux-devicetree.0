From: Viet Nga Dao <vndao@altera.com>
Subject: Re: [PATCH v2] mtd:spi-nor: Add Altera EPCQ Driver
Date: Mon, 9 Mar 2015 09:42:37 +0800
Message-ID: <CAN1oZWzJFF+iQi5t2PsGQJ_3wOO3FBoyCiQ26qVwJQhWGcOT4g@mail.gmail.com>
References: <CAN1oZWykZk13yCajiZc-xb5h372MrEP9iOWUqzhrt-feG6pkLQ@mail.gmail.com>
	<CAN1oZWwHsm1i2Ap6LJwd5u=1ySokzA6DZCFAqK6wkPCz_P3XMA@mail.gmail.com>
	<CAN1oZWyM8HVuXuCyVankDvZb7JGOg5ysuTz7YwTOGHL89vY9dg@mail.gmail.com>
	<20150224035956.GE18140@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150224035956.GE18140@ld-irv-0074>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Viet Nga Dao <vndao@altera.com>, David Woodhouse <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, nga_chi86 <ngachi86@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Brian,
I understand that you are busy but is it possible if you could spend
some time to help me review my patch? My work progress really depends
on your review.
Thanks,
Viet Nga

On Tue, Feb 24, 2015 at 11:59 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Mon, Feb 23, 2015 at 09:30:09AM +0800, Viet Nga Dao wrote:
>> Hi,
>> It has been nearly 2 weeks since i submitted this patch.  Could you
>> please help to review?
>
> Those two weeks were during the merge window, so I wasn't queueing
> anything up. And there are things that have waited longer, anyway. My
> time is unfortunately finite.
>
> I'll get to your patch eventually.
>
>> On Tue, Feb 17, 2015 at 9:33 AM, Viet Nga Dao <vndao@altera.com> wrote:
>> > Hi Brian,
>> > Could you please help me to review through this 2nd version?
>> >
>> > On Wed, Feb 11, 2015 at 12:53 PM, Viet Nga Dao <vndao@altera.com> wrote:
>> >> From: Viet Nga Dao <vndao@altera.com>
>> >>
>> >> Altera EPCQ Controller is a soft IP which enables access to Altera EPCQ and
>> >> EPCS flash chips. This patch adds driver for these devices.
>> >>
>> >> Signed-off-by: VIET NGA DAO <vndao@altera.com>
>> >>
>> >> ---
>> >> v2:
>> >> - Change to spi_nor structure
>> >> - Add lock and unlock functions for spi_nor
>> >> - Simplify the altera_epcq_lock function
>> >> - Replace reg by compatible in device tree
> ...
>
> Brian
