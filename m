From: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2] arm64: allwinner: h5: add support for NanoPi NEO Plus
 2
Date: Tue, 29 Aug 2017 23:51:12 +0200
Message-ID: <20170829215112.4p34hryd7kmhhr6w@AntonyAntony.local>
References: <20170824231716.2623-1-antony@phenome.org>
 <20170825103242.5665-1-antony@phenome.org>
 <CAEKpxBkUKGUQR2Vh1+Ci4wbB-+x48nRjLmWME2EUECCHuuwsmQ@mail.gmail.com>
 <20170828121644.p7mknytubsajzctg@AntonyAntony.local>
 <BF2F26DC-7014-4AF6-9C02-D1038A0FDA38@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BF2F26DC-7014-4AF6-9C02-D1038A0FDA38-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Mon, Aug 28, 2017 at 08:18:58PM +0800, Icenowy Zheng wrote:
> 
> 
> 于 2017年8月28日 GMT+08:00 下午8:16:44, Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org> 写到:
> >On Fri, Aug 25, 2017 at 03:28:41PM +0200, Code Kipper wrote:
> >> On 25 August 2017 at 12:32, Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org> wrote:
> >
> >> > +
> >> > +       brcmf: bcrmf@1 {
> >> > +               reg = <1>;
> >> > +               compatible = "brcm,bcm4329-fmac";
> >> > +       };
> >> Incorrect wifi chip - just deliver what you've tested.
> 
> Nope, this compatible is required by the dt binding, see the
> binding document or other DTs with brcmfmac SDIO.

Icenowy,

Thanks for pointing out brcm,bcm43430-fmac is missing in Documenation.
I just send a patch to wireless brcmfmac maintainers. 

https://patchwork.kernel.org/patch/9928387/

Would this work?

> Please complain to brcmfmac maintainers.

Lets see how it shakes out. 

regards,
-antony
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
