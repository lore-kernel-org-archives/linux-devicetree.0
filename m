From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [dtc RFC PATCH] Enforce node name unit-address presence/absence
Date: Wed, 18 Sep 2013 17:02:20 -0600
Message-ID: <523A30FC.3060309@wwwdotorg.org>
References: <1379535836-12726-1-git-send-email-swarren@wwwdotorg.org> <CAOesGMg0Rrmew0iK-Gtrx_UiODhpro_S2xUxQi0gZ+7PJmBHnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMg0Rrmew0iK-Gtrx_UiODhpro_S2xUxQi0gZ+7PJmBHnw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/18/2013 02:41 PM, Olof Johansson wrote:
> On Wed, Sep 18, 2013 at 1:23 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> ePAPR 1.1 section 2.2.1.1 "Node Name Requirements" specifies that any
>> node that has a reg property must include a unit address in its name
>> with value matching the first entry in its reg property. Conversely, if
>> a node does not have a reg property, the node name must not include a
>> unit address.
>>
>> Implement a check for this. The code doesn't validate the format of the
>> unit address; ePAPR implies this may vary from binding to binding, so
>> I'm not sure that it's possible to validate the value itself.
...
> Anyway, I think it'd be better to produce warnings than errors for
> this. That way we could also merge it now while the trees are fixed
> up.

Yes, that makes sense.

> Also, maybe warn for @0x<foo>, which is another unpreferred syntax, it
> should just be @<foo> (with foo being in hex).

ePAPR doesn't seem to disallow that; it explicitly says that the
unit-address consists of the characters from table 2-1, which is the
same table of characters used for the node name itself. However, it does
state that the binding for a particular bus may impose additional
restrictions; should I implement such a check but limit it to the root
node or specific known bus types? That would require explicitly
whitelisting the check for a lot of bus types, given that each I2C/...
controller binding is a bus type...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
