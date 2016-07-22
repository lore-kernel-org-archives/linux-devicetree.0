From: Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 14/18] ARM: mvebu: add support for the Armada 395 SoC family
Date: Fri, 22 Jul 2016 11:10:46 +0200
Message-ID: <CAH76GKOidxFZ7R1pQZ2W9BRBCxEnLXNHQGrXbAUmouozBUj51Q@mail.gmail.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
 <1469105055-25181-16-git-send-email-jaz@semihalf.com> <20160721221605.GA21883@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160721221605.GA21883@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

2016-07-22 0:16 GMT+02:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On Thu, Jul 21, 2016 at 02:44:11PM +0200, Grzegorz Jaszczyk wrote:
>> -compatible = "marvell,a398-db", "marvell,armada398", "marvell,armada390";
>> +compatible = "marvell,a398-db", "marvell,armada398", "marvell,armada395", "marvell,armada390";
>
> If 395 came after 398, then it should come first in the order. This
> implies that marvell,armada398 is a better match than marvell,armada395.
> Or perhaps you shouldn't have both?
>
> Rob

I am not sure if I get your point. The Armada-398 extends the
Armada-395 about 2 additional SATA ports (as you can see in commit
"[PATCH 15/18] ARM: mvebu: a398: update the dtsi about missing
interfaces"). In this example the a398-db board contains the Armada398
SoC, so it is a better match and goes first.

Quite the same is for existing armada-388-db.dts, in which compatible
looks like this:
compatible = "marvell,a385-db", "marvell,armada388",
"marvell,armada385", "marvell,armada380";

In above, Armada-388 also extends the Armada-385 and the order of the
compatible is similar to one from my example.

Thank you,
Grzegorz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
