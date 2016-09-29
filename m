From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: rfkill guidance
Date: Thu, 29 Sep 2016 13:22:11 +0200
Message-ID: <1475148131.6673.10.camel@sipsolutions.net>
References: <324c35c6-49ca-174c-db07-674532f3e628@broadcom.com>
         <1474961105.5141.5.camel@sipsolutions.net>
         <0a8cff88-73aa-8311-7afe-98612161421f@broadcom.com>
         <1475044682.4139.18.camel@sipsolutions.net>
         <fc993a0d-25cc-fb1c-3d96-86b12d1140d2@broadcom.com>
         (sfid-20160928_225432_125394_86BA511B)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fc993a0d-25cc-fb1c-3d96-86b12d1140d2-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> (sfid-20160928_225432_125394_86BA511B)
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> This clarifies the issue, thanks. Basically the reason is history -
> this user space code has been around for a while. It turns out the
> HCI BT driver doesn't exist as it should. If it did, then the
> regulator could be tied to the driver. Now I see what's missing.

So like what Marcel wrote over in his email, but with regulator vs.
GPIO. Seems completely reasonable for the BT HCI driver to support
that, if you ask me.

> We will push on the team responsible for the BT drivers but all I
> need to know right now is that an rfkill driver isn't necessary.

And indeed, that would get rid of the need for anything rfkill.

> There might be some need for this but for our purpose I think the
> right path is to have a BT driver doing what this user space app is
> doing and then integrate whatever is missing with this HCI User
> Channel.
> 

Sounds good to me, even if I have no idea (and don't really need to
know) what all that is :)

I'll look at killing the rfkill-regulator driver entirely though,
since, afaict, nothing uses it.

johannes
