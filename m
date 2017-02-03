From: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2] ARM: dts: Add EMAC AXI settings for Arria10
Date: Thu, 2 Feb 2017 21:46:19 -0600
Message-ID: <CADhT+wfgyU6eJmea-Eu-t1949Ev35wuWT57zr8UUsR6OyGcp6w@mail.gmail.com>
References: <1486073121-3364-1-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486073121-3364-1-git-send-email-thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, dinh.nguyen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 2, 2017 at 4:05 PM,  <thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> From: Thor Thayer <thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>
> Add the device tree entries needed to support the EMAC AXI
> bus settings on the Arria10 SoCFPGA chip.
>
> Signed-off-by: Thor Thayer <thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
> v2 Add the AXI configuration to the other DW EMACs in the chip.
> ---
>  arch/arm/boot/dts/socfpga_arria10.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>

Applied!

Thanks,
Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
