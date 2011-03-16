From: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 3/5] serial/imx: parse from device tree support
Date: Wed, 16 Mar 2011 11:35:25 +0800
Message-ID: <AANLkTine9PS7=0kXrkR5=MGg0DhUO2K+_nYDAbJNEqmE@mail.gmail.com>
References: <1299733185-2172-1-git-send-email-jason.hui@linaro.org>
	<1299733185-2172-4-git-send-email-jason.hui@linaro.org>
	<20110315070709.GC23050@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110315070709.GC23050-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Grant,

On Tue, Mar 15, 2011 at 3:07 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> Minor comments, but otherwise goes first.
>
> On Thu, Mar 10, 2011 at 12:59:43PM +0800, Jason Liu wrote:
>> Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Signed-off-by: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
>
> Jeremy's s-o-b should go at the top of the list. =A0He started it, and
> then you took over. =A0s-o-b lines is the chain of people who have
> handled a patch, and so it should reflect the order that they handled
> it.

OK, get it.

>
>> ---
>> =A0drivers/tty/serial/imx.c | =A0 79 +++++++++++++++++++++++++++++++++++=
+++++------
>> =A01 files changed, 69 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
>> index dfcf4b1..c9483d1 100644
>> --- a/drivers/tty/serial/imx.c
>> +++ b/drivers/tty/serial/imx.c
>> @@ -53,6 +53,9 @@
>> =A0#include <mach/hardware.h>
>> =A0#include <mach/imx-uart.h>
>>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +
>
> These should be mixed in with the rest of the <linux/*.h> includes.

OK,

>
>> =A0/* Register definitions */
>> =A0#define URXD0 0x0 =A0/* Receiver Register */
>> =A0#define URTX0 0x40 /* Transmitter Register */
>> @@ -1224,6 +1227,53 @@ static int serial_imx_resume(struct platform_devi=
ce *dev)
>> =A0 =A0 =A0 return 0;
>> =A0}
>>
>> +#ifdef CONFIG_OF
>> +static int serial_imx_probe_dt(struct imx_port *sport,
>> + =A0 =A0 =A0 =A0 =A0 =A0 struct platform_device *pdev)
>> +{
>> + =A0 =A0 struct device_node *node =3D pdev->dev.of_node;
>> + =A0 =A0 static int line;
>> +
>> + =A0 =A0 if (!node)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> +
>> + =A0 =A0 if (of_get_property(node, "fsl,has-rts-cts", NULL))
>> + =A0 =A0 =A0 =A0 =A0 =A0 sport->have_rtscts =3D 1;
>> +
>> + =A0 =A0 if (of_get_property(node, "fsl,irda-mode", NULL))
>> + =A0 =A0 =A0 =A0 =A0 =A0 sport->use_irda =3D 1;
>> +
>> + =A0 =A0 sport->port.line =3D line++;
>> +
>> + =A0 =A0 return 0;
>> +}
>> +#else
>> +static int serial_imx_probe_dt(struct imx_port *sport,
>> + =A0 =A0 =A0 =A0 =A0 =A0 struct platform_device *pdev)
>> +{
>> + =A0 =A0 return -ENODEV;
>> +}
>> +#endif
>> +
>> +static int serial_imx_probe_pdata(struct imx_port *sport,
>> + =A0 =A0 =A0 =A0 =A0 =A0 struct platform_device *pdev)
>> +{
>> + =A0 =A0 struct imxuart_platform_data *pdata =3D pdev->dev.platform_dat=
a;
>> +
>> + =A0 =A0 if (!pdata)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> +
>> + =A0 =A0 if (pdata->flags & IMXUART_HAVE_RTSCTS)
>> + =A0 =A0 =A0 =A0 =A0 =A0 sport->have_rtscts =3D 1;
>> +
>> +#ifdef CONFIG_IRDA
>> + =A0 =A0 if (pdata->flags & IMXUART_IRDA)
>> + =A0 =A0 =A0 =A0 =A0 =A0 sport->use_irda =3D 1;
>> +#endif
>> + =A0 =A0 sport->port.line =3D pdev->id;
>> +
>> + =A0 =A0 return 0;
>> +}
>> =A0static int serial_imx_probe(struct platform_device *pdev)
>> =A0{
>> =A0 =A0 =A0 struct imx_port *sport;
>> @@ -1236,6 +1286,12 @@ static int serial_imx_probe(struct platform_devic=
e *pdev)
>> =A0 =A0 =A0 if (!sport)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>>
>> + =A0 =A0 ret =3D serial_imx_probe_dt(sport, pdev);
>> + =A0 =A0 if (ret =3D=3D -ENODEV)
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D serial_imx_probe_pdata(sport, pdev);
>> + =A0 =A0 if (ret)
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto free;
>> +
>> =A0 =A0 =A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> =A0 =A0 =A0 if (!res) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;
>> @@ -1260,7 +1316,6 @@ static int serial_imx_probe(struct platform_device=
 *pdev)
>> =A0 =A0 =A0 sport->port.fifosize =3D 32;
>> =A0 =A0 =A0 sport->port.ops =3D &imx_pops;
>> =A0 =A0 =A0 sport->port.flags =3D UPF_BOOT_AUTOCONF;
>> - =A0 =A0 sport->port.line =3D pdev->id;
>> =A0 =A0 =A0 init_timer(&sport->timer);
>> =A0 =A0 =A0 sport->timer.function =3D imx_timeout;
>> =A0 =A0 =A0 sport->timer.data =A0 =A0 =3D (unsigned long)sport;
>> @@ -1274,17 +1329,13 @@ static int serial_imx_probe(struct platform_devi=
ce *pdev)
>>
>> =A0 =A0 =A0 sport->port.uartclk =3D clk_get_rate(sport->clk);
>>
>> - =A0 =A0 imx_ports[pdev->id] =3D sport;
>> + =A0 =A0 if (imx_ports[sport->port.line]) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EBUSY;
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto clkput;
>> + =A0 =A0 }
>> + =A0 =A0 imx_ports[sport->port.line] =3D sport;
>>
>> =A0 =A0 =A0 pdata =3D pdev->dev.platform_data;
>> - =A0 =A0 if (pdata && (pdata->flags & IMXUART_HAVE_RTSCTS))
>> - =A0 =A0 =A0 =A0 =A0 =A0 sport->have_rtscts =3D 1;
>> -
>> -#ifdef CONFIG_IRDA
>> - =A0 =A0 if (pdata && (pdata->flags & IMXUART_IRDA))
>> - =A0 =A0 =A0 =A0 =A0 =A0 sport->use_irda =3D 1;
>> -#endif
>> -
>> =A0 =A0 =A0 if (pdata && pdata->init) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D pdata->init(pdev);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
>> @@ -1336,6 +1387,11 @@ static int serial_imx_remove(struct platform_devi=
ce *pdev)
>> =A0 =A0 =A0 return 0;
>> =A0}
>>
>> +static struct of_device_id imx_uart_matches[] =3D {
>> + =A0 =A0 { .compatible =3D "fsl,imx51-uart" },
>> + =A0 =A0 {},
>> +};
>> +
>> =A0static struct platform_driver serial_imx_driver =3D {
>> =A0 =A0 =A0 .probe =A0 =A0 =A0 =A0 =A0=3D serial_imx_probe,
>> =A0 =A0 =A0 .remove =A0 =A0 =A0 =A0 =3D serial_imx_remove,
>> @@ -1345,6 +1401,9 @@ static struct platform_driver serial_imx_driver =
=3D {
>> =A0 =A0 =A0 .driver =A0 =A0 =A0 =A0 =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "imx-uart",
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =A0=3D THIS_MODULE,
>> +#if defined(CONFIG_OF)
>> + =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D imx_uart_matches,
>> +#endif
>> =A0 =A0 =A0 },
>> =A0};
>>
>> --
>> 1.7.1
>>
>
