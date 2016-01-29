From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC 3/3] CMDQ: Mediatek CMDQ driver
Date: Fri, 29 Jan 2016 21:15:32 +0800
Message-ID: <CAGS+omBhs7Ks7MVDsxHBBUdgF+0fmAa465HwvNiCzEe97Knt3Q@mail.gmail.com>
References: <1453266881-16849-1-git-send-email-hs.liao@mediatek.com>
 <1453266881-16849-4-git-send-email-hs.liao@mediatek.com>
 <CAGS+omBjD1pXKY_6bFbiGxa5bttvqg5zEvKevzSfoiMOy7ys6Q@mail.gmail.com>
 <1454053150.32413.52.camel@mtksdaap41>
 <CAGS+omBrEE21Xxh8hjcf32qfHJE0jJYvxGP6L1ihS6jcNbLvLQ@mail.gmail.com>
 <1454070262.7401.21.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1454070262.7401.21.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Glory Hung <glory.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Josh-YC Liu <josh-yc.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWMP3drIcvDWNA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 29, 2016 at 8:24 PM, Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> On Fri, 2016-01-29 at 16:42 +0800, Daniel Kurtz wrote:
>> On Fri, Jan 29, 2016 at 3:39 PM, Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>> > Hi Dan,
>> >
>> > Many thanks for your comments and time.
>> > I reply my plan inline.
>> >
>> >
>> > On Thu, 2016-01-28 at 12:49 +0800, Daniel Kurtz wrote:
>> >> Hi HS,
>> >>
>> >> Sorry for the delay.  It is hard to find time to review a >3700 line
>> >> driver :-o in detail....
>> >>
>> >> Some review comments inline, although I still do not completely
>> >> understand how all that this driver does and how it works.
>> >> I'll try to find time to go through this driver in detail again next
>> >> time you post it for review.
>> >>
>> >> On Tue, Jan 19, 2016 at 9:14 PM,  <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>> >> > From: HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> >> >
>> >> > This patch is first version of Mediatek Command Queue(CMDQ) driver. The
>> >> > CMDQ is used to help read/write registers with critical time limitation,
>> >> > such as updating display configuration during the vblank. It controls
>> >> > Global Command Engine (GCE) hardware to achieve this requirement.
>> >> > Currently, CMDQ only supports display related hardwares, but we expect
>> >> > it can be extended to other hardwares for future requirements.
>> >> >
>> >> > Signed-off-by: HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> >>
>> >> [snip]
>> >>
>> >> > diff --git a/drivers/soc/mediatek/mtk-cmdq.c b/drivers/soc/mediatek/mtk-cmdq.c
>> >> > new file mode 100644
>> >> > index 0000000..7570f00
>> >> > --- /dev/null
>> >> > +++ b/drivers/soc/mediatek/mtk-cmdq.c
>
> [snip]
>
>> >> > +static const struct cmdq_subsys g_subsys[] = {
>> >> > +       {0x1400, 1, "MMSYS"},
>> >> > +       {0x1401, 2, "DISP"},
>> >> > +       {0x1402, 3, "DISP"},
>> >>
>> >> This isn't going to scale.  These addresses could be different on
>> >> different chips.
>> >> Instead of a static table like this, we probably need specify to the
>> >> connection between gce and other devices via devicetree phandles, and
>> >> then use the phandles to lookup the corresponding device address
>> >> range.
>> >
>> > I will define them in device tree.
>> > E.g.
>> > cmdq {
>> >   reg_domain = 0x14000000, 0x14010000, 0x14020000
>> > }
>>
>> The devicetree should only model hardware relationships, not software
>> considerations.
>>
>> Is the hardware constraint here for using gce with various other
>> hardware blocks?  I think we already model this by only providing a
>> gce phandle in the device tree nodes for those devices that can use
>> gce.
>>
>> Looking at the driver closer, as far as I can tell, the whole subsys
>> concept is a purely software abstraction, and only used to debug the
>> CMDQ_CODE_WRITE command.  In fact, AFAICT, everything would work fine
>> if we just completely removed the 'subsys' concept, and just passed
>> through the raw address provided by the driver.
>>
>> So, I recommend just removing 'subsys' completely from the driver -
>> from this array, and in the masks.
>>
>> Instead, if there is an error on the write command, just print the
>> address that fails.  There are other ways to deduce the subsystem from
>> a physical address.
>>
>> Thanks,
>>
>> -Dan
>
> Hi Dan,
>
> Subsys is not just for debug.
> Its main purpose is to transfer CPU address to GCE address.
> Let me explain it by "write" op,
> I list a code segment from cmdq_rec_append_command().
>
>         case CMDQ_CODE_WRITE:
>                 subsys = cmdq_subsys_from_phys_addr(cqctx, arg_a);
>                 if (subsys < 0) {
>                         dev_err(dev,
>                                 "unsupported memory base address 0x%08x\n",
>                                 arg_a);
>                         return -EFAULT;
>                 }
>
>                 *cmd_ptr++ = arg_b;
>                 *cmd_ptr++ = (CMDQ_CODE_WRITE << CMDQ_OP_CODE_SHIFT) |
>                              (arg_a & CMDQ_ARG_A_WRITE_MASK) |
>                              ((subsys & CMDQ_SUBSYS_MASK) << CMDQ_SUBSYS_SHIFT);
>                 break;
>
> Subsys is mapped from physical address via cmdq_subsys_from_phys_addr(),
> and then it becomes part of GCE command via ((subsys & CMDQ_SUBSYS_MASK)
> << CMDQ_SUBSYS_SHIFT) .
> Only low bits of physical address are the same as GCE address.
> We can get it by (arg_a & CMDQ_ARG_A_WRITE_MASK).
> MASK is used to define how many bits are valid for this op.
> So, GCE address = subsys + valid low bits.

How are these upper bits of the "GCE address" defined?
In other words, for a given SoC, how is the mapping between physical
io addresses to GCE addresses defined?
Is this mapping fixed by hardware?
Does it vary for different SoCs?

-Dan

> That's why we need to know the mapping between the range of physical
> address and subsys.
> Please guide us a better way to code such requirement.
> Thanks for your help.
>
> Thanks,
> HS Liao
>
