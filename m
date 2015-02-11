From: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v3 4/5] usb: phy: load usb phy earlier
Date: Wed, 11 Feb 2015 01:36:58 +0000
Message-ID: <BN3PR0301MB08492D4F583C3C7ED250E0B781250@BN3PR0301MB0849.namprd03.prod.outlook.com>
References: <20150210070424.GC32709@shlinux2>
 <20150210144925.GD16711@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150210144925.GD16711-HgARHv6XitJaoMGHk7MhZQC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wangbinghui <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 
> On Tue, Feb 10, 2015 at 03:04:28PM +0800, Peter Chen wrote:
> > This patch does not belong to phy, so, doesn't need to add phy in
> > subject, meanwhile, please add GregKH as TO list, he is the right one
> > to queue this patch.
> >
> > Reply-To:
> > In-Reply-To: <1423554627-694-5-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >
> > On Tue, Feb 10, 2015 at 03:50:26PM +0800, Zhangfei Gao wrote:
> > > Since phy is definitely used in usb controller, load the phy earlier
> > > to make boot time shorter.
> > >
> > > Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > Acked-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> NAK, make sure there are no such dependencies with your controller driver.
> They should know how to defer probing if their resources aren't available yet.
> 

I NAKed it first.

But after thinking more, I think it is a good patch, USB PHY works proper
is the base for coming USB controller operation, with this patch,
it can avoid the controller drivers which are linked earlier than USB PHY
always being probed deferral, look at drivers/Makefile, it links drivers
follow the similar method.

Zhangfei, you may need to add more description in your commit log to prove
it is a good improvement.

Peter
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
