From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 0/3] auxdisplay: Introduce ht16k33 driver
Date: Thu, 20 Oct 2016 15:36:06 +0200
Message-ID: <CACRpkdZS6-m_jNWKKJOYAV0qWvWw9nPeiivYm5txh65Sh8mD-g@mail.gmail.com>
References: <1475754813-1200-1-git-send-email-robin@protonic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475754813-1200-1-git-send-email-robin@protonic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin van der Gracht <robin@protonic.nl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 6, 2016 at 1:53 PM, Robin van der Gracht <robin@protonic.nl> wrote:

> This patchset adds a new driver to the auxdisplay subsystem. It also adds
> devicetree binding documentation and a new vendor prefix.
>
> I added myself as maintainer to the MAINTAINERS file.
>
> @Greg: Would you like to review and push this upstream?
>
> Robin van der Gracht (3):
>   of: add vendor prefix for Holtek Semiconductor
>   auxdisplay: ht16k33: Driver for LED controller
>   MAINTAINERS: auxdisplay: Added myself as maintainer for ht16k33 driver

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

for the series.

Yours,
Linus Walleij
