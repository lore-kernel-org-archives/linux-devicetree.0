From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH] dt-bindings: Add vendor prefix for feiyang
Date: Tue, 26 Feb 2019 11:41:27 +0530
Message-ID: <CAMty3ZCdYiWPstFh8JAwLSWwC6sE3Un+-QmKDaEWwmmWF5MQ4g@mail.gmail.com>
References: <20190212115232.4532-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212115232.4532-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Feb 12, 2019 at 5:22 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Add vendor prefix for feiyang, known as
> Shenzhen Fly Young Technology Co.,LTD. a known producer for LCD modules.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Note: notation about using 'feiyang' is based on the datasheet
> http://files.pine64.org/doc/datasheet/pine64/FY07024DI26A30-D_feiyang_LCD_panel.pdf
>
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index a5ad57eaee20..f42e12eb9d64 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -140,6 +140,7 @@ fairphone   Fairphone B.V.
>  faraday        Faraday Technology Corporation
>  fastrax        Fastrax Oy
>  fcs    Fairchild Semiconductor
> +feiyang        Shenzhen Fly Young Technology Co.,LTD.
>  firefly        Firefly
>  focaltech      FocalTech Systems Co.,Ltd
>  friendlyarm    Guangzhou FriendlyARM Computer Tech Co., Ltd
> --
> 2.18.0.321.gffc6fa0e3
>

Any comments?
