From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] mtd:spi-nor: Add Altera EPCQ Driver
Date: Mon, 23 Feb 2015 19:59:56 -0800
Message-ID: <20150224035956.GE18140@ld-irv-0074>
References: <CAN1oZWykZk13yCajiZc-xb5h372MrEP9iOWUqzhrt-feG6pkLQ@mail.gmail.com>
 <CAN1oZWwHsm1i2Ap6LJwd5u=1ySokzA6DZCFAqK6wkPCz_P3XMA@mail.gmail.com>
 <CAN1oZWyM8HVuXuCyVankDvZb7JGOg5ysuTz7YwTOGHL89vY9dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAN1oZWyM8HVuXuCyVankDvZb7JGOg5ysuTz7YwTOGHL89vY9dg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viet Nga Dao <vndao@altera.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nga_chi86 <ngachi86@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 23, 2015 at 09:30:09AM +0800, Viet Nga Dao wrote:
> Hi,
> It has been nearly 2 weeks since i submitted this patch.  Could you
> please help to review?

Those two weeks were during the merge window, so I wasn't queueing
anything up. And there are things that have waited longer, anyway. My
time is unfortunately finite.

I'll get to your patch eventually.

> On Tue, Feb 17, 2015 at 9:33 AM, Viet Nga Dao <vndao@altera.com> wrote:
> > Hi Brian,
> > Could you please help me to review through this 2nd version?
> >
> > On Wed, Feb 11, 2015 at 12:53 PM, Viet Nga Dao <vndao@altera.com> wrote:
> >> From: Viet Nga Dao <vndao@altera.com>
> >>
> >> Altera EPCQ Controller is a soft IP which enables access to Altera EPCQ and
> >> EPCS flash chips. This patch adds driver for these devices.
> >>
> >> Signed-off-by: VIET NGA DAO <vndao@altera.com>
> >>
> >> ---
> >> v2:
> >> - Change to spi_nor structure
> >> - Add lock and unlock functions for spi_nor
> >> - Simplify the altera_epcq_lock function
> >> - Replace reg by compatible in device tree
...

Brian
