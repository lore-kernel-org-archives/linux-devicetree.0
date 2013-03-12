From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v2 1/2] leds: Add support for Palmas LEDs
Date: Tue, 12 Mar 2013 14:15:44 -0700
Message-ID: <CAK5ve-LLx2fZb_HaermFd2QXtxv-6vjz8=h1o0jpgbMe+G1yxQ@mail.gmail.com>
References: <1362064909-634-1-git-send-email-ian@slimlogic.co.uk>
 <CAK5ve-+-=R-f1KpEWD=4J3ia+QXmgnGvhDMV9tNf2_3WZupZaA@mail.gmail.com> <20130312191029.GC19942@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130312191029.GC19942@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Ian Lartey <ian@slimlogic.co.uk>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, ldewangan@nvidia.com, j-keerthy@ti.com, gg@slimlogic.co.uk, rpurdie@rpsys.net, grant.likely@secretlab.ca, rob.herring@calxeda.com, sameo@linux.intel.com
List-Id: devicetree@vger.kernel.org

On Tue, Mar 12, 2013 at 12:10 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Tue, Mar 12, 2013 at 11:57:50AM -0700, Bryan Wu wrote:
>> On Thu, Feb 28, 2013 at 7:21 AM, Ian Lartey <ian@slimlogic.co.uk> wrote:
>
>> > +       spinlock_t value_lock;
>
>> I think you don't need this spinlock to protect the value, the mutex is enough.
>
> You need to use a spinlock because values can be set from hard IRQ
> context so you can't take a mutex there.  Someone should really factor
> this out into the framework in their copious free time, the set and
> schedule pattern is very common in drivers.

Ah, exactly. I think I provided a patch before to add those schedule
workqueue stuff into the leds frameworks. But don't have time to
update it according to the review.

Thanks,
-Bryan
