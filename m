From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of_i2c: I2C child node 10-bit client addressing
Date: Thu, 15 Nov 2012 16:53:59 +0000
Message-ID: <CACxGe6uSWy0-qZ3qYk5kfZzkxuyeZn0HMuzz+UU=6bGtGds1Hw@mail.gmail.com>
References: <1352972157-21299-1-git-send-email-bharat_404@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1352972157-21299-1-git-send-email-bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 15, 2012 at 9:35 AM,  <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
> From: Bharat Kumar Reddy <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
>
> I2C clients which has 10 bit address, struct i2c_board_info,
> member "flags = I2C_CLIENT_TEN" is needed.
>
> Signed-off-by: Bharat Kumar Reddy <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>

Did you see my questions from yesterday?

g.

>
> diff --git a/drivers/of/of_i2c.c b/drivers/of/of_i2c.c
> index 3550f3b..28c5566 100644
> --- a/drivers/of/of_i2c.c
> +++ b/drivers/of/of_i2c.c
> @@ -57,6 +57,10 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>                         continue;
>                 }
>
> +               /* Support for i2c 10 bit client address */
> +               if ((info.addr > (1 << 7) - 1) && (info.addr <= (1 << 10) - 1))
> +                       info.flags = I2C_CLIENT_TEN;
> +
>                 info.irq = irq_of_parse_and_map(node, 0);
>                 info.of_node = of_node_get(node);
>                 info.archdata = &dev_ad;
> --
> 1.7.6
>
>



-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
