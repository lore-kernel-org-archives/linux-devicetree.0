From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 4/4] media: platform: Add Aspeed Video Engine driver
Date: Wed, 29 Aug 2018 21:52:57 -0300
Message-ID: <CAAEAJfBpmFPLTMAr+Azc-53JXHPkCU4bjtwqE6nDWUvm=J_x-A@mail.gmail.com>
References: <1535576973-8067-1-git-send-email-eajames@linux.vnet.ibm.com> <1535576973-8067-5-git-send-email-eajames@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535576973-8067-5-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-media <linux-media@vger.kernel.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, andrew@aj.id.au, Mauro Carvalho Chehab <mchehab@kernel.org>, joel@jms.id.au, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Eddie,

On 29 August 2018 at 18:09, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> The Video Engine (VE) embedded in the Aspeed AST2400 and AST2500 SOCs
> can capture and compress video data from digital or analog sources. With
> the Aspeed chip acting a service processor, the Video Engine can capture
> the host processor graphics output.
>
> Add a V4L2 driver to capture video data and compress it to JPEG images,
> making the data available through a standard read interface.
>
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>  drivers/media/platform/Kconfig        |    8 +
>  drivers/media/platform/Makefile       |    1 +
>  drivers/media/platform/aspeed-video.c | 1307 +++++++++++++++++++++++++++++++++
>  3 files changed, 1316 insertions(+)
>  create mode 100644 drivers/media/platform/aspeed-video.c
>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 94c1fe0..e599245 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -32,6 +32,14 @@ source "drivers/media/platform/davinci/Kconfig"
>
>  source "drivers/media/platform/omap/Kconfig"
>
> +config VIDEO_ASPEED
> +       tristate "Aspeed AST2400 and AST2500 Video Engine driver"
> +       depends on VIDEO_V4L2

It seems you are not using videobuf2. I think it should simplify the read
I/O part and at the same time expose the other capture methods.

There are plenty of examples to follow.

Regards,
Eze
