From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 7/7] serial: samsung: Get default port register settings
	from device tree
Date: Thu, 17 Feb 2011 19:39:52 +0530
Message-ID: <AANLkTi=ixzGYAWsQ=iF3g9sAF1kUvF1D1Qd-ysinS+RV@mail.gmail.com>
References: <1297514825-10345-1-git-send-email-thomas.abraham@linaro.org>
	<1297514825-10345-8-git-send-email-thomas.abraham@linaro.org>
	<20110217002617.GD14124@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <20110217002617.GD14124-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On 17 February 2011 05:56, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Sat, Feb 12, 2011 at 06:17:05PM +0530, Thomas Abraham wrote:
>> The default uart port register settings are obtained from the platform d=
ata.
>> In addition to that, this patch adds support for obtaining the default u=
art port
>> register values from the uart node in device tree.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>> =A0drivers/tty/serial/samsung.c | =A0 13 +++++++++++++
>> =A01 files changed, 13 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
>> index 66fece9..dda1d52 100644
>> --- a/drivers/tty/serial/samsung.c
>> +++ b/drivers/tty/serial/samsung.c
>> @@ -1148,9 +1148,22 @@ int s3c24xx_serial_probe(struct platform_device *=
dev,
>> =A0{
>> =A0 =A0 =A0 struct s3c24xx_uart_port *ourport;
>> =A0 =A0 =A0 int ret;
>> + =A0 =A0 unsigned int len, *regdef;
>> + =A0 =A0 struct s3c2410_uartcfg *cfg;
>>
>> =A0 =A0 =A0 dbg("s3c24xx_serial_probe(%p, %p) %d\n", dev, info, probe_in=
dex);
>>
>> + =A0 =A0 if (dev->dev.of_node) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 regdef =3D (u32 *)of_get_property(dev->dev.of_=
node,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 "reg-defaults", &len);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (regdef && (len / sizeof(unsigned int)) =3D=
=3D 3) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg =3D s3c24xx_dev_to_cfg(&de=
v->dev);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->ucon =3D be32_to_cpu(regd=
ef[0]);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->ulcon =3D be32_to_cpu(reg=
def[1]);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->ufcon =3D be32_to_cpu(reg=
def[2]);
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> +
>
> Same comment as before, per-uart configuration belongs in each ports
> device tree node.

The above configuration is obtained from the uart device tree node
(dev->dev.of_node).

>
> Also, don't forget to add binding documentation do
> Documentation/devicetree/bindings for the properties that you define
> for the samsung uart.

Ok. The documentation will be added.

Thanks,
Thomas.

>
> g.
>
>
