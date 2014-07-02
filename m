From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Documentation: Document Hisilicon hix5hd2 sata
 PHY
Date: Wed, 2 Jul 2014 16:50:02 +0530
Message-ID: <53B3EAE2.4040101@ti.com>
References: <1403687648-29082-1-git-send-email-zhangfei.gao@linaro.org> <1403687648-29082-2-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403687648-29082-2-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wednesday 25 June 2014 02:44 PM, Zhangfei Gao wrote:
> From: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> 
> Add necessary binding documentation SATA PHY on Hisilicon hix5hd2 soc.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/phy/hix5hd2-sata-phy.txt   |   22 ++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/hix5hd2-sata-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/hix5hd2-sata-phy.txt b/Documentation/devicetree/bindings/phy/hix5hd2-sata-phy.txt
> new file mode 100644
> index 0000000..296168b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/hix5hd2-sata-phy.txt

Generally we have a single file for a SoC while adding phy binding
documentation. So just make it hix5hd2-phy.txt.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
