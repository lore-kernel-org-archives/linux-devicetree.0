From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/8] serial: pxa: add OF support
Date: Thu, 1 Mar 2012 20:55:13 +0800
Message-ID: <CAN1soZyDaKV62dweNdtSiyFNnUOh0u5_LZL8UxBMOdz6SxRryA@mail.gmail.com>
References: <1330582228-12424-1-git-send-email-haojian.zhuang@marvell.com>
 <1330582228-12424-3-git-send-email-haojian.zhuang@marvell.com>
 <201203010947.39601.arnd@arndb.de>
 <20120301094853.GA7363@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120301094853.GA7363-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 1, 2012 at 5:48 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Thu, Mar 01, 2012 at 09:47:39AM +0000, Arnd Bergmann wrote:
>> On Thursday 01 March 2012, Haojian Zhuang wrote:
>> > @@ -792,7 +826,7 @@ static int serial_pxa_probe(struct platform_device=
 *dev)
>> > =A0 =A0 =A0 =A0 if (!mmres || !irqres)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> >
>> > - =A0 =A0 =A0 sport =3D kzalloc(sizeof(struct uart_pxa_port), GFP_KERN=
EL);
>> > + =A0 =A0 =A0 sport =3D kzalloc(sizeof(struct uart_pxa_port) + 8, GFP_=
KERNEL);
>> > =A0 =A0 =A0 =A0 if (!sport)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> >
>> > @@ -808,20 +842,18 @@ static int serial_pxa_probe(struct platform_devi=
ce *dev)
>> > + =A0 =A0 =A0 ret =3D serial_pxa_probe_dt(dev, sport);
>> > + =A0 =A0 =A0 if (ret > 0)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sport->port.line =3D dev->id;
>> > + =A0 =A0 =A0 else if (ret < 0)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_clk;
>> > + =A0 =A0 =A0 sport->name =3D (char *)((unsigned int)sport + 8);
>> > + =A0 =A0 =A0 /* name can't exceed 8 bytes */
>> > + =A0 =A0 =A0 sprintf(sport->name, "UART%d", sport->port.line + 1);
>>
>> The pointer arithmetic looks wrong to me, both technically and morally ;=
-)
>>
>> Since struct uart_pxa_port is a local data structure, why don't you just
>> turn the name field into a fixed-length array?
>
> and then use snprintf() to ensure that it doesn't overflow.

OK. I'll use local data structure and snprintf() instead.
