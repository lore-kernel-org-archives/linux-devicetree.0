From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: propagate of_parse_phandle_with_args errors
Date: Thu, 5 Jul 2012 15:27:47 +0200
Message-ID: <CACRpkdaazZTufukCmCWmqOsuwnYSoQoAcnC3iUoqqiAkt3X7eA@mail.gmail.com>
References: <1340945879-11712-1-git-send-email-acourbot@nvidia.com>
	<1340945879-11712-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1340945879-11712-3-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 29, 2012 at 6:57 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> Make of_get_named_gpio_flags propagate any error it receives from
> of_parse_phandle_with_args instead of inconditionally returning -EINVAL.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied.

Thanks,
Linus Walleij
