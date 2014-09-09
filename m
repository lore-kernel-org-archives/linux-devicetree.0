From: Jean-Michel Hautbois <jean-michel.hautbois-B+Q8N6RmIDZBDgjK7y7TUQ@public.gmane.org>
Subject: Re: PFUZE100 regulator not going off when PWRON is 0
Date: Tue, 9 Sep 2014 22:59:31 +0200
Message-ID: <CAL8zT=hf8T7P=7PJKK9_de2R8bHmm=O4ws3JbBqKBaTMR5DinA@mail.gmail.com>
References: <CAL8zT=hNnRU3gbprVXOMt6FC9veRvQKRmS9gSeCm5-DNfGv-xg@mail.gmail.com>
 <20140903125248.GK29327@sirena.org.uk> <20140909024100.GA19119@Robin-OptiPlex-780>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140909024100.GA19119@Robin-OptiPlex-780>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Gong <b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-09-09 4:41 GMT+02:00 Robin Gong <b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>:
> Thanks for Mark's forward.
>
> Hi Jean-Michel,
>   Yes, SWxOMODE can be set as 1 to active sleep mode if PWRON turn-off event
> occurs. And the voltage of sleep mode can be set in other register SWxOFF. But
> by default, SWxOMODE is 0 which means all SW will be turned off while PWRON go
> form 1 to 0. For your issue, I hope you check the hardware design, and measure
> PWRON pin to see whether it has been pulled low once your push reset key.

Thank you both, we found an electrical issue which made it not going down to 0V.
Regards,
JM
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
