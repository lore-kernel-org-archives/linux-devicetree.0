From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: Document exactly what of_find_node_by_name() puts
Date: Fri, 17 Nov 2017 08:08:16 -0600
Message-ID: <CAL_JsqLncH8g2bksHMbsO639q649-UQy1DByujywdUL1vH_VXA@mail.gmail.com>
References: <20171111014536.3592-1-sboyd@codeaurora.org> <0ef4b415-801c-cb58-5de1-01bcfba1c778@infradead.org>
 <20171117024404.GV11955@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117024404.GV11955-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 16, 2017 at 8:44 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 11/10, Randy Dunlap wrote:
>> On 11/10/2017 05:45 PM, Stephen Boyd wrote:
>> > It isn't clear if this function of_node_put()s the 'from'
>> > argument, or the node it finds in the search. Clearly indicate
>> > which variable is touched.
>> >
>> > Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> > ---
>> >  drivers/of/base.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/of/base.c b/drivers/of/base.c
>> > index 63897531cd75..602c5d65734a 100644
>> > --- a/drivers/of/base.c
>> > +++ b/drivers/of/base.c
>> > @@ -866,7 +866,7 @@ EXPORT_SYMBOL(of_find_node_opts_by_path);>   *  @from:  The node to start searching from or NULL, the node
>>
>>     * @from:  The node to start searching from or %NULL; the node
>>
>> >   *         you pass will not be searched, only the next one
>> >   *         will; typically, you pass what the previous call
>>
>>     *         will. Typically, you pass what the previous call
>>
>
> Rob, do you want me to fold this in?

Yes, please.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
