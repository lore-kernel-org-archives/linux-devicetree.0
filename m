From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 2/5] dt-bindings: Add a clocks property
 to the simple-framebuffer binding
Date: Wed, 12 Nov 2014 16:27:00 +0100
Message-ID: <54637C44.8050208@redhat.com>
References: <1413996311-4287-1-git-send-email-hdegoede@redhat.com> <1413996311-4287-3-git-send-email-hdegoede@redhat.com> <20141111214217.19EF5C41610@trevor.secretlab.ca> <546373C6.4010001@redhat.com> <CACxGe6v15EjpALit4ZJLXDgCkwEYM4t1mryjoQpa3=wpKmXWEg@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBUPYRWRQKGQECPW4V7A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CACxGe6v15EjpALit4ZJLXDgCkwEYM4t1mryjoQpa3=wpKmXWEg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 11/12/2014 03:56 PM, Grant Likely wrote:
> [Replying on-list and with original ccs]
> 
> On Wed, Nov 12, 2014 at 2:50 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> Hi,
>>
>> On 11/11/2014 10:42 PM, Grant Likely wrote:
>>> - clocks : List of clocks used by the framebuffer. Clocks listed here
>>>            are expected to already be configured correctly. The OS must
>>>            ensure these clocks are not modified or disabled while the
>>>            simple framebuffer remains active.
>>
>> Updated in my local tree, where I've also added proper commit messages
>> to the 2 patches missing them. Shall I send a v5 of the set, and may I
>> add your Acked-by to this patch when sending v5?
> 
> For this whole series, please add my Acked-by.
> 
> Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Thanks, given the above update to the bindings text, and also some updated
commit messages, I'll post a v5 with all these added soon.

Regards,

Hans
