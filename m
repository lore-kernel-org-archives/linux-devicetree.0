From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Status variable
Date: Fri, 29 Jan 2016 10:30:29 +0100
Message-ID: <3311135.1LkUsk5lnJ@wuerfel>
References: <CANMsd02jhaouPBuySWXQ2edE+gyMZ3dncobipKa-dg1vLJCE2Q@mail.gmail.com> <3706345.JqhHqFGYfF@wuerfel> <CANMsd01ty4H3mP0-6kyc0ZxMBAd7p2Y6o7dHy4sFSGhog22R2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANMsd01ty4H3mP0-6kyc0ZxMBAd7p2Y6o7dHy4sFSGhog22R2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryan <ryanphilips19-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 29 January 2016 14:53:02 Ryan wrote:
> Hello Bergman,
> 
> Sorry to bother you again: I was going through this:
> 
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/of/base.c#n524
> 
> Status should be absent or okay and "ok". Otherwise the entry is
> treated as disabled.
> 
> Is this understanding correct?
> 

Ah, you are right, sorry about my mistake. Please only use "disabled"
and "okay" though if you have a status property.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
