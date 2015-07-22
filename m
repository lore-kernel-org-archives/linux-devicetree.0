From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Revert "ti-st: add device tree support"
Date: Wed, 22 Jul 2015 13:58:26 -0500
Message-ID: <CAL_JsqK1WNPQ6vnO=YBfc1b6k6TEF+XXStFJ=WNMLGb81bO+4A@mail.gmail.com>
References: <1437589035-14178-1-git-send-email-robh@kernel.org> <20150722183244.GB32421@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150722183244.GB32421-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Gigi Joseph <gigi.joseph-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 22, 2015 at 1:32 PM, Greg Kroah-Hartman
<gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Wed, Jul 22, 2015 at 01:17:15PM -0500, Rob Herring wrote:
>> This reverts commit 46d0d33350e9b32642d745a8b46a954910196b4d.
>>
>> This binding is horrible and never should have been merged. It is not
>> documented nor are there any in tree users, so reverting it will not
>> break anything we care about. Lets revert it before we do have users.
>
> This went into the 4.0 kernel, should this revert get into 4.2-final or
> can it wait for 4.3?

It can wait to 4.3. It's just more to bisect over for people wondering
why their out of tree stuff breaks. Give some time for comment though
first. I'd rather see a fixed binding get done.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
