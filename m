From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] arm64: dts: angler: add pstore-ramoops support
Date: Tue, 2 Jan 2018 10:09:49 -0800
Message-ID: <CAGXu5jJ2YNqbT_n-=K9tYqAc4JDDN+GHDfWbLDQcQxYKawSXuQ@mail.gmail.com>
References: <1514446709-19347-1-git-send-email-zhuoweizhang@yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1514446709-19347-1-git-send-email-zhuoweizhang@yahoo.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zhuoweizhang@yahoo.com
Cc: jeremymc@redhat.com, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 27, 2017 at 11:38 PM,  <zhuoweizhang@yahoo.com> wrote:
> From: Zhuowei Zhang <zhuoweizhang@yahoo.com>
>
> Support pstore-ramoops for retrieving kernel oops and panics after reboot.
>
> The address and configs are taken from the downstream kernel's device tree.
>
> Signed-off-by: Zhuowei Zhang <zhuoweizhang@yahoo.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> index dfa08f5..9ce3a6e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> @@ -37,4 +37,19 @@
>                         pinctrl-1 = <&blsp1_uart2_sleep>;
>                 };
>         };
> +
> +       reserved-memory {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               ramoops@1fe00000 {
> +                       compatible = "ramoops";
> +                       reg = <0 0x1fe00000 0 0x00200000>;
> +                       console-size = <0x100000>;
> +                       record-size = <0x10000>;
> +                       ftrace-size = <0x10000>;
> +                       pmsg-size = <0x80000>;
> +               };
> +       };
>  };
> --
> 1.9.1
>



-- 
Kees Cook
Pixel Security
