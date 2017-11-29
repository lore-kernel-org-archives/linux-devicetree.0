From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] pinctrl: Allow a device to indicate when to force
 a state
Date: Wed, 29 Nov 2017 14:06:34 +0100
Message-ID: <CACRpkdY82RPKNbVPC8XC3BeHa27-gsyu2j+G-pSFgg8AYUJvZw@mail.gmail.com>
References: <20171102231551.16220-1-f.fainelli@gmail.com> <20171102231551.16220-2-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171102231551.16220-2-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ext Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Charles Keepax <ckeepax-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org>, Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 3, 2017 at 12:15 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> It may happen that a device needs to force applying a state, e.g:
> because it only defines one state of pin states (default) but loses
> power/register contents when entering low power modes. Add a
> pinctrl_dev::flags bitmask to help describe future quirks and define
> PINCTRL_FLG_FORCE_STATE as such a settable flag.
>
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

So if I understand correctly, the state is lost across
suspend/resume, correct?

Or are we even talking runtime PM runtime_suspend
and runtime_resume here?

> @@ -1197,9 +1197,21 @@ int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
>  {
>         struct pinctrl_setting *setting, *setting2;
>         struct pinctrl_state *old_state = p->state;
> +       bool force = false;
>         int ret;
>
> -       if (p->state == state)
> +       if (p->state) {
> +               list_for_each_entry(setting, &p->state->settings, node) {
> +                       if (setting->pctldev->flags & PINCTRL_FLG_FORCE_STATE)
> +                               force = true;
> +               }
> +       }
> +
> +       /* Some controllers may want to force this operation when they define
> +        * only one set of functions and lose power state, e.g: pinctrl-single
> +        * with its pinctrl-single,low-power-state-loss property.
> +        */
> +       if (p->state == state && !force)
>                 return 0;

So the idea is we go and change the state even if we are in the right
state already, I understand that much.

But how is pinctrl_select_state() being called in the first place under
these circumstances?

If this comes from the resume() callback in .pm of the device driver,
would not the same thing be achived if you just set some mock
"sleep" state in suspend()? It could even have exactly the same settings
as the "default" state, as long as it is another state, the register
will be reprogrammed.

See further include/linux/pinctrl/pinctrl-state.h

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
