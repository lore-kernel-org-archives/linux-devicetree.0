From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Secure resources in device trees
Date: Wed, 21 Jan 2015 16:29:32 +0000
Message-ID: <CACxGe6tpWEQt=RwwjFF+Zcz_XSLJPBugJPV+WieH-=4jqW3jtw@mail.gmail.com>
References: <CAOgzsHVpXZTHoq7HyfrGeGe92onnb6=BQr30PvKrg04h=0De0w@mail.gmail.com>
 <CAL_Jsq+rN07CfdNjErhLipKNJJj3uoczR98YuWSAwjMRW1xVag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+rN07CfdNjErhLipKNJJj3uoczR98YuWSAwjMRW1xVag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Bellows <greg.bellows-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 21, 2015 at 4:21 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Jan 20, 2015 at 1:15 PM, Greg Bellows <greg.bellows-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> 2) Modify the standard device tree blob to include annotations or
>> modifications to describe which resources are secure or not.  In this
>> case, secure software would use the single device tree to identify the
>> secure resources.  The added information could be used by secure
>> software to trim the device tree before passing it.  Alternatively,
>> the information could be passed on to non-secure software with the
>> expectation that it would honor the device security.   It would be
>> crucial that any data added to the device tree adhere to existing
>> conventions or expectations.
>
> You could also do this w/o dts changes. You could start with a full
> description and the knowledge of what to filter out resides in the
> secure OS or bootloader. It depends where you want to put the
> partitioning decisions.
>
> I think there's 2 main cases to consider. Full nodes that are assigned
> to one side and Trustzone aware nodes. The first could potentially
> re-use status property adding just a "secure" setting or we just add a
> new "secure" property. This should probably be inherited by child
> nodes. The secure firmware would then need to remove or set status to
> disabled for those nodes. For the latter case, I don't think we can
> avoid having the firmware having specific knowledge of the bindings.
> We'll have to filter out the secure only details as I think so far we
> have only been creating bindings which describe the non-secure view. I
> don't think this is a big deal as the peripheral set would be pretty
> limited AFAIK.

This is close to what Greg and I discussed in a private thread. It
would be just fine to use something like status="secure-okay" for the
nodes that are secure world only. Secure world code would need to
understand the new status value, but the existing kernel will do the
correct thing. Only nodes with status="okay" or ="ok" will be used.
There is no need to modify the tree at all in this scenario.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
