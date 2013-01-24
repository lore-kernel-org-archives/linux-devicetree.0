From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PATCH] mtd: physmap_of: fix cmdline partition method w/o
 linux,mtd-name
Date: Thu, 24 Jan 2013 11:05:47 +0200
Message-ID: <20130124090547.GB7697@sapphire.tkos.co.il>
References: <df9da712b775781366ae23aac28ed20849b4e4d3.1356260943.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <df9da712b775781366ae23aac28ed20849b4e4d3.1356260943.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
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
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi linux-mtd, Artem, David,

Ping?

It's been a month, and this is a simple uninitialized pointer dereference bug 
fix.

baruch

On Sun, Dec 23, 2012 at 01:10:50PM +0200, Baruch Siach wrote:
> Commit d68cbdd4fb (mtd: physmap_of: allow to specify the mtd name for retro
> compatiblity) broke cmdline partitioning using dev_name() in the kernel command
> line.  of_property_read_string() does not touch mtd_name when linux,mtd-name is
> not present in the device tree, which causes map.name to be set to a random
> value.  Fix this by initializing mtd_name to NULL.
> 
> Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> ---
>  drivers/mtd/maps/physmap_of.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index 37cdc20..6fb2bd8 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -170,7 +170,7 @@ static int of_flash_probe(struct platform_device *dev)
>  	resource_size_t res_size;
>  	struct mtd_part_parser_data ppdata;
>  	bool map_indirect;
> -	const char *mtd_name;
> +	const char *mtd_name = NULL;
>  
>  	match = of_match_device(of_flash_match, &dev->dev);
>  	if (!match)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.2.679.5364, http://www.tkos.co.il -
