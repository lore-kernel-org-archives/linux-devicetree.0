From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2] gpio: Driver for SYSCON-based GPIOs
Date: Fri, 3 Jan 2014 19:42:59 +0900
Message-ID: <CAAVeFuKNhtyX1wKFKhjFg5yniewag3XYRFPCNiZ9Q7iLzZ+Jpg@mail.gmail.com>
References: <1387307984-7693-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1387307984-7693-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 18, 2013 at 4:19 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
> SYSCON driver was designed for using memory areas (registers)
> that are used in several subsystems. There are systems (CPUs)
> which use bits in one register for various purposes and thus
> should be handled by various kernel subsystems. This driver
> allows you to use the individual SYSCON bits as GPIOs.
> ARM CLPS711X SYSFLG1 input lines has been added as first user
> of this driver.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Looks good to me.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
