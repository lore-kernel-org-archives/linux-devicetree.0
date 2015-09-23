From: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCHv3] arm64: dts: Add base stratix 10 dtsi
Date: Wed, 23 Sep 2015 14:30:33 -0500
Message-ID: <CADhT+wf91qp=bGPk5kZj=_QP6qKeBmx1UJda_4+u3av7uO+m7A@mail.gmail.com>
References: <1442353625-4552-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442353625-4552-1-git-send-email-dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 15, 2015 at 4:47 PM,  <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>
> Add the base DTS for Altera's SoCFPGA Stratix 10 platform.
>
> Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
> v3: change #address-cells and #size-cells to <2>
>     change the GIC address to 0xfffc1000
>     update the GIC virtual CPU reg length to 0x2000
> v2: use interrupt-affinity for pmu node
> ---
>  arch/arm64/Kconfig.platforms                       |   5 +
>  arch/arm64/boot/dts/Makefile                       |   1 +
>  arch/arm64/boot/dts/altera/Makefile                |   5 +
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  | 357 +++++++++++++++++++++
>  .../boot/dts/altera/socfpga_stratix10_socdk.dts    |  39 +++
>  arch/arm64/configs/defconfig                       |   1 +
>  6 files changed, 408 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/altera/Makefile
>  create mode 100644 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>  create mode 100644 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
>

Gentle ping?

Thanks,
Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
