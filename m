From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: pinctrl-imx27.c: Cleaning up remove a struct
 that is unused
Date: Tue, 8 Jul 2014 10:29:12 +0200
Message-ID: <CACRpkdYgiJje6rzYO=VSoYGdAOZxYk3o9pdVhvSNSyy7V35gMQ@mail.gmail.com>
References: <1403992120-8160-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403992120-8160-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexander Shiyan <shc_work@mail.ru>
List-Id: devicetree@vger.kernel.org

On Sat, Jun 28, 2014 at 11:48 PM, Rickard Strandqvist
<rickard_strandqvist@spectrumdigital.se> wrote:

> Removal of a struct that is never used
>
> This was found using a static code analysis program called cppcheck
>
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>

Already removed in a similar patch from Alexander Shiyan, but thanks
anyway!

Yours,
Linus Walleij
