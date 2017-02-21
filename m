From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/9] dt-bindings: Add Ampire AM-480272H3TMQW-T01H panel
Date: Tue, 21 Feb 2017 08:07:56 -0600
Message-ID: <CAL_JsqLBZ0DGP62yGb2GjNZMto9hWce_HWNCX5iWhbrnE3ae_Q@mail.gmail.com>
References: <1486738489-22154-1-git-send-email-yannick.fertre@st.com>
 <1486738489-22154-5-git-send-email-yannick.fertre@st.com> <20170216023408.apqukipi5zzkrk7j@rob-hp-laptop>
 <2b409ff7-54fe-4110-6495-1cc54585e5e2@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2b409ff7-54fe-4110-6495-1cc54585e5e2-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yannick FERTRE <yannick.fertre-qxv4g6HH51o@public.gmane.org>
Cc: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin GAIGNARD <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>, Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Mickael REULIER <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Vincent ABRIOU <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Fabien DESSENNE <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, "kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org" <kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel@list>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 20, 2017 at 5:01 AM, Yannick FERTRE <yannick.fertre-qxv4g6HH51o@public.gmane.org> wrote:
>
>
> On 02/16/2017 03:34 AM, Rob Herring wrote:
>> On Fri, Feb 10, 2017 at 03:54:44PM +0100, Yannick Fertre wrote:
>>> Signed-off-by: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
>>> ---
>>>  .../bindings/display/panel/ampire,am-480272h3tmqw-t01h.txt         | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.txt b/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.txt
>>> new file mode 100644
>>> index 0000000..f59e3c4
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.txt
>>> @@ -0,0 +1,7 @@
>>> +Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
>>> +
>>> +Required properties:
>>> +- compatible: should be "ampire,am-480272h3tmqw-t01h"
>>
>> No GPIO controls or power supply for this panel?
>>
>> Rob
>>
>
> Hi Rob,
> thank for your reply.
> There is no gpio or power supply control for this panel with the eval
> board stm429x9i.

You need to describe what the panel has, not what you have control of
or not on a particular board.

> This binding is similar to all panel bindings which are link to panel
> simple. Details on gpio & power supply are describe with simple-panel
> binding.

simple-panel.txt provides what possible standard properties there are,
not whether a panel uses them. The power supply needs to be explicit
because I don't know if you forgot and there's really 2 supplies or
you are using "power-supply" for a single supply.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
