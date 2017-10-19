From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] arm: dts: fix unit-address leading 0s
Date: Thu, 19 Oct 2017 23:29:49 +0200
Message-ID: <CAK8P3a0GHWkG-xXHMMrBLMvjGPyk2_bK56s6uLmjzNMjo4nC6Q@mail.gmail.com>
References: <20171013175452.1198-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171013175452.1198-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 13, 2017 at 7:54 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> Fix dtc warnings for 'simple_bus_reg' due to leading 0s. Converted using
> the following command:
>
> perl -p -i -e 's/\@0+([0-9a-f])/\@$1/g' `find arch/arm/boot/dts -type -f -name '*.dts*'
>
> Dropped changes to ARM, Ltd. boards LED nodes and manually fixed up some
> occurrences of uppercase hex.
>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied both to next/dt, thanks a lot for the cleanups!

        Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
