From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH v4 0/5] simplefb: add clock handling code
Date: Thu, 06 Nov 2014 16:05:13 +0100
Message-ID: <545B8E29.90807@redhat.com>
References: <1413996311-4287-1-git-send-email-hdegoede@redhat.com> <54534523.8080801@ti.com> <545B8338.8060908@ti.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBM4452RAKGQEJTLCZ6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <545B8338.8060908-l0cyMroinI0@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 11/06/2014 03:18 PM, Tomi Valkeinen wrote:
> On 31/10/14 10:15, Tomi Valkeinen wrote:
>> Hi Hans,
>>
>> On 22/10/14 19:45, Hans de Goede wrote:
>>
>>> -We will add a clocks property to the simplefb devicetree bindings, so
>>>  that u-boot setup framebuffers passed to the kernel (for early console
>>>  support) can properly list the clocks used, and simplefb can claim them to
>>>  avoid them getting turned off, thereby breaking the early console
>>
>> Perhaps this has been discussed earlier, but I started to wonder if
>> managing clocks is enough.
>>
>> What about regulators (to power the LCD), gpios (to keep the LCD
>> enabled) and pinctrl (for video signals)? I guess any those could be
>> reset by the kernel if no driver uses them.
> 
> Hans, ping. Have these been already discussed?

Yes, and I already responded to your original mail on this on Oct. 31th,
for some reason my mail client drops you from the CC, when I do a reply-to-all
to one of your mails (I've added you manually this time).

My replies did go to simple-fb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org .I'll forward my 2 mails on this
to you.

Regards,

Hans
