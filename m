From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 7/8] gpio/mpc8xxx: Convert to platform device interface.
Date: Tue, 20 Jan 2015 11:03:40 +0900
Message-ID: <CAAVeFuLHThCVmh4wjUP5_PZLVS6aqjmx8p-w1zyTw2PXM1wC7g@mail.gmail.com>
References: <1421581173-28416-1-git-send-email-ricardo.ribalda@gmail.com> <1421581173-28416-8-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1421581173-28416-8-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Peter Korsgaard <jacmet@sunsite.dk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 18, 2015 at 8:39 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> This way we do not need to transverse the device tree manually.

... and this makes things much more legible.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
