From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 01/10] arm64: dts: qcom: sdm845: Update PIL region
 memory map
Date: Tue, 22 Jan 2019 15:16:49 -0800
Message-ID: <CAD=FV=Ubg2D+1w8AxwYMwFfBZt3ZFf6auPJGDr8+2wE7=DV6Yw@mail.gmail.com>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org> <20190122055112.30943-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122055112.30943-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Jan 21, 2019 at 9:52 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Update existing and add all missing PIL regions to the reserved memory
> map, as described in version 10.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v2:
> - New patch
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 61 ++++++++++++++++++++++++++--
>  1 file changed, 58 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 0ec827394e92..cdcac3704c13 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -89,12 +89,47 @@
>                 };
>
>                 memory@86200000 {
> -                       reg = <0 0x86200000 0 0x2d00000>;
> +                       reg = <0 0x86200000 0 0x100000>;
>                         no-map;
>                 };
>
> -               wlan_msa_mem: memory@96700000 {
> -                       reg = <0 0x96700000 0 0x100000>;
> +               memory@86300000 {
> +                       reg = <0 0x86300000 0 0x4800000>;
> +                       no-map;
> +               };

I know it's not a problem upstream (yet), but downstream this collides
with a memory region in the cheza board.  We have:

rmtfs@88f00000 {
  compatible = "qcom,rmtfs-mem";
  reg = <0x0 0x88f00000 0x0 0x800000>;
  no-map;

  qcom,client-id = <1>;
};

...and the above region overlays it since it goes till 0x8ab00000


> +
> +               memory@8ab00000 {
> +                       reg = <0 0x8ab00000 0 0x1400000>;
> +                       no-map;
> +               };
> +
> +               memory@8bf00000 {
> +                       reg = <0 0x8bf00000 0 0x500000>;
> +                       no-map;
> +               };
> +
> +               ipa_fw_mem: memory@8c400000 {
> +                       reg = <0 0x8c400000 0 0x10000>;
> +                       no-map;
> +               };
> +
> +               ipa_gsi_mem: memory@8c410000 {
> +                       reg = <0 0x8c410000 0 0x5000>;
> +                       no-map;
> +               };
> +
> +               memory@8c415000 {
> +                       reg = <0 0x8c415000 0 0x2000>;
> +                       no-map;
> +               };
> +
> +               adsp_mem: memory@8c500000 {
> +                       reg = <0 0x8c500000 0 0x1a00000>;
> +                       no-map;
> +               };
> +
> +               wlan_msa_mem: memory@8df00000 {

Your patch moves 'wlan_msa_mem' from 0x96700000 to 0x8df00000.  Is
that OK?  I haven't been involved in all of the previous discussions
but if everything is all OK w/ the device tree just moving this chunk
around (without any other coordination w/ firmware) it seems really
weird that we even need to specify it in the device tree.  ...but
maybe I shouldn't open this can of worms.  You can pretend I didn't
say anything.

-Doug
