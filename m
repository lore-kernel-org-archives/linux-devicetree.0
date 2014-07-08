From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpio-twl4030.c: Cleaning up null pointer checks
 that could never happen
Date: Tue, 8 Jul 2014 09:27:13 +0200
Message-ID: <CACRpkdaa=1Y-XiOaf_e1OjMFkOdJ4SJbJGDEUu-e4puzvr+opA@mail.gmail.com>
References: <1403799441-20362-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1403799441-20362-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-gpio-owner@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 26, 2014 at 6:17 PM, Rickard Strandqvist
<rickard_strandqvist@spectrumdigital.se> wrote:

> Removal of null pointer checks that could never happen
>
> This was found using a static code analysis program called cppcheck
>
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>

That's correct. Patch applied!

Yours,
Linus Walleij
