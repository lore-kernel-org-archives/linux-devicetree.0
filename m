Return-Path: <SRS0=eEQM=FR=oracle.com=martin.petersen@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: scsi: hisi_sas: add an property of signal attenuation
From: "Martin K. Petersen" <martin.petersen@oracle.com>
References: <1519067611-206638-1-git-send-email-john.garry@huawei.com>
	<1519067611-206638-2-git-send-email-john.garry@huawei.com>
Date: Thu, 22 Feb 2018 20:49:17 -0500
In-Reply-To: <1519067611-206638-2-git-send-email-john.garry@huawei.com> (John
	Garry's message of "Tue, 20 Feb 2018 03:13:24 +0800")
Message-ID: <yq17er4bhlu.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, linuxarm@huawei.com, linux-kernel@vger.kernel.org, Xiaofei Tan <tanxiaofei@huawei.com>
List-ID: <devicetree@vger.kernel.org>


> From: Xiaofei Tan <tanxiaofei@huawei.com>
>
> For some new boards with hip07 chipset we are required to
> set PHY config registers differently. The hw property which
> determines how to set these registers is in the PHY signal
> attenuation readings.
>
> This patch add an devicetree property, signal-attenuation, which
> is used to describe the signal attenuation of an board.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
> Signed-off-by: John Garry <john.garry@huawei.com>
> ---
>  Documentation/devicetree/bindings/scsi/hisilicon-sas.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/scsi/hisilicon-sas.txt b/Documentation/devicetree/bindings/scsi/hisilicon-sas.txt
> index df3bef7..bd32ecd 100644
> --- a/Documentation/devicetree/bindings/scsi/hisilicon-sas.txt
> +++ b/Documentation/devicetree/bindings/scsi/hisilicon-sas.txt
> @@ -53,6 +53,13 @@ Main node required properties:
>  Optional main node properties:
>   - hip06-sas-v2-quirk-amt : when set, indicates that the v2 controller has the
>  			    "am-max-transmissions" limitation.
> + - signal-attenuation : array of 3 32-bit values, containing de-emphasis,
> +		preshoot, and boost attenuation readings for the board. They
> +		are used to describe the signal attenuation of the board. These
> +		values' range is 7600 to 12400, and used to represent -24dB to
> +		24dB.
> +		The formula is "y = (x-10000)/10000". For example, 10478
> +		means 4.78dB.
>  
>  Example:
>  	sas0: sas@c1000000 {

Rob/Mark: Please review!

-- 
Martin K. Petersen	Oracle Linux Engineering
