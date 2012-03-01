From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/8] serial: pxa: add OF support
Date: Thu, 1 Mar 2012 09:47:39 +0000
Message-ID: <201203010947.39601.arnd@arndb.de>
References: <1330582228-12424-1-git-send-email-haojian.zhuang@marvell.com>
 <1330582228-12424-3-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1330582228-12424-3-git-send-email-haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 01 March 2012, Haojian Zhuang wrote:
> @@ -792,7 +826,7 @@ static int serial_pxa_probe(struct platform_device *dev)
>         if (!mmres || !irqres)
>                 return -ENODEV;
>  
> -       sport = kzalloc(sizeof(struct uart_pxa_port), GFP_KERNEL);
> +       sport = kzalloc(sizeof(struct uart_pxa_port) + 8, GFP_KERNEL);
>         if (!sport)
>                 return -ENOMEM;
>  
> @@ -808,20 +842,18 @@ static int serial_pxa_probe(struct platform_device *dev)
> +       ret = serial_pxa_probe_dt(dev, sport);
> +       if (ret > 0)
> +               sport->port.line = dev->id;
> +       else if (ret < 0)
> +               goto err_clk;
> +       sport->name = (char *)((unsigned int)sport + 8);
> +       /* name can't exceed 8 bytes */
> +       sprintf(sport->name, "UART%d", sport->port.line + 1);

The pointer arithmetic looks wrong to me, both technically and morally ;-)

Since struct uart_pxa_port is a local data structure, why don't you just
turn the name field into a fixed-length array?

	Arnd
