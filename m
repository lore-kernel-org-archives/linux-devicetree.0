From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] arm: dts: Add support for National Instruments
 Project Sulfur SDRs
Date: Mon, 25 Sep 2017 10:19:44 +0200
Message-ID: <314acb1f-1f0f-7893-70a8-9379c01112ac@xilinx.com>
References: <20170911232223.91894-1-mdf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170911232223.91894-1-mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Moritz

sorry for delay.

On 12.9.2017 01:22, Moritz Fischer wrote:
> Add support for the National Instruments Project Sulfur SDR
> motherboards Rev 2,3 and 4.
> 
> Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                |   3 +
>  arch/arm/boot/dts/zynq-ni-sulfur-rev2.dts |  84 +++++++++++++++++++
>  arch/arm/boot/dts/zynq-ni-sulfur-rev3.dts | 118 ++++++++++++++++++++++++++
>  arch/arm/boot/dts/zynq-ni-sulfur-rev4.dts |  26 ++++++
>  arch/arm/boot/dts/zynq-ni-sulfur.dtsi     | 133 ++++++++++++++++++++++++++++++
>  5 files changed, 364 insertions(+)
>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev2.dts
>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev3.dts
>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev4.dts
>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur.dtsi

Is this publicly available board?

I am not quite sure we should apply these dts files. There are a lot of
boards with zynq and there must be any strong argument for applying this
to the tree. For arm32 with even flat tree structure.

Arnd: Do you have any policy about it?

Thanks,
Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
