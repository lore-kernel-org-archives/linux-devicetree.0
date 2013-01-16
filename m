From: Stefan Peter <s.peter-R0yVo0h44Ow@public.gmane.org>
Subject: Re: [PATCH 3/4] Enable ecc-mode selection in the driver
Date: Wed, 16 Jan 2013 12:44:09 +0100
Message-ID: <50F69289.8060401@mpl.ch>
References: <cover.1358242644.git.s.peter@mpl.ch>
 <2d08c4c072fd4922a6056362adb96a455307d583.1358242644.git.s.peter@mpl.ch>
 <20130115123307.GA13433@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130115123307.GA13433-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
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
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: andrew-g2DYL2Zd6BY@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org, nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, wfp5p-4Ng6DfrEGID2fBVCVOL8/A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jason

on 15.01.2013 13:33, Jason Cooper wrote:
> Stefan,
> 
> This is a good-looking patch series, nice and small!  A few comments:
> 
> On Tue, Jan 15, 2013 at 01:13:12PM +0100, Stefan Peter wrote:
>> In order to be able to use the ecc-mode, add the bch module to the default
>> settings for the kirwood boards and enable the activation in orin-nand.c
> 
> s/orin-nand/orion-nand/

Will fix.

> 
>>
>> Signed-off-by: Stefan Peter <s.peter-R0yVo0h44Ow@public.gmane.org>
>> ---
>> diff --git a/arch/arm/configs/kirkwood_defconfig b/arch/arm/configs/kirkwood_defconfig
>> index 93f3794..4a9d3f7 100644
>> --- a/arch/arm/configs/kirkwood_defconfig
>> +++ b/arch/arm/configs/kirkwood_defconfig
>> @@ -84,6 +84,7 @@ CONFIG_MTD_CFI_STAA=y
>>  CONFIG_MTD_PHYSMAP=y
>>  CONFIG_MTD_M25P80=y
>>  CONFIG_MTD_NAND=y
>> +CONFIG_MTD_NAND_ECC_BCH=y
>>  CONFIG_MTD_NAND_ORION=y
>>  CONFIG_BLK_DEV_LOOP=y
>>  # CONFIG_SCSI_PROC_FS is not set
> 
> Please make the defconfig change a separate patch.

Will do.

> 
> As a general note (this series shouldn't be a problem), please sort the
> series so that you add the driver feature first, then enable it in
> defconfig, then use it in DT.  This way, a future bisection won't run
> into any nasty surprises, other than what they're looking for. ;-)

Will do.

Thank you very much for your review.

Stefan Peter
-- 
MPL AG, Switzerland                     http://www.mpl.ch
Tel. +41 (0)56 483 34 34          Fax: +41(0)56 493 30 20
