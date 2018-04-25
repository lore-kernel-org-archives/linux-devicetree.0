From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/7] dt-bindings: add generic gnss binding
Date: Wed, 25 Apr 2018 13:26:39 -0500
Message-ID: <CAL_Jsq+schVAhTcK1DJgLuk42c23Ti4jsefkO_whyg7CeoOwHQ@mail.gmail.com>
References: <20180424163458.11947-1-johan@kernel.org> <20180424163458.11947-3-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424163458.11947-3-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 24, 2018 at 11:34 AM, Johan Hovold <johan@kernel.org> wrote:
> Describe generic properties for GNSS receivers.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  .../devicetree/bindings/gnss/gnss.txt         | 36 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gnss/gnss.txt

Reviewed-by: Rob Herring <robh@kernel.org>
