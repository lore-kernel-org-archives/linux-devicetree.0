From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: mmp: support DT in irq
Date: Fri, 4 May 2012 12:56:30 +0000
Message-ID: <201205041256.30409.arnd@arndb.de>
References: <1335515957-1798-1-git-send-email-haojian.zhuang@gmail.com>
 <201205021251.16967.arnd@arndb.de>
 <CAN1soZwE7MoifmxtPS8f_x6CrK-dF97=vPMTMStg=VW1wsoLrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAN1soZwE7MoifmxtPS8f_x6CrK-dF97=vPMTMStg=VW1wsoLrA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 04 May 2012, Haojian Zhuang wrote:
> On Wed, May 2, 2012 at 8:51 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Wednesday 02 May 2012, Haojian Zhuang wrote:
> >> I use two CONFIG_OF in this file. The first one is used to record
> >> register base address
> >> of interrupt controller. In legacy code, the register address is
> >> hardcoding. Do you mean
> >> that I should remove this CONFIG_OF?
> >
> > Unless it's a noticeable performance impact, I would recommend just
> > always using the mmp_icu_base variable, even for when CONFIG_OF is
> > disabled.
> 
> But I appended new irq handler for DT support. I still need to reserve
> this CONFIG_OF
> since I need to keep compatible with legacy code.

You don't need to worry about out-of-tree code, it can adapt. For the
non-DT version, why can't you move the 'mmp_icu_base' variable into
common.c and just initialize it to ICU_VIRT_BASE?
If you do that, any combination of DT- and non-DT board files should
work with the same entry-macro.S code.

Another alternative would be to convert MMP over to
CONFIG_MULTI_IRQ_HANDLER and use different handle_irq functions.

	Arnd
