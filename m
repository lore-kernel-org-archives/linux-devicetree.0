From: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 6/6] pinctrl: mt8173: set GPIO16 to usb iddig mode
Date: Wed, 11 May 2016 19:09:02 -0700
Message-ID: <1463018942.1608.5.camel@mussux00>
References: <1462868614-20602-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1462868614-20602-7-git-send-email-chunfeng.yun@mediatek.com>
	 <CACRpkdaeD5mk7LXEWnE0=Xute8-JA-fa4tVt4fYhujEXeq2+9w@mail.gmail.com>
	 <1462991546.11623.3.camel@mussux00> <1463017282.11651.82.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463017282.11651.82.camel@mhfsdcap03>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maoguang Meng <maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XcXa4x6EXUF0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2016-05-12 at 09:41 +0800, chunfeng yun wrote:
> Hi,
> 
> On Wed, 2016-05-11 at 11:32 -0700, Hongzhou Yang wrote:
> > On Wed, 2016-05-11 at 13:56 +0200, Linus Walleij wrote:
> > > On Tue, May 10, 2016 at 10:23 AM, Chunfeng Yun
> > > <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > > 
> > > > the default mode of GPIO16 pin is gpio, when set EINT16 to
> > > > IRQ_TYPE_LEVEL_HIGH, no interrupt is triggered, it can be
> > > > fixed when set its default mode as usb iddig.
> > > >
> > > > Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > 
> > 
> > Chunfeng, GPIO16 can be used as EINT16 mode, but the pinmux should be 0.
> > If you want to set its default mode to iddig, you should set it in dts.
> > 
> I set it in DTS, but it didn't work, because when usb driver requested
> IRQ, pinmux was switched back to default mode set by
> MTK_EINT_FUNCTION().
> 

After confirmed, there are something wrong with data sheet and pinmux
table, and GPIO16 can only receive interrupt by mode 1. So

Acked-by: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Yours,
Hongzhou


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
