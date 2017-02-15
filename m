From: Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 2/3] fpga manager: Add cyclone-ps-spi driver for Altera FPGAs
Date: Wed, 15 Feb 2017 11:14:14 -0600
Message-ID: <CANk1AXQy1nLjZAEpy0CDpS7GqvL+0y7f7Q5EuOZ1AqjBOPDwEw@mail.gmail.com>
References: <cover.1485295905.git.stillcompiling@gmail.com>
 <94f1d92f502b64669467c467038c3aa766b312ad.1485295905.git.stillcompiling@gmail.com>
 <20170215162641.5bc50cf3@crub>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170215162641.5bc50cf3@crub>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 15, 2017 at 9:26 AM, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org> wrote:
> Hi Joshua,
>
> On Tue, 24 Jan 2017 14:19:33 -0800
> Joshua Clayton stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> ...
>>+static int cyclonespi_write(struct fpga_manager *mgr, const char *buf,
>>+                          size_t count)
>>+{
>>+      struct cyclonespi_conf *conf = (struct cyclonespi_conf *)mgr->priv;
>>+      const char *fw_data = buf;
>>+      const char *fw_data_end = fw_data + count;
>>+
>>+      while (fw_data < fw_data_end) {
>>+              int ret;
>>+              size_t stride = min(fw_data_end - fw_data, SZ_4K);
>>+
>>+              rev_buf(fw_data, stride);
>
> Can we make rev_buf() optional here? I've tested this driver with
> Stratix-V FPGA using orion_spi driver. It works without swapping
> the data.

I replied earlier, but something in my email settings bounced.

The way to make it optional is to add a bit to the flags of the
fpga_image_info struct.

Alan

>
> Thanks,
> Anatolij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
