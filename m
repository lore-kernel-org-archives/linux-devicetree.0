From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] of: changesets: Introduce changeset helper methods
Date: Mon, 14 Nov 2016 21:17:07 -0800
Message-ID: <582A9A53.6070304@gmail.com>
References: <20161104144241.18002-1-hdegoede@redhat.com>
 <20161104144241.18002-2-hdegoede@redhat.com> <5827CCC3.90003@gmail.com>
 <582968FA.4020800@gmail.com>
 <b2cef3fb-cbb4-f34b-cb9a-84578bb67751@redhat.com> <582A060D.50800@gmail.com>
 <CAL_Jsq+zWiXOtb4hWrpB87z8T4WLfCbLeGNgST4tmAz61dgFHA@mail.gmail.com>
 <582A6B69.4070704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <582A6B69.4070704-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rob, Hans, Pantelis,

On 11/14/16 17:56, Frank Rowand wrote:
> On 11/14/16 14:16, Rob Herring wrote:
>> On Mon, Nov 14, 2016 at 12:44 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

< snip >

>>
>> These helpers are useful and easier to use than the existing API
>> independent of any issues to sort out with how we use overlays. So I
>> plan to take them whether there's a user right away or not.
>>
>> Rob
> 
> OK, expect a more detailed review from me this week.
> 
> -Frank

Part of my issues with these patches is related to using a format
string and the variables required by that format string as arguments
to several of the proposed helper functions.  That construct is driven
by the helper functions calling  __of_node_dup() which has that same
pattern of arguments.  Blindly accepting a format string as an argument
to populate a buffer is not good from a security or robustness standpoint.

The only callers of __of_node_dup() are one site in drivers/of/overlay.c
and three sites in drivers/of/unittest.c.

I would like to see if I can find a good alternate to the format
string approach in __of_node_dup(), which would remove that issue
in the helper functions.

I do not expect Hans to fix the existing __of_node_dup(), I am
willing to do that myself.

Rob, are you in a hurry to accept the helper functions or are you
willing to give me some time to resolve the __of_node_dup() issue
and come up with a new version of the helper function patches?

Caveat, I have a hard deadline late Monday Nov 21 so I can't
start on this until Nov 22.  Then that is Thanksgiving week and
I have some other work commitments that will demand much of my
time the next two weeks.  I can commit to starting Nov 22, then
making it my top priority starting Dec 12.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
