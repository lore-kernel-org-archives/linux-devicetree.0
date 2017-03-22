From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] mmc: sh_mmcif: Document r7s72100 DT bindings
Date: Wed, 22 Mar 2017 15:09:17 +0100
Message-ID: <CAPDyKFqA6zwe9r8tikneL59CURETA7d50Oa1HT9zsrjyQFs9yQ@mail.gmail.com>
References: <20170112041452.14136-1-chris.brandt@renesas.com>
 <20170118213024.qreoa5k7stjmwmr7@rob-hp-laptop> <PS1PR06MB1162CACF3A130AB157C200AA8A3C0@PS1PR06MB1162.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <PS1PR06MB1162CACF3A130AB157C200AA8A3C0-l4vAwRX7WilTTnd0MlXEO20DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 22 March 2017 at 14:17, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> This one seems to have been forgotten.
>
> Should I resend with all the acks and reviews?

Seems like you didn't send it to linux-mmc, so it wasn't picked up by
the patchtracker. Please re-send so I can pick it up.

Kind regards
Uffe

>
> Chris
>
>
>
> On Wednesday, January 18, 2017, Rob Herring wrote:
>> On Wed, Jan 11, 2017 at 11:14:52PM -0500, Chris Brandt wrote:
>> > Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>> >
>> > ---
>> > v3:
>> > * added list of how many interrupts each SOC has
>> > v2:
>> > * added interrupt description
>> > ---
>> >  Documentation/devicetree/bindings/mmc/renesas,mmcif.txt | 8 ++++++++
>> >  1 file changed, 8 insertions(+)
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
>
>
> On Thursday, January 12, 2017, Simon Horman wrote:
>> On Thu, Jan 12, 2017 at 08:36:10AM +0100, Geert Uytterhoeven wrote:
>> > Hi Chris,
>> >
>> > On Thu, Jan 12, 2017 at 5:14 AM, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>> wrote:
>> > > Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>> > >
>> > > ---
>> > > v3:
>> > > * added list of how many interrupts each SOC has
>> > > v2:
>> > > * added interrupt description
>> >
>> > Thanks or the update!
>> >
>> > Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>>
>> Reviewed-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
>
>
> On Thursday, January 12, 2017, Geert Uytterhoeven wrote:
>> On Thu, Jan 12, 2017 at 5:14 AM, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>> wrote:
>> > Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>> >
>> > ---
>> > v3:
>> > * added list of how many interrupts each SOC has
>> > v2:
>> > * added interrupt description
>>
>> Thanks or the update!
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
