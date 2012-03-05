From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/7] serial: pxa: add OF support
Date: Mon, 5 Mar 2012 22:03:49 +0800
Message-ID: <CAN1soZwHr50+F7-hO=U24U=zrv9C7gxnhzSYgrziaeMYuqRVXA@mail.gmail.com>
References: <1330950111-30797-1-git-send-email-haojian.zhuang@marvell.com>
 <1330950111-30797-2-git-send-email-haojian.zhuang@marvell.com>
 <201203051255.37311.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201203051255.37311.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 5, 2012 at 8:55 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 05 March 2012, Haojian Zhuang wrote:
>
>>
>> +#define PXA_NAME_LEN =A0 =A0 =A0 =A0 8
>> +
>> =A0struct uart_pxa_port {
>> =A0 =A0 =A0 struct uart_port =A0 =A0 =A0 =A0port;
>> =A0 =A0 =A0 unsigned char =A0 =A0 =A0 =A0 =A0 ier;
>
> Why didn't you just add a field here with that length?
>
>> @@ -781,6 +784,39 @@ static const struct dev_pm_ops serial_pxa_pm_ops =
=3D {
>> =A0};
>> =A0#endif
>>
>> +static struct of_device_id serial_pxa_dt_ids[] =3D {
>> + =A0 =A0 { .compatible =3D "mrvl,pxa-uart", },
>> + =A0 =A0 { .compatible =3D "mrvl,mmp-uart", },
>> + =A0 =A0 {}
>> +};
>> +MODULE_DEVICE_TABLE(of, serial_pxa_dt_ids);
>
> This one should have an #ifdef CONFIG_OF
>
>> +#ifdef CONFIG_OF
>> +static int serial_pxa_probe_dt(struct platform_device *pdev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct uart_pxa=
_port *sport)
>> +{
>
> While this one does not need it: it will already compile to nothing
> if you check the error value correctly.
>
>> + =A0 =A0 sport->name =3D kzalloc(PXA_NAME_LEN, GFP_KERNEL);
>> + =A0 =A0 if (!sport->name) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto err_clk;
>> =A0 =A0 =A0 }
>
> No need for this allocation if you put the name into uart_pxa_port
> as a member instead of a pointer.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D serial_pxa_dt_ids,
>> =A0 =A0 =A0 },
>> =A0};
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.of_match_table =3D of_match_ptr(serial_px=
a_dt_ids),
>
> =A0 =A0 =A0 =A0Arnd
>
Thanks. I'll update it.

Best Regards
Haojian
