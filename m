From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/3] nvmem: core: Allow allocating several anonymous nvmem
 devices
Date: Fri, 3 Mar 2017 10:08:46 +0000
Message-ID: <4440721f-c66d-c3bf-812b-da4defeeacce@linaro.org>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-4-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1488484223-844-4-git-send-email-albeu@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Alban <albeu@free.fr>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org



On 02/03/17 19:50, Alban wrote:
> Currently the nvmem core expect the config to provide a name and ID
> that are then used to create the device name. When no device name is
> given 'nvmem' is used. However if there is several such anonymous
> devices they all get named 'nvmem0', which doesn't work.
>
> To fix this problem use the ID from the config only when the config
> also provides a name. When no name is provided take the uinque ID of
> the nvmem device instead.
>
> Signed-off-by: Alban <albeu@free.fr>
> ---

Thanks for the Fix, looks good to me, I will queue this up once rc1 is out.


>  drivers/nvmem/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 408b521..8c830a8 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -468,7 +468,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>  	np = config->dev->of_node;
>  	nvmem->dev.of_node = np;
>  	dev_set_name(&nvmem->dev, "%s%d",
> -		     config->name ? : "nvmem", config->id);
> +		     config->name ? : "nvmem",
> +		     config->name ? config->id : nvmem->id);
>
>  	nvmem->read_only = of_property_read_bool(np, "read-only") |
>  			   config->read_only;
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
