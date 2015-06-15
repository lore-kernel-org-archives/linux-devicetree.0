From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 05/22] doc: dt-binding: usb: add otg related properties
Date: Mon, 15 Jun 2015 15:25:48 +0300
Message-ID: <557EC44C.4050306@cogentembedded.com>
References: <CAL_JsqJ+q5hs26FaLXG1LVb0asE-UZ5hXar2FeVAJN=S8=CG3w@mail.gmail.com> <20150610103737.3cc7c10d@rockdesk> <20150610134735.GB7678@shlinux2> <20150611101853.643a9334@rockdesk> <20150611082010.GA16101@shlinux2> <20150611153703.55dff608@rockdesk> <20150611141121.GC16101@shlinux2> <20150611175215.6e04d92e@rockdesk> <20150612030916.GF16101@shlinux2> <20150612113102.6aa67d5d@rockdesk> <20150615074100.GA29918@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150615074100.GA29918@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Li Jun-B47624 <Jun.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Chen Peter-B29397 <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 6/15/2015 10:41 AM, Li Jun wrote:

[...]

> Regarding use of "xyz-disable" flags:
> After more thinking this, I just realize that we can use "otg-rev" property
> to handle the case of none of xyz-disable properties passed, for legacy
> platforms, the new "otg-rev" not passed either, so it's a legacy platform,
> if new platform does support all 3 features(SRP/HNP/ADP), the otg-rev
> should be passed and also should be 2.0 or above, because ADP is
> introduced in OTG 2.0(maybe that's why in current gadget driver, only
> enable SRP/HNP).
>
> So:
> 1) new platform with full otg feature support:
> dr_mode = "otg";
> otg-rev = "0x0200";

    If you're going to use a string value for this prop, why not let it have a 
natural form, "2.0"?

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
