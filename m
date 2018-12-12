From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v12 2/3] dt-bindings: pps: pps-gpio PPS ECHO implementation
Date: Wed, 12 Dec 2018 08:01:52 -0600
Message-ID: <CAL_Jsq+YBGqTA0ffvCE5DPwwf2bFsATgb80W-h4ehs3jzEsChA@mail.gmail.com>
References: <20181212025214.29911-1-tom@aussec.com> <20181212025214.29911-2-tom@aussec.com>
 <20181212025214.29911-3-tom@aussec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212025214.29911-3-tom@aussec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tom Burkart <tom@aussec.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, lukas@fridolin.com
List-Id: devicetree@vger.kernel.org

On Tue, Dec 11, 2018 at 8:53 PM Tom Burkart <tom@aussec.com> wrote:
>
> This patch implements the device tree changes required for the pps
> echo functionality for pps-gpio, that sysfs claims is available
> already.
>
> This patch was originally written by Lukas Senger as part of a masters
> thesis project and modified for inclusion into the linux kernel by Tom
> Burkart.
>
> Signed-off-by: Lukas Senger <lukas@fridolin.com>
> Signed-off-by: Tom Burkart <tom@aussec.com>
> ---
>  Documentation/devicetree/bindings/pps/pps-gpio.txt | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
