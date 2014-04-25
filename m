From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] gpio: of: Allow -gpio suffix for property names
Date: Fri, 25 Apr 2014 09:24:57 -0600
Message-ID: <535A7E49.8000809@wwwdotorg.org>
References: <1398266889-17489-1-git-send-email-thierry.reding@gmail.com> <1398266889-17489-2-git-send-email-thierry.reding@gmail.com> <CACRpkdadAUXgC-K6be6SFFn2ZTvCqkTK7VRJEzpFdUbybKc3YA@mail.gmail.com> <CAL_Jsq+DwCBLoNYsgHnoLQgSMnSBDM5XH_xoWS-RWdmx-JBeXg@mail.gmail.com> <20140424182243.GA27443@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20140424182243.GA27443@ulmo>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robherring2@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 04/24/2014 12:22 PM, Thierry Reding wrote:
...
> The downside of not allowing the gpiod API to support the -gpio suffix
> is that we'll never be able to convert drivers that use such a binding
> and will forever have a hodgepodge of GPIO APIs that we need to support.

Perhaps rather than making the existing gpiod API automatically search
for both -gpios and -gpio, we could make a new API for the other suffix,
so that driver indicate explicitly which property name they want. That
way, someone can't accidentally write -gpio in the DT and have it still
work. Or, add a parameter to the existing API, but that's probably a lot
more churn.

