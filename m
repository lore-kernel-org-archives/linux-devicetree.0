From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/5] dt-bindings: Add a clocks property
 to the simple-framebuffer binding
Date: Wed, 12 Nov 2014 11:43:56 -0600
Message-ID: <CAL_Jsq+fzmTOSr8g+6b5R=KPao1ZeumsyNS3nfYBzfVQCiPbWA@mail.gmail.com>
References: <1413996311-4287-1-git-send-email-hdegoede@redhat.com>
 <1413996311-4287-3-git-send-email-hdegoede@redhat.com> <20141111214217.19EF5C41610@trevor.secretlab.ca>
 <546373C6.4010001@redhat.com> <CACxGe6v15EjpALit4ZJLXDgCkwEYM4t1mryjoQpa3=wpKmXWEg@mail.gmail.com>
 <CACxGe6vBq5Y6HbogbpVUy9VLaocfrAsR_XRbio4zBB_vY5GRsw@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD62P6P6EQIPDOEOUMCRUBD7SB2HY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CACxGe6vBq5Y6HbogbpVUy9VLaocfrAsR_XRbio4zBB_vY5GRsw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 12, 2014 at 10:38 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Rob, seeing as we disagree on patch #5, do you have time to discuss this
> evening, or tomorrow?

Yes, either is fine.

Rob

>
> g.
>
> On 12 Nov 2014 14:56, "Grant Likely" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>
>> [Replying on-list and with original ccs]
>>
>> On Wed, Nov 12, 2014 at 2:50 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> wrote:
>> > Hi,
>> >
>> > On 11/11/2014 10:42 PM, Grant Likely wrote:
>> >> - clocks : List of clocks used by the framebuffer. Clocks listed here
>> >>            are expected to already be configured correctly. The OS must
>> >>            ensure these clocks are not modified or disabled while the
>> >>            simple framebuffer remains active.
>> >
>> > Updated in my local tree, where I've also added proper commit messages
>> > to the 2 patches missing them. Shall I send a v5 of the set, and may I
>> > add your Acked-by to this patch when sending v5?
>>
>> For this whole series, please add my Acked-by.
>>
>> Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> I'm okay with the bindings, and I'm okay with adding the clock
>> dependency to a simplefb node. I'm happy with the conversation we had
>> today on IRC, and I'm expecting to see a binding that covers expected
>> firmware/OS behaviour and association with the real hardware posted to
>> the list shortly.
>>
>> g.
