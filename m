From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] mfd: convert devicetree to platform data on max8925
Date: Sun, 10 Jul 2011 19:40:32 +0900
Message-ID: <CACxGe6sEkToYu01wQpj6ey+--JMkDkK8s4U5aqwxoppSGRb1OQ@mail.gmail.com>
References: <1310120428-22700-2-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-3-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-4-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-5-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-6-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-7-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-8-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-9-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-10-git-send-email-haojian.zhuang@marvell.com>
	<20110710072027.GE10912@ponder.secretlab.ca>
	<20110710091729.GA23521@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110710091729.GA23521-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, samuel.ortiz-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 10, 2011 at 6:17 PM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Sun, Jul 10, 2011 at 04:20:27PM +0900, Grant Likely wrote:
>> On Fri, Jul 08, 2011 at 06:20:26PM +0800, Haojian Zhuang wrote:
>
>> > + =A0 if (pdata =3D=3D NULL)
>> > + =A0 =A0 =A0 =A0 =A0 return NULL;
>> > + =A0 pdata->regulator[0] =3D kzalloc(sizeof(struct regulator_init_dat=
a)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * MAX8925_MAX_REGULATOR, GFP_KER=
NEL);
>
>> ditto.
>
>> Is it appropriate to allocated the entire table of regulators? =A0From
>> the parse_regulator function above, it looks like only one of the
>> regulators will actually get registered (I've not dug deeply into what
>> the driver needs here though).
>
> If the code/binding doesn't allow the use of all the regulators on the
> device the code is probably wrong, it'd be very unusual to have hardware
> like that.

I was wondering about that.  I was just going by what I could
understand of the code.

g.
