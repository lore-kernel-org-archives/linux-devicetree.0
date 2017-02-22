From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 7/8] arm64: dts: mt8173: move clock from phy node
 into port nodes
Date: Wed, 22 Feb 2017 18:48:09 +0800
Message-ID: <1487760489.7255.5.camel@mhfsdcap03>
References: <1487753705-6745-1-git-send-email-chunfeng.yun@mediatek.com>
         <1487753705-6745-7-git-send-email-chunfeng.yun@mediatek.com>
         <d2abde73-91b0-36c3-8b32-d50a9800bd52@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d2abde73-91b0-36c3-8b32-d50a9800bd52-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,
On Wed, 2017-02-22 at 12:36 +0300, Sergei Shtylyov wrote:
> On 2/22/2017 11:55 AM, Chunfeng Yun wrote:
> 
> > there is a reference clock for each port, HighSpeed port is 48M,
> > and SuperSpeed port is 26M which usually comes from 26M oscillator
> > directly, but some SoCs is not. it is flexible to move it into port
> 
>     ... but on some SoCs does not?
I mean the reference clock of SuperSpeed port comes from PLL and need be
controlled by driver on some SoCs. When it comes from oscillator
directly, it is optional and is ok whether the driver controll it or not
> 
> > node.
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> [...]
> 
> MBR, Sergei
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
