From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 0/5] simplefb: add clock handling code
Date: Tue, 28 Oct 2014 12:08:04 +0100
Message-ID: <544F7914.8090007@redhat.com>
References: <1413996311-4287-1-git-send-email-hdegoede@redhat.com> <544F737A.7000109@ti.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBI7SXWRAKGQEAILKOHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <544F737A.7000109-l0cyMroinI0@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 10/28/2014 11:44 AM, Tomi Valkeinen wrote:
> On 22/10/14 19:45, Hans de Goede wrote:
> 
>> Since we seem to have broad agreement on how to move forward with this, I
>> would like to ask you to please merge this patch-set for 3.19.
>>
>> I know 3.19 is still somewhat ar away, but I would like to submit the u-boot
>> side of this to upstream ASAP, so can you please let me know if you plan to 
>> take this patch-set for 3.19 soon ?
> 
> This series looks fine to me, except patch 3 is missing a description,

Description for patch 3:

"Add a proper struct describing simplefb private data, with the palette in there,
instead of directly storing the palette in the fb_info->par pointer."

> and patch 4 makes the desc a continuation of the subject.

Description for patch 4:

"Use the usual kernel style of goto error_foo to free resources on probe
error. This is a preparation patch for adding clocks support.

While at it update ioremap_wc error return from ENODEV to ENOMEM."

> Each patch should have a description (independent from subject).

Ok, I'll remember that for future patches.

> No need to resend, I can cook up something for those, or I can edit the
> descs if you provide the text.

Descriptions provided above, thanks!

> So if there are no strong objections, I'll queue this for 3.19.

Regards,

Hans
