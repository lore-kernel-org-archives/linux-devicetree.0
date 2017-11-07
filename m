From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v7 2/2] bus: add driver for the Technologic Systems NBUS
Date: Tue, 7 Nov 2017 16:29:23 +0100
Message-ID: <CAK8P3a038nZTDVKQHahNyZL-n0DMc_fjPje8vpoXEuV244i=8Q@mail.gmail.com>
References: <20171101171433.14445-1-sebastien.bourdelin@savoirfairelinux.com> <20171101171433.14445-2-sebastien.bourdelin@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171101171433.14445-2-sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, mark-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, kris-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 1, 2017 at 6:14 PM, Sebastien Bourdelin
<sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org> wrote:
> This driver implements a GPIOs bit-banged bus, called the NBUS by
> Technologic Systems. It is used to communicate with the peripherals in
> the FPGA on the TS-4600 SoM.
>
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied to next/drivers, thanks!

        Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
