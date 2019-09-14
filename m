From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [Patch 3/6] media: dt-bindings: ov2659: add powerdown-gpios
 optional property
Date: Sat, 14 Sep 2019 11:11:02 +0100
Message-ID: <CA+V-a8vo2ddxdDEBefTErsTB43tPAFNy-94xhQN1Yhb64jr_Aw@mail.gmail.com>
References: <20190912130007.4469-1-bparrot@ti.com> <20190912130007.4469-4-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190912130007.4469-4-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Benoit,

Thank you for the patch.

On Thu, Sep 12, 2019 at 1:58 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> Add powerdown-gpios to the list of optional properties for the OV2659
> camera sensor.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov2659.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov2659.txt b/Documentation/devicetree/bindings/media/i2c/ov2659.txt
> index cabc7d827dfb..f55204cce0cd 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov2659.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/ov2659.txt
> @@ -12,6 +12,10 @@ Required Properties:
>  - clock-names: should be "xvclk".
>  - link-frequencies: target pixel clock frequency.
>
> +Optional Properties:
> +- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if any.
> +  Active is low.
> +
as per the datasheet this should be active high with  pull-down resistor.

Cheers,
--Prabhakar Lad
