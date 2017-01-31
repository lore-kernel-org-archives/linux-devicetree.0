From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] checks: Add Warning for stricter node name character checking
Date: Tue, 31 Jan 2017 07:46:52 -0600
Message-ID: <CAL_JsqJy08h=YR+tsfqX0A-J9yto++OXrhWgaXTU46txW3jveA@mail.gmail.com>
References: <20170124174534.3865-1-robh@kernel.org> <20170124174534.3865-3-robh@kernel.org>
 <20170131031434.GK14879@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170131031434.GK14879-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 30, 2017 at 9:14 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Jan 24, 2017 at 11:45:31AM -0600, Rob Herring wrote:
>> While '#', '?', '.', '+', '*', and '_' are considered valid characters,
>> their use is discouraged in recommended practices.
>>
>> Testing this found a few cases of '.'. The majority of the warnings were
>> all from underscores.
>
> Hmm.  The Opal firmware on POWER8 machines uses both '.' and '#' in
> node names in some places.  So I'm not terribly convinced this is a
> good idea.

When would it be using a flat tree and dtc? I know the DT is more
dynamic on these systems, but it would be nice if a dts was published
as reference.

These checks are more something I want to discourage new uses of, not
necessarily fix existing cases. I've thought about making the warnings
be levels rather than true/false. Or perhaps something like -Wall.
Then these checks can be off by default. The kernel build is doing
that already for the unit address checks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
