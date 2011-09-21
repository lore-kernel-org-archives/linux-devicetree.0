From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: allow mfd_cell association with device tree node
Date: Wed, 21 Sep 2011 14:02:43 +0100
Message-ID: <CAMLZHHQZnajC4e12MjaK3W8WcAB2ZB+6L=5kS5BBFZF=+YWicQ@mail.gmail.com>
References: <20110921120148.4A81E9D401D@zog.reactivated.net>
	<20110921124936.GA25620@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110921124936.GA25620-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 21, 2011 at 1:49 PM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Wed, Sep 21, 2011 at 01:01:48PM +0100, Daniel Drake wrote:
>
>> @@ -37,6 +38,9 @@ struct mfd_cell {
>> =A0 =A0 =A0 void =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*platform_data;
>> =A0 =A0 =A0 size_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pdata_size;
>>
>> + =A0 =A0 /* association with device tree node (optional) */
>> + =A0 =A0 struct device_node =A0 =A0 =A0*of_node;
>> +
>
> This doesn't seem great as it means that the mfd_cells can't be static
> data, they have to be allocated per device. =A0Why can't the MFD cells get
> at the OF node by using the parent device in the same way as they
> (mostly) get platform data at the minute?

Thanks for reviewing.
The data can still be static, not needing allocation, it just has to
be modified at runtime. See patch 2.

Not sure how the MFD cells could get at the OF node by using the
parent device - if the parent device had a OF node, wouldn't this
correspond to the parent instead of the child? Also, as far as I can
see, platform data is passed to the child in exactly the same way - by
including it in the mfd_cell definition - see mfd_add_device():

	if (cell->pdata_size) {
		ret =3D platform_device_add_data(pdev,
					cell->platform_data, cell->pdata_size);
		if (ret)
			goto fail_res;
	}

Daniel
