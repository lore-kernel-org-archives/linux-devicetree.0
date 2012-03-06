From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/7] serial: pxa: add OF support
Date: Tue, 6 Mar 2012 23:04:40 +0800
Message-ID: <CAN1soZwatL=O6iTVaOn+seHPrLH1r1yhvDKM=YCjzuprcbAvOw@mail.gmail.com>
References: <201203051255.37311.arnd@arndb.de>
 <1331001730-13429-1-git-send-email-haojian.zhuang@marvell.com>
 <201203061502.08097.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201203061502.08097.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 6, 2012 at 11:02 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 06 March 2012, Haojian Zhuang wrote:
>
>> @@ -51,7 +54,7 @@ struct uart_pxa_port {
>> =A0 =A0 =A0 unsigned char =A0 =A0 =A0 =A0 =A0 mcr;
>> =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0lsr_break_flag;
>> =A0 =A0 =A0 struct clk =A0 =A0 =A0 =A0 =A0 =A0 =A0*clk;
>> - =A0 =A0 char =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*name;
>> + =A0 =A0 char =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0name[PXA_NAME_LEN];
>> =A0};
>
> This looks better now
>
>> =A0static inline unsigned int serial_in(struct uart_pxa_port *up, int of=
fset)
>> @@ -781,6 +784,33 @@ static const struct dev_pm_ops serial_pxa_pm_ops =
=3D {
>> =A0};
>> =A0#endif
>>
>> +#ifdef CONFIG_OF
>> +static struct of_device_id serial_pxa_dt_ids[] =3D {
>> + =A0 =A0 { .compatible =3D "mrvl,pxa-uart", },
>> + =A0 =A0 { .compatible =3D "mrvl,mmp-uart", },
>> + =A0 =A0 {}
>> +};
>> +MODULE_DEVICE_TABLE(of, serial_pxa_dt_ids);
>> +#endif
>
> If you do this, you have to use of_match_ptr for referencing
> serial_pxa_dt_ids or you will get a link error when CONFIG_OF is
> disabled.
>
>> @@ -850,6 +876,7 @@ static int serial_pxa_remove(struct platform_device =
*dev)
>> =A0 =A0 =A0 platform_set_drvdata(dev, NULL);
>>
>> =A0 =A0 =A0 uart_remove_one_port(&serial_pxa_reg, &sport->port);
>> + =A0 =A0 kfree(sport->name);
>> =A0 =A0 =A0 clk_put(sport->clk);
>> =A0 =A0 =A0 kfree(sport);
>>
>
> And this must be removed now that sport->name is allocated as part of spo=
rt.
>
> =A0 =A0 =A0 =A0Arnd
>
Ah. It's a bug. I'll fix it tomorrow.

Thanks
Haojian
