From: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 1/4] drm/fsl-dcu: Cleanup vblank interrupt mask and status
 setting code
Date: Fri, 29 Jan 2016 02:42:40 +0000
Message-ID: <HE1PR04MB1051A3F5342DFB0CB61E5D8CECDB0@HE1PR04MB1051.eurprd04.prod.outlook.com>
References: <1453780833-32289-1-git-send-email-meng.yi@nxp.com>
 <8f5d609d18ec4d97beaf73bfdedb25d6@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8f5d609d18ec4d97beaf73bfdedb25d6-XLVq0VzYD2Y@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Stefan
I had tested your patch(https://lkml.org/lkml/2015/11/18/951) in ls1021-twr board, I think you can merge this patch to your tree if Jianwei don't have any objections.

> On  Tuesday, January 26, 2016 1:45 PM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
> 
> As I wrote earlier
> (http://www.spinics.net/lists/dri-devel/msg95703.html), my fixes patchset
> contains a similar patch which also explicitly disable the VBLANK interrupt. I
> think it is the better solution... See:
> https://lkml.org/lkml/2015/11/18/951
> 
> I will soon prepare a git tree and plan to submit that for 4.6, currently I plan to
> include
> - Your "Fix no fb check bug" patch
> - My "fixes and enhancements" patchset
> - My "fix register initialization" and "use flat regmap cache" patch
> 
> Let me know if you have any objections.
> 
> --
> Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
