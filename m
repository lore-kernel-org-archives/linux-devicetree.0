From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] iio: Add Nuvoton NAU7802 ADC driver
Date: Mon, 22 Apr 2013 10:01:21 +0200
Message-ID: <5174EE51.4000606@free-electrons.com>
References: <1366299536-18353-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1366299536-18353-2-git-send-email-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366299536-18353-2-git-send-email-alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: brian-ZKiFAVwZFM2FeswfMrDH8w@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jimwall@q.com, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

Le 18/04/2013 17:38, Alexandre Belloni a =E9crit :
> +	nau7802_i2c_write(st, NAU7802_REG_PUCTRL, data);
> +	nau7802_i2c_write(st, NAU7802_REG_ADC_CTRL, 0x30);
> +
> +	if (tmp >=3D 2400) {
> +		data =3D NAU7802_CTRL1_VLDO((4500 - tmp) / 300);
> +		nau7802_i2c_write(st, NAU7802_REG_CTRL1, data);
> +	}

You should probably make a macro or inline function (with a comment) out
of that computation explaining why you are doing this.

> +
> +	st->min_conversions =3D 6;

I'd prefer to see this as a define.

> +
> +	/*
> +	 * The ADC fires continuously and we can't do anything about
> +	 * it. So we need to have the IRQ disabled by default, and we
> +	 * will enable them back when we will need them..
> +	 */
> +	if (client->irq) {
> +		irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
> +		ret =3D request_threaded_irq(client->irq,
> +				NULL,
> +				nau7802_eoc_trigger,
> +				IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +				client->dev.driver->name,
> +				idev);
> +		if (ret) {
> +			/*
> +			 * What may happen here is that our IRQ controller is
> +			 * not able to get level interrupt but this is required
> +			 * by this ADC as when going over 40 sample per second,
> +			 * the interrupt line may stay high between conversions.
> +			 * So, we continue no matter what but we switch to
> +			 * polling mode.
> +			 */
> +			dev_info(&client->dev,
> +				"Failed to allocate IRQ, using polling mode\n");
> +			client->irq =3D 0;
> +			/*
> +			 * We are polling, use the fastest sample rate by
> +			 * default
> +			 */
> +			st->sample_rate =3D 0x7;

Ditto.

Maxime

-- =

Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
