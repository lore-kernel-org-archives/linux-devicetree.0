From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: question about drivers/pinctrl/pinctrl-at91.c
Date: Tue, 11 Dec 2012 09:51:04 +0100
Message-ID: <CACRpkdY_znNHckam+PsysddCib2PP-6Lk4OM8_v34BX+p4pu-A@mail.gmail.com>
References: <alpine.DEB.2.02.1212081643590.1984@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1212081643590.1984@hadrien>
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
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 8, 2012 at 4:52 PM, Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org> wrote:

> The function at91_dt_node_to_map in drivers/pinctrl/pinctrl-at91.c contains
> the following code:
>
>        new_map = devm_kzalloc(pctldev->dev, sizeof(*new_map) * map_num,
> GFP_KERNEL);
>         if (!new_map)
>                 return -ENOMEM;
>
>         *map = new_map;
>         *num_maps = map_num;
>
>         /* create mux map */
>         parent = of_get_parent(np);
>         if (!parent) {
>                 kfree(new_map);
>                 return -EINVAL;
>         }
>
> This is clearly not correct, because the combination of devm_kzalloc and
> kfree risks creating a double free.

Agreed, probably just some spurious leftover.

> But I am not sure how best to fix it.
> Is the data structure intended to normally exist until the driver's remove
> function is called?  If so, perhaps the devm_kzalloc is OK.  If I just
> remove the kfree, then the structure will persist until the remove function
> is called, even though there was an error, which is perhaps not good.  So I
> could change the kfree to devm_kfree?

I was under the impression that if you exit the probe function
with a negative value anything allocated with devm_* was freed
immediately, that is atleast how it's described in
Documentation/driver-model/devres.txt
atleast that seems to be the intetion with the whole thing.

So just delete the kfree() oneliner.

Yours,
Linus Walleij
