From: Andreas Larsson <andreas@gaisler.com>
Subject: Re: [PATCH v3 4/5] of: Create function for counting number of phandles
 in a property
Date: Wed, 13 Feb 2013 10:57:58 +0100
Message-ID: <511B63A6.1080208@gaisler.com>
References: <1360710401-16757-1-git-send-email-grant.likely@secretlab.ca> <1360710401-16757-5-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1360710401-16757-5-git-send-email-grant.likely@secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On 2013-02-13 00:06, Grant Likely wrote:
> This patch creates of_count_phandle_with_args(), a new function for
> counting the number of phandle+argument tuples in a given property. This
> is better than the existing method of parsing each phandle individually
> until parsing fails which is a horribly slow way to do the count.
>
> Tested on ARM using the selftest code.
>
> v3: - Rebased on top of selftest code cleanup patch
> v2: - fix bug where of_parse_phandle_with_args() could behave like _count_.
>      - made of_gpio_named_count() into a static inline regardless of CONFIG_OF_GPIO
>
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Andreas Larsson <andreas@gaisler.com>

Tested-by: Andreas Larsson <andreas@gaisler.com>

Cheers,
Andreas Larsson
