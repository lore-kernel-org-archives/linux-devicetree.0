From: Zhou Wang <wangzhou.bry@gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: hisilicon: add a new NAND controller driver
 for hisilicon hip04 Soc
Date: Thu, 30 Oct 2014 10:28:25 +0800
Message-ID: <5451A249.3040909@gmail.com>
References: <1414493629-12570-1-git-send-email-wangzhou.bry@gmail.com> <1414493629-12570-2-git-send-email-wangzhou.bry@gmail.com> <CAH6sp9MuL+AAvMi1VrmOhq5Y-ri2DKO3g0h1hw040h5=CRu6UQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAH6sp9MuL+AAvMi1VrmOhq5Y-ri2DKO3g0h1hw040h5=CRu6UQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frans Klaver <fransklaver@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, haojian.zhuang@gmail.com, wangzhou1@hisilicon.com, Rob Herring <robh+dt@kernel.org>, xuwei5@hisilicon.com, Kumar Gala <galak@codeaurora.org>, caizhiyong@huawei.com
List-Id: devicetree@vger.kernel.org

On 2014=E5=B9=B410=E6=9C=8828=E6=97=A5 22:22, Frans Klaver wrote:
> On Tue, Oct 28, 2014 at 11:53 AM, Zhou Wang <wangzhou.bry@gmail.com> =
wrote:
>> +
>> +static int hisi_nfc_probe(struct platform_device *pdev)
>> +{
>> +       int ret =3D 0, irq, buswidth, flag, max_chips =3D HINFC504_M=
AX_CHIP;
>> +       struct device *dev =3D &pdev->dev;
>> +       struct hinfc_host *host;
>> +       struct nand_chip  *chip;
>> +       struct mtd_info   *mtd;
>> +       struct resource   *res;
>> +       struct device_node *np =3D dev->of_node;
>> +       struct mtd_part_parser_data ppdata;
>> +
>> +       host =3D devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
>> +       if (!host)
>> +               return -ENOMEM;
>> +       host->dev =3D dev;
>> +
>> +       platform_set_drvdata(pdev, host);
>> +       chip =3D &host->chip;
>> +       mtd  =3D &host->mtd;
>> +
>> +       irq =3D platform_get_irq(pdev, 0);
>> +       if (irq < 0) {
>> +               dev_err(dev, "no IRQ resource defined\n");
>> +               ret =3D -ENXIO;
>> +               goto err_res;
>> +       }
>> +
>> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       host->iobase =3D devm_ioremap_resource(dev, res);
>> +       if (IS_ERR(host->iobase)) {
>> +               ret =3D PTR_ERR(host->iobase);
>> +               dev_err(dev, "devm_ioremap_resource[0] fail\n");
>> +               goto err_res;
>> +       }
>> +
>> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
>> +       chip->IO_ADDR_R =3D chip->IO_ADDR_W =3D devm_ioremap_resourc=
e(dev, res);
>> +       if (IS_ERR(chip->IO_ADDR_R)) {
>> +               ret =3D PTR_ERR(chip->IO_ADDR_R);
>> +               dev_err(dev, "devm_ioremap_resource[1] fail\n");
>> +               goto err_res;
>> +       }
>> +
>> +       mtd->priv               =3D chip;
>> +       mtd->owner              =3D THIS_MODULE;
>> +       mtd->name               =3D "hisi_nand";
>
> + mtd->dev.parent =3D &pdev->dev;
>
> This is a bug that lives in a bunch of other nand drivers as well.
> add_mtd_device (called by mtd_device_parse_register()) expects
> dev.parent to be set for properly adding a device reference to the
> sysfs node.
>
> Frans
>
My mistake, I will add this line. Thanks a lot for your reminding.

Kind regards,
Zhou Wang
