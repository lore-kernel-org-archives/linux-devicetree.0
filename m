From: Timur Tabi <timur-N01EOCouUvQ@public.gmane.org>
Subject: Re: ARM, SoC: About the use DT-defined properties by 3rd-party
 drivers
Date: Tue, 13 Sep 2016 06:37:16 -0500
Message-ID: <57D7E4EC.6050509@tabi.org>
References: <57BDAF2E.10502@laposte.net>
 <CAOZdJXVjsR3NTWiJX33yT3jYk=FU65raWoMooTLD7OMN3sqP-A@mail.gmail.com>
 <57D69FB1.2020801@laposte.net> <20160912123809.GB13741@leverpostej>
 <57D6AA54.6000208@laposte.net> <20160912135549.GA14165@leverpostej>
 <57D6D2A9.3010006@laposte.net> <20160912165637.GF14165@leverpostej>
 <57D7CF17.2050905@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57D7CF17.2050905-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Frias <sf84-QFKgK+z4sOrR7s880joybQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mason <slash.tmp-GANU6spQydw@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Sebastian Frias wrote:
> Let's make an abstraction of the word 'binding', 'create a binding', etc. and
> just focus on this:
> - Somebody submits a DT file that contains properties and nodes that are
> *not used*  by any Linux driver.
> - Said properties and nodes serve as HW description for HW blocks for which
> *there is no*  Linux driver.
>
> The goal of the above is to use the DT as the authoritative (and single)
> source of HW definition.

No.

I've grown weary of this discussion.  We have explained multiple times 
why this is impractical.  Using the DT to document hardware makes no 
sense.  No one is going to do that, and anyone who attempts to submit a 
DT binding without an actual driver will get rejected.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
