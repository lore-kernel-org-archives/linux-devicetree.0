From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 2/3] [media] rc: add sunxi-ir driver
Date: Tue, 20 May 2014 09:18:59 +0200
Message-ID: <537B01E3.2060206@redhat.com>
References: <1400104602-16431-1-git-send-email-bay@hackerdom.ru> <1400104602-16431-3-git-send-email-bay@hackerdom.ru> <20140519202616.GA25415@hardeman.nu>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDRZXY4CYYORB7ED5SNQKGQELUJUMXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140519202616.GA25415-0WFrdVpeebksCylrc8G9yg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, srinivas.kandagatla-qxv4g6HH51o@public.gmane.org, wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 05/19/2014 10:26 PM, David H=E4rdeman wrote:
> On Thu, May 15, 2014 at 03:56:41AM +0600, Alexander Bersenev wrote:
>> This patch adds driver for sunxi IR controller.
>> It is based on Alexsey Shestacov's work based on the original driver
>> supplied by Allwinner.
>>
>=20
> ...
>=20
>> +static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
>> +{
>> +	unsigned long status;
>> +	unsigned char dt;
>> +	unsigned int cnt, rc;
>> +	struct sunxi_ir *ir =3D dev_id;
>> +	DEFINE_IR_RAW_EVENT(rawir);
>> +
>> +	spin_lock(&ir->ir_lock);
>> +
>> +	status =3D readl(ir->base + SUNXI_IR_RXSTA_REG);
>> +
>> +	/* clean all pending statuses */
>> +	writel(status | REG_RXSTA_CLEARALL, ir->base + SUNXI_IR_RXSTA_REG);
>> +
>> +	if (status & REG_RXINT_RAI_EN) {
>> +		/* How many messages in fifo */
>> +		rc  =3D (status >> REG_RXSTA_RAC__SHIFT) & REG_RXSTA_RAC__MASK;
>> +		/* Sanity check */
>> +		rc =3D rc > SUNXI_IR_FIFO_SIZE ? SUNXI_IR_FIFO_SIZE : rc;
>> +		/* If we have data */
>> +		for (cnt =3D 0; cnt < rc; cnt++) {
>> +			/* for each bit in fifo */
>> +			dt =3D readb(ir->base + SUNXI_IR_RXFIFO_REG);
>> +			rawir.pulse =3D (dt & 0x80) !=3D 0;
>> +			rawir.duration =3D (dt & 0x7f) * SUNXI_IR_SAMPLE;
>=20
> Can the hardware actually return a zero duration or should that be dt &
> 0x7f + 1?
>=20
> (Not familiar with this particular hardware but I know I've seen that
> behaviour before).

Good point, I've just checked and the datasheet says the reported pulse
duration can be up to 128, so that would make the range 1-128 not 0-127,
so I believe we indeed need to add 1 to this.

Regards,

Hans


--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
