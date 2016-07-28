From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 14/18] ARM: mvebu: add support for the Armada 395 SoC family
Date: Thu, 28 Jul 2016 13:19:31 +0200
Message-ID: <87y44mj9h8.fsf@free-electrons.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
	<1469105055-25181-16-git-send-email-jaz@semihalf.com>
	<20160721221605.GA21883@rob-hp-laptop>
	<CAH76GKOidxFZ7R1pQZ2W9BRBCxEnLXNHQGrXbAUmouozBUj51Q@mail.gmail.com>
	<CAL_JsqJeObuS8OWeErRA5MX-SrMtu_254A-LtP9-A=xdPO7p1Q@mail.gmail.com>
	<20160725155050.3aee974e@free-electrons.com>
	<CAL_JsqL=bkzhjOTcOCeGNvKsAfYg0D=CypZs4sCsQ01pnbitoQ@mail.gmail.com>
	<20160725202209.5fae4d98@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160725202209.5fae4d98-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> (Thomas Petazzoni's
	message of "Mon, 25 Jul 2016 20:22:09 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,
 
 On lun., juil. 25 2016, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hello,
>
> On Mon, 25 Jul 2016 10:12:43 -0500, Rob Herring wrote:
>
>> Yes, I get that, but that is only meaningful if you want to run an OS
>> that is only aware of 395 on a 398 SoC/board (though I'd guess the 390
>> compat is enough for that). Otherwise, that property is not really
>> meaningful as the additional nodes are enough to handle what is the
>> superset.
>> 
>> I would agree both are fine if both chips are in fact the same die,
>> just fused or packaged differently. I've seen a lot of chips that are
>> supposed to be sub/supersets of each other, but have different errata
>> lists because they are different die.
>
> Unfortunately HW vendors are rarely willing to publicly indicate whether
> the different chips in their families are actually the same die fused
> differently, or really different dies.

So do you want that we keep both "marvell,armada398" and
"marvell,armada395" or do you xant we use only "marvell,armada398" ?

Thanks,

Gregory


>
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
