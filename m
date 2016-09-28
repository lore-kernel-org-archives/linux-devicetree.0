From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: rfkill guidance
Date: Wed, 28 Sep 2016 08:49:51 +0200
Message-ID: <1475045391.4139.26.camel@sipsolutions.net>
References: <324c35c6-49ca-174c-db07-674532f3e628@broadcom.com>
         <1474961105.5141.5.camel@sipsolutions.net>
         <0a8cff88-73aa-8311-7afe-98612161421f@broadcom.com>
         (sfid-20160928_002127_321746_FD82CF46) <1475044682.4139.18.camel@sipsolutions.net>
         (sfid-20160928_083815_252455_876B9E2B)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475044682.4139.18.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> (sfid-20160928_083815_252455_876B9E2B)
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Today we already have all the platform rfkill instances (like the
> various ACPI ones) that don't live off a device that they control,
> but instead control the platform's radio functionality. And in some
> cases, that actually has very similar behaviour to what was proposed
> in the previous patch, and what you're looking for, in that it
> sometimes kills power to BT or WiFi chips when soft-disabled (or
> kicks them off the bus in some other way).

Actually, let me retract that a bit. Obviously they *do* control a
device or radio, but we don't actually know which one. And that can
actually become a problem, since we don't even know how they work etc.

So IOW, even with the ACPI stuff, there's no real "platform rfkill"
concept - it's always killing a specific radio.

There used to be some rfkill that was just reflecting the button state,
but I think we got rid of that in favour of reflecting button state
through hid/input, if it doesn't also control a radio.

So, actually, the more I think about it the more I agree with Mark's
objection. It doesn't really make sense to have a concept of an rfkill
and not know what radio it controls.

In your particular case, Jon, it's complicated by the fact that you
don't want to bind a kernel driver with the rfkill, not sure where
you'd get a device to tie the rfkill to then.

johannes
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
