From: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 6/6] pinctrl: mt8173: set GPIO16 to usb iddig mode
Date: Wed, 30 Nov 2016 16:43:50 -0800
Message-ID: <1480553030.29122.7.camel@mussux00>
References: <1462868614-20602-1-git-send-email-chunfeng.yun@mediatek.com>
 <1462868614-20602-7-git-send-email-chunfeng.yun@mediatek.com>
 <CACRpkdaeD5mk7LXEWnE0=Xute8-JA-fa4tVt4fYhujEXeq2+9w@mail.gmail.com>
 <1462991546.11623.3.camel@mussux00> <1463017282.11651.82.camel@mhfsdcap03>
 <1463018942.1608.5.camel@mussux00> <1463021701.25171.5.camel@mussux00>
 <42f5df18-2edd-08f2-a833-9c92ac85e87c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <42f5df18-2edd-08f2-a833-9c92ac85e87c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maoguang Meng <maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh>
List-Id: devicetree@vger.kernel.org

On Wed, 2016-11-23 at 19:32 +0100, Matthias Brugger wrote:
> Hi Hongzhou,
> 
> On 12/05/16 04:55, Hongzhou Yang wrote:
> > On Wed, 2016-05-11 at 19:09 -0700, Hongzhou Yang wrote:
> >> On Thu, 2016-05-12 at 09:41 +0800, chunfeng yun wrote:
> >>> Hi,
> >>>
> >>> On Wed, 2016-05-11 at 11:32 -0700, Hongzhou Yang wrote:
> >>>> On Wed, 2016-05-11 at 13:56 +0200, Linus Walleij wrote:
> >>>>> On Tue, May 10, 2016 at 10:23 AM, Chunfeng Yun
> >>>>> <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> >>>>>
> >>>>>> the default mode of GPIO16 pin is gpio, when set EINT16 to
> >>>>>> IRQ_TYPE_LEVEL_HIGH, no interrupt is triggered, it can be
> >>>>>> fixed when set its default mode as usb iddig.
> >>>>>>
> >>>>>> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >>>>>
> >>>>
> >>>> Chunfeng, GPIO16 can be used as EINT16 mode, but the pinmux should be 0.
> >>>> If you want to set its default mode to iddig, you should set it in dts.
> >>>>
> >>> I set it in DTS, but it didn't work, because when usb driver requested
> >>> IRQ, pinmux was switched back to default mode set by
> >>> MTK_EINT_FUNCTION().
> >>>
> >>
> >> After confirmed, there are something wrong with data sheet and pinmux
> >> table, and GPIO16 can only receive interrupt by mode 1. So
> >>
> >> Acked-by: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >>
> >
> > Linus,
> >
> > We find there are some other pins still have the same problem, so please
> > hold on it. Sorry for so much noise.
> >
> 
> Did you made any progress on this? I didn't see any patch on the mailing 
> list.
> 
> Regards,
> Matthias

Hi Matthias,

Sorry for the late reply.

I have double confirmed with HW designer, other special EINTs are
built-in and they are using internal signal, they are not triggered 
by GPIO, only GPIO16 should set to mode 1.

And, Chunfeng already re-sent this patch.

Thank you very much.

Yours,
Hongzhou
