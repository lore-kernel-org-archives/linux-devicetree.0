Return-Path: <SRS0=80p5=PR=atomide.com=tony@kernel.org>
Date: Wed, 9 Jan 2019 09:01:19 -0800
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: omap3-gta04: Fix graph_port warning
Message-ID: <20190109170119.GR5544@atomide.com>
References: <20190107160512.9480-1-tony@atomide.com>
 <ED6668F3-73A7-49A1-A7C7-E54381841222@goldelico.com>
 <CAL_Jsq+RQMjeH+YTphrXBQRdpUse1rSvPGdJiqcoRQWMPT+-ZQ@mail.gmail.com>
 <20190107183419.GG5544@atomide.com>
 <DE542A85-9B46-4AA4-B4E8-8880D23355EC@goldelico.com>
 <46dce758-2339-c4ef-891b-5cf4522fb7df@ti.com>
 <20190108155606.GM5544@atomide.com>
 <4F877B6F-2AED-4891-9676-5AB69B01C1AD@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F877B6F-2AED-4891-9676-5AB69B01C1AD@goldelico.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Rob Herring <robh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

* H. Nikolaus Schaller <hns@goldelico.com> [190109 16:47]:
> Ho Tony, Tomi,
> 
> > Am 08.01.2019 um 16:56 schrieb Tony Lindgren <tony@atomide.com>:
> > 
> > * Tomi Valkeinen <tomi.valkeinen@ti.com> [190108 07:57]:
> >> On 07/01/19 21:34, H. Nikolaus Schaller wrote:
> >> 
> >>>>> If there's only one port, then it is redundant and you should drop reg
> >>>>> instead.
> >>> 
> >>> If I remember correctly it was required by older omapdrm code (which
> >>> did scan for a reg property) but that may have changed. Therefore I've
> >>> added Tomi to this discussion.
> >> 
> >> I don't think so. The code looks for 'reg', but if it's not there, then
> >> it's considered 0.
> > 
> > FYI, the binding doc for the graph bindings is at
> > Documentation/devicetree/bindings/graph.txt if there is
> > any questions on how things should work.
> 
> I interpret it that "port@number" is only needed if there are
> multiple ports and there should not be any "@" or "reg" for the
> single port case. Although it seems not to be explicitly
> forbidden.
> 
> The &dss port doesn't have it either.
> 
> So let's remove the reg = <0>;
> 
> It also seems that
> 
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 
> is not required in this case and can also be removed.
> 
> I've tested and it works with v5.0-rc1.
> 
> There is an edited patch [1] but IMHO you as the original
> author should post it.

Looks good to me. But since you already modified it, all
you need to do is add your Signed-off-by after mine and
mail it out :) That is if you want to keep me as the
original author I guess for the description.

Otherwise we have to go through one more round of emails
where I post it you ack it and so on as I can't test it.

Regards,

Tony

> [1]: http://git.goldelico.com/?p=letux-kernel.git;a=commit;h=e46369390f62ce7176e91dfa443185e4b097ef4b
