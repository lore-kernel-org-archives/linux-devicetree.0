From: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] mtd: hisilicon: add a new NAND controller driver
 for hisilicon hip04 Soc
Date: Sat, 25 Oct 2014 11:30:19 +0800
Message-ID: <544B194B.1090409@gmail.com>
References: <1414073085-19296-1-git-send-email-wangzhou.bry@gmail.com> <1414073085-19296-2-git-send-email-wangzhou.bry@gmail.com> <CAN1soZz8NYxppaY4cXadqynERZ=6ZRAynDtptGAps+yUJZ0Qsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAN1soZz8NYxppaY4cXadqynERZ=6ZRAynDtptGAps+yUJZ0Qsw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, "xuwei (O)" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014=E5=B9=B410=E6=9C=8824=E6=97=A5 19:46, Haojian Zhuang wrote:
> On Thu, Oct 23, 2014 at 10:04 PM, Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>> Signed-off-by: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   drivers/mtd/nand/Kconfig        |    5 +
>>   drivers/mtd/nand/Makefile       |    1 +
>>   drivers/mtd/nand/hisi504_nand.c |  836 +++++++++++++++++++++++++++=
++++++++++++
>>   3 files changed, 842 insertions(+)
>>   create mode 100644 drivers/mtd/nand/hisi504_nand.c
>>
>
> I think that you need to run scripts/checkpatch.pl. There're some
> warnings reported on this patch.
>
Hi Haojian,

I will run the checkpatch.pl again and fix the warnings.
But for lines like this:
+	if (host->command =3D=3D NAND_CMD_ERASE1)
+		host->addr_value[0] |=3D ((page_addr >>16) & 0xff) << 16;
+	else
+		host->addr_value[1] |=3D ((page_addr >> 16) & 0xff);
Only over 80 for some characters in one line, it will report a warning.
Can I just leave the warning there for the tidy of the code?

>> +
>> +       case NAND_CMD_SEQIN:
>> +               host->offset =3D column;
>> +
>
> It's better not using waterfall style. Maybe you can write it clearly=
=2E
>              case NAND_CMD_SEQIN:
>                      host->offset =3D column;
>                      set_addr(mtd, column, page_addr);
>                      break;
Thanks, I will modify the code like this above.
>
>> +       chip->ecc.mode =3D of_get_nand_ecc_mode(np);
>> +       /* read ecc-bits from dts */
>> +       of_property_read_u32(np, "hisi,nand-ecc-bits", &host->ecc_bi=
ts);
>
> Do you need to check the ecc_bits at here? Maybe user inputed the
> wrong ecc_bits in DTS.
Yes, it is better to check the ecc_bits here, thanks for your reminding=
=2E

Best regards,
Zhou Wang
>
> Best Regards
> Haojian
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
