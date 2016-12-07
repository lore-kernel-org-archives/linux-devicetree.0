From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/3] fpga manager: Add cyclone-ps-spi driver for Altera
 FPGAs
Date: Wed, 7 Dec 2016 13:29:29 -0800
Message-ID: <6e33619c-e8a4-e372-04ab-d03c379cbfa0@gmail.com>
References: <cover.1481139171.git.stillcompiling@gmail.com>
 <1778a82d1989d13919b24e47fa09eeb56b2cb8e5.1481139171.git.stillcompiling@gmail.com>
 <20161207222127.23f6b8b4@crub>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161207222127.23f6b8b4@crub>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Anatolij,
Thanks for the quick look and response.
I guess I should have rebased before submitting.
I just realized I also forgot to send this patch series to
the newly minted FPGA Manager mailing list. V6 coming soon :)

On 12/07/2016 01:21 PM, Anatolij Gustschin wrote:
> On Wed,  7 Dec 2016 13:04:40 -0800
> Joshua Clayton stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> ...
>> +static int cyclonespi_write_init(struct fpga_manager *mgr, u32 flags,
>> +				 const char *buf, size_t count)
> there is a minor API change in linux-next [1]. struct fpga_image_info *
> is passed instead of u32 flags. I assume this will be merged soon, so
> please prepare this driver accordingly.
>
> ...
Ah. Thanks.

>> +static int cyclonespi_write_complete(struct fpga_manager *mgr, u32 flags)
> same here.
OK.
>
> [1] http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/fpga?id=1df2865f8dd9d56cb76aa7aa1298921e7bece2af
>
> --
> Anatolij
Joshua
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
