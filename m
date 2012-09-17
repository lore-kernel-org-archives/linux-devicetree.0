From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v3 4/5] dt/s3c64xx/spi: Use of_get_child_by_name to get
 a named child.
Date: Mon, 17 Sep 2012 12:35:42 +0100
Message-ID: <50570B0E.8050809@st.com>
References: <1347872282-3776-1-git-send-email-srinivas.kandagatla@st.com>
 <051101cd94c5$bcd3d5c0$367b8140$%kim@samsung.com>
Reply-To: srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <051101cd94c5$bcd3d5c0$367b8140$%kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org




On 17/09/12 12:15, Kukjin Kim wrote:
> Srinivas KANDAGATLA wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
>>
>> As follow-up to "dt: introduce of_get_child_by_name to get child node by
>> name." patch, This patch removes some of the code duplication in the
>> driver by replacing it with of_get_child_by_name instead.
>>
> Cc'ed Mark Brown who is handling spi now.
>
> Would be helpful if you could Cc the first patch "dt: introduce
> of_get_child_by_name..." in this series to us.

I think added you guys in the cover-letter but I missed on the first patch.
Here is the link to first-patch:

http://www.mail-archive.com/devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org/msg18657.html


> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
>> ---
>>  drivers/spi/spi-s3c64xx.c |    7 ++++---
>>  1 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
>> index d1c8441..f226f33 100644
>> --- a/drivers/spi/spi-s3c64xx.c
>> +++ b/drivers/spi/spi-s3c64xx.c
>> @@ -835,9 +835,7 @@ static struct s3c64xx_spi_csinfo
>> *s3c64xx_get_slave_ctrldata(
>>  		return ERR_PTR(-EINVAL);
>>  	}
>>
>> -	for_each_child_of_node(slave_np, data_np)
>> -		if (!strcmp(data_np->name, "controller-data"))
>> -			break;
>> +	data_np = of_get_child_by_name(slave_np, "controller-data");
>>  	if (!data_np) {
>>  		dev_err(&spi->dev, "child node 'controller-data' not
>> found\n");
>>  		return ERR_PTR(-EINVAL);
>> @@ -847,6 +845,7 @@ static struct s3c64xx_spi_csinfo
>> *s3c64xx_get_slave_ctrldata(
>>  	if (!cs) {
>>  		dev_err(&spi->dev, "could not allocate memory for
>> controller"
>>  					" data\n");
>> +		of_node_put(data_np);
>>  		return ERR_PTR(-ENOMEM);
>>  	}
>>
>> @@ -855,11 +854,13 @@ static struct s3c64xx_spi_csinfo
>> *s3c64xx_get_slave_ctrldata(
>>  		dev_err(&spi->dev, "chip select gpio is not specified or "
>>  					"invalid\n");
>>  		kfree(cs);
>> +		of_node_put(data_np);
>>  		return ERR_PTR(-EINVAL);
>>  	}
>>
>>  	of_property_read_u32(data_np, "samsung,spi-feedback-delay",
>> &fb_delay);
>>  	cs->fb_delay = fb_delay;
>> +	of_node_put(data_np);
>>  	return cs;
>>  }
>>
>> --
>> 1.7.0.4
>
>
