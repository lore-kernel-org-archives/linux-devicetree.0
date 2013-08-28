From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V6 2/5] of: move of_parse_phandle()
Date: Wed, 28 Aug 2013 21:30:38 +0200
Message-ID: <CACRpkdYK75uSXLmzkQ9uNQfSBW86bSz3D0nYSr_XSXfixKSDGg@mail.gmail.com>
References: <1376515632-12594-1-git-send-email-swarren@wwwdotorg.org>
	<1376515632-12594-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1376515632-12594-2-git-send-email-swarren@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 14, 2013 at 11:27 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:

> From: Stephen Warren <swarren@nvidia.com>
>
> Move of_parse_phandle() after __of_parse_phandle_with_args(), since a
> future patch will call __of_parse_phandle_with_args() from
> of_parse_phandle(). Moving the function avoids adding a prototype. Doing
> the move separately highlights the code changes separately.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> ---
> v5: New patch.

Still no feedback from Rob || Grant on this quite important cleanup?

I would like to nominate Stephen Warren as co-maintainer of
drivers/of/*, he definately knows his way around the code.
I'm just worried that he may not accept due to a lot of work in the
bindings already.

Yours,
Linus Walleij
