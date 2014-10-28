From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH v4 0/5] simplefb: add clock handling code
Date: Tue, 28 Oct 2014 12:30:37 +0100
Message-ID: <544F7E5D.60104@redhat.com>
References: <1413996311-4287-1-git-send-email-hdegoede@redhat.com> <544F737A.7000109@ti.com> <CAL_JsqJ2JRg7k21CEVe4-At7enD+y3TN_7wfqhY0OHZm-_j17w@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORB2H4XWRAKGQEQ76EM4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAL_JsqJ2JRg7k21CEVe4-At7enD+y3TN_7wfqhY0OHZm-_j17w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 10/28/2014 12:11 PM, Rob Herring wrote:
> On Tue, Oct 28, 2014 at 6:44 PM, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:
>> On 22/10/14 19:45, Hans de Goede wrote:
>>
>>> Since we seem to have broad agreement on how to move forward with this, I
>>> would like to ask you to please merge this patch-set for 3.19.
>>>
>>> I know 3.19 is still somewhat ar away, but I would like to submit the u-boot
>>> side of this to upstream ASAP, so can you please let me know if you plan to
>>> take this patch-set for 3.19 soon ?
>>
>> This series looks fine to me, except patch 3 is missing a description,
>> and patch 4 makes the desc a continuation of the subject. Each patch
>> should have a description (independent from subject).
>>
>> No need to resend, I can cook up something for those, or I can edit the
>> descs if you provide the text.
>>
>> So if there are no strong objections, I'll queue this for 3.19.
> 
> Yes, I object to the binding still as it has not changed from what was
> previously posted.

It would be helpful if you could explain why you object. Last time you
said: " You are mixing in a hardware description that is simply inaccurate."

I then explained that this is not hardware description, but runtime state
information, as it tells the kernel which clocks were chosen to drive the
display (out of typically a list of possible options, depending on which
output is used, etc.). Just like which memory address the bootloader has
chosen to scan out the video image from.

Then you got quiet, so sorry, but this time your objection really is too
late. You cannot simply go quiet halfway through a discussion and then pop
up again when a new version is posted to say "I object" yet another time,
you've had your chance to make your arguments last time, and chose to stay
quiet after I explained in detail that this is not hardware description but
state information, so now it is simply too late.

These bindings have been discussed at Plumbers with various interested people
present, and the conclusion was that this really is the best way to handle this,
so this patch is:

    Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Reviewed-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
    Acked-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
    Reviewed-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

And David Herrman who is working on simpledrm, which will be merged soon, which
will also use the simplefb bindings also agrees. So we have the simplefb maintainer,
simpledrm maintainer, and the clk subsystem maintainer + 2 other maintainers all
agreeing on a way forward, the time for bikeshedding now really really really is
over.

Tomi, can you please let us know how you plan to proceed with this ?

Regards,

Hans
