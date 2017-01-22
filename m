From: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] arm: dts: mt2701: add nor flash node
Date: Sun, 22 Jan 2017 10:36:40 +0800
Message-ID: <1485052600.19995.10.camel@mhfsdcap03>
References: <d7b866ad-5b2f-62d3-3aa3-6fa42803d625@gmail.com>
         <b850b751-1d8d-0053-cf1f-d5314542e5c3@gmail.com>
         <20170113172825.75d545a3@bbrezillon>
         <86c997be-f500-eaa1-3ba5-d21cff6223b7@gmail.com>
         <20170113175628.1793f433@bbrezillon>
         <0fafcd8d-cf99-de6b-728f-5e3637810b68@gmail.com>
         <20170114092958.022f2fc8@bbrezillon>
         <e7fa1542-f0e2-0e45-23b3-25d6491ae40d@gmail.com>
         <20170116094032.6f471f11@bbrezillon>
         <20170117143650.5db87148@free-electrons.com>
         <20170118222010.ivc6jxpnrumemvdf@rob-hp-laptop>
         <20170119103829.524ce715@free-electrons.com>
         <CAL_Jsq+EyHtC7THLCJcwgtVtVESMOdmi3T3bBxgOqJt6BCtCHQ@mail.gmail.com>
         <20170119091428.598eb987@bbrezillon>
         <CAL_Jsq+S-FYy4SmjJ3fWzBugw2zCj5TQkkfUA8QVL7SLJW3E1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+S-FYy4SmjJ3fWzBugw2zCj5TQkkfUA8QVL7SLJW3E1g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,
On Thu, 2017-01-19 at 08:18 -0600, Rob Herring wrote:
> On Thu, Jan 19, 2017 at 2:14 AM, Boris Brezillon
> > One last question and I'm done: is something like that acceptable?
> >
> >         compatible = "<vendor>,<old-soc>","<vendor>,<new-soc>";
> >
> > This can happen when someone adds support for an unsupported feature
> > on a brand new SoC, and then someone else use the same driver for an
> > older SoC embedding the same IP but still wants to add a new compatible
> > just in case these 2 IPs appear to be slightly different.
> 
> Yes, it's old and new compatible strings in this case and it's newest
> compatible string first.
> 
> > Here the order of compat strings is no longer following a clear rule
> > like 'most-specific compatible first' or 'newest IP/SoC version first',
> > it's completely dependent on the order these IPs were supported in the
> > OS (Linux). I'm perfectly fine with that BTW, just want to make sure
> > this is authorized.
> 
> I guess we should say "newest compatible for IP first" instead. There
> are some exceptions where we add fallbacks later on, but that falls
> under the most-specific part.
> 
> It's order that the bindings are defined, not Linux support really,
> but in practice those are the same.
> 
> Rob

Thanks for all your effort for code reviewing.
Our mt2701-nor's hardware is designed base on mt8713-nor,
even so, there would be some slight difference.
If I don't misunderstand your viewpoint in this discussion,
there's no need to drop mt2701-nor compatible.
And if not, is there any other suggestion?

Thanks.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
