From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Documentation/devicetree: document cavium-pip
 rx-delay/tx-delay properties
Date: Thu, 9 Jun 2016 14:03:05 -0500
Message-ID: <CAL_JsqLSuvBk7nZFnawqRkLKAEPKOEU7N+zuom7ERTHhkKCL2w@mail.gmail.com>
References: <1465079042-22499-1-git-send-email-aaro.koskinen@iki.fi>
 <20160608191842.GA19860@rob-hp-laptop> <20160608195156.GH5218@raspberrypi.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160608195156.GH5218-FnsA7b+Nu9VnX4FghcBuy1lsiSbylPe+PBWPt36IahQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Cc: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 8, 2016 at 2:51 PM, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org> wrote:
> Hi,
>
> On Wed, Jun 08, 2016 at 02:18:42PM -0500, Rob Herring wrote:
>> On Sun, Jun 05, 2016 at 01:24:02AM +0300, Aaro Koskinen wrote:
>> > Document cavium-pip rx-delay/tx-delay properties. Currently the board
>> > specific values need to be hardcoded in the platform code, which we
>> > want to avoid when moving to DT-only booting.
>> >
>> > Signed-off-by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
>> > ---
>> >  Documentation/devicetree/bindings/net/cavium-pip.txt | 4 ++++
>> >  1 file changed, 4 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/net/cavium-pip.txt b/Documentation/devicetree/bindings/net/cavium-pip.txt
>> > index 7dbd158..edbf411 100644
>> > --- a/Documentation/devicetree/bindings/net/cavium-pip.txt
>> > +++ b/Documentation/devicetree/bindings/net/cavium-pip.txt
>> > @@ -37,6 +37,10 @@ Properties for PIP port which is a child the PIP interface:
>> >
>> >  - phy-handle: Optional, see ethernet.txt file in the same directory.
>> >
>> > +- rx-delay: Delay value for RGMII receive clock. Optional. Disabled if 0.
>> > +
>> > +- tx-delay: Delay value for RGMII transmit clock. Optional. Disabled if 0.
>>
>> What are the units? Use standard unit suffix if in ns, us, etc.
>
> This is a raw register value, and the mapping to actual delay varies
> depending on HW, AFAIK.

Then state that in the description.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
