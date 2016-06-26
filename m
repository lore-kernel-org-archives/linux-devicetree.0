From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] iio: adc: max1363: Add device tree binding
 documentation
Date: Sun, 26 Jun 2016 18:02:52 +0100
Message-ID: <173a38ed-07c0-edf4-1445-a22f76feaf13@kernel.org>
References: <1466492969-2185-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466492969-2185-3-git-send-email-florian.vaussard@heig-vd.ch>
 <20160621214951.GA11679@rob-hp-laptop>
 <b48960b5-1965-b2cc-037b-eba4e7bbb7cb@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b48960b5-1965-b2cc-037b-eba4e7bbb7cb-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22/06/16 07:18, Florian Vaussard wrote:
> Hi Rob,
>=20
> Le 21. 06. 16 =E0 23:49, Rob Herring a =E9crit :
>> On Tue, Jun 21, 2016 at 09:09:28AM +0200, Florian Vaussard wrote:
>>> Add the device tree documentation for all the supported parts. Mand=
atory
>>> binding is the compatible string and the slave I2C address.
>>>
>>> Optional properties can be used to specify the Vcc / Vref regulator=
s, as
>>> well as the IRQ line if available.
>>>
>>> Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
>>> ---
>>>  .../devicetree/bindings/iio/adc/max1363.txt        | 63 ++++++++++=
++++++++++++
>>>  1 file changed, 63 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/max13=
63.txt
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Can you resend this with the updated patch 3 and Rob's ack applied.

Thanks

Jonathan
>>
>=20
> Thanks for the review.
>=20
> Florian
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
