From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] Documentation: dt-bindings: add dt binding info
 for rk3288-smp
Date: Wed, 17 Sep 2014 20:50:22 +0100
Message-ID: <20140917195022.GF7983@leverpostej>
References: <1410864271-9277-1-git-send-email-kever.yang@rock-chips.com>
 <1410864271-9277-2-git-send-email-kever.yang@rock-chips.com>
 <20140916185439.GF14191@leverpostej>
 <5418DFFC.5030808@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5418DFFC.5030808-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "hj-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <hj-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree@vger.k>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 17, 2014 at 02:12:28AM +0100, Kever Yang wrote:
> Hi Mark,
> 
>      Thanks for your comment.
> On 09/17/2014 02:54 AM, Mark Rutland wrote:
> > On Tue, Sep 16, 2014 at 11:44:28AM +0100, Kever Yang wrote:
> >> This add documentation for rk3288 smp dt binding
> >>
> >> Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> ---
> >>
> >> Changes in v2:
> >> - add documentation
> >>
> >>   Documentation/devicetree/bindings/arm/cpus.txt | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> >> index 298e2f6..4b46233 100644
> >> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> >> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> >> @@ -195,6 +195,7 @@ nodes to be present and contain the properties described below.
> >>   			    "qcom,kpss-acc-v1"
> >>   			    "qcom,kpss-acc-v2"
> >>   			    "rockchip,rk3066-smp"
> >> +			    "rockchip,rk3288-smp"
> > How do these differ?
> rk3066 and rk3288 smp bring up code is quite different, so I need a new 
> node "rockchip,rk3288-smp"
> other than "rockchip,rk3066-smp".

The code being different is a Linux detail. What is different in the HW
that necessitates the code being different?

> > What does "rockchip,rk3288-smp" mean exactly?
> The driver who using this node is in 2/3 of this patchset, it goes to 
> linux-arm-kernel list and linux-rockchip
> list, I'm not sure if you have get that, maybe I need a RESEND?

Documentaiton and drivers are different things. A binding is a contract,
and for that contract to be meaningful it needs to be described.

> > Presumably other nodes / properties are required?
> Base on linux-next, I think only "rockchip,rk3288-smp" is new node to my 
> driver.

But presumably there are other resources that you require (e.g. a system
controller, perhaps a specific portion of sram). I can't just put
"rockchip,rk3288-smp" into an otherwise empty DT and get SMP support, I
would assume.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
