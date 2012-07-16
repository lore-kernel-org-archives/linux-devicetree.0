From: "AnilKumar, Chimata" <anilkumar-l0cyMroinI0@public.gmane.org>
Subject: RE: regulator: tps65217: Add device tree support
Date: Mon, 16 Jul 2012 11:07:44 +0000
Message-ID: <331ABD5ECB02734CA317220B2BBEABC13E9F6F8A@DBDE01.ent.ti.com>
References: <20120713090220.GA18561@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120713090220.GA18561-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
Content-Language: en-US
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
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+cc Mark

Hi Dan,

Thanks for checking the static code warnings.

On Fri, Jul 13, 2012 at 14:32:20, Dan Carpenter wrote:
> Hello AnilKumar Ch,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch a7f1b63eb856: "regulator: tps65217: Add device tree 
> support" from Jul 10, 2012, leads to the following Smatch complaint:
> 
> drivers/mfd/tps65217.c:245 tps65217_probe()
> 	 error: we previously assumed 'pdata' could be null (see line 205)
> 
> drivers/mfd/tps65217.c
>    204	
>    205		if (!pdata && client->dev.of_node)
>                     ^^^^^^
> New check.

!pdata in the above if condition is not required if we do a separate check for
"pdata == NULL". So removing pdata check from this and adding a separate
check for NULL pointer.

> 
>    206			pdata = tps65217_parse_dt(client);

Above two lines will be replaced with these lines

			if (client->dev.of_node)
				pdata = tps65217_parse_dt(client);

			if (!pdata) {
				dev_err(&client->dev, "tps65217 requires platform data\n");
				return -EINVAL;
			}

I will submit a separate patch for this.

Thanks
AnilKumar
