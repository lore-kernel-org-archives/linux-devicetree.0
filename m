From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of/device: Make of_device_make_bus_id() usable by other
	code.
Date: Sun, 25 Jul 2010 15:23:49 -0600
Message-ID: <AANLkTin3RF+Va-b5ejT-6EJpybMKFE+myLR7Y40e0mha@mail.gmail.com>
References: <20100724160111.7072.68144.stgit@angua>
	<20100725133430.4c1d38a3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100725133430.4c1d38a3.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 24, 2010 at 9:34 PM, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> wr=
ote:
> Hi Grant,
>
> On Sat, 24 Jul 2010 10:01:11 -0600 Grant Likely <grant.likely@secretlab.c=
a> wrote:
>>
>> diff --git a/include/linux/of_device.h b/include/linux/of_device.h
>> index e11a0be..249bc11 100644
>> --- a/include/linux/of_device.h
>> +++ b/include/linux/of_device.h
>> @@ -27,6 +27,9 @@
>>
>> =A0extern const struct of_device_id *of_match_device(
>> =A0 =A0 =A0 const struct of_device_id *matches, const struct device *dev=
);
>> +#if !defined(CONFIG_SPARC)
>> +extern void of_device_make_bus_id(struct device *dev);
>> +#endif
>
> You don't really need the protection here - it does not clash with
> anything on SPARC, right?

No, it doesn't conflict with anything.  I'll drop the if !defined() wrapper.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
