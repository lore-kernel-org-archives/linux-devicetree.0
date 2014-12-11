From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: SDIO device binding
Date: Thu, 11 Dec 2014 16:37:55 +0100
Message-ID: <CAPDyKFrXHu_F5WH6HyvXY4+6e2Uq0ve31A2M=bP6iEhod6_nNQ@mail.gmail.com>
References: <CAB3XZEfX7oAmJe=86j+WC0w73kQxO4C=Ufdy6eMgtYYh8Swv2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <CAB3XZEfX7oAmJe=86j+WC0w73kQxO4C=Ufdy6eMgtYYh8Swv2g@mail.gmail.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Eliad Peller <eliad@wizery.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Chris Ball <chris@printf.net>, Hans de Goede <hdegoede@redhat.com>
List-Id: devicetree@vger.kernel.org

On 11 December 2014 at 14:32, Eliad Peller <eliad@wizery.com> wrote:
> hi,
>
> I'm looking for the proper way to pass SDIO device properties using devicetree.
>
> There seems to be a patchset sent previously by Sascha Hauer to handle
> it, but for some reason it didn't get merged, and i can't find any
> further discussion regarding the patches.
>
> https://patchwork.ozlabs.org/patch/355235/
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-June/261575.html
>
> Was there any issue with the patches, or is there any other binding
> that should be used instead?

This above is most likely the correct solution. Thanks for the
reminder, I will try to find some time to go through them again.

May I ask what kind of properties you would like to configure for the
SDIO device?

Kind regards
Uffe
