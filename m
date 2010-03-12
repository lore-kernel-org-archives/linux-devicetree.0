From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/3] of/flattree: Make unflatten_device_tree() safe to
	call from any arch
Date: Thu, 11 Mar 2010 21:55:52 -0700
Message-ID: <fa686aa41003112055i51bb1d31k6874a20d2a37748a@mail.gmail.com>
References: <20100311173024.4423.53178.stgit@angua>
	<20100311173203.4423.8733.stgit@angua>
	<20100312104840.2128fe99.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100312104840.2128fe99.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 11, 2010 at 4:48 PM, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> wr=
ote:
> Hi Grant,
>
> On Thu, 11 Mar 2010 10:32:03 -0700 Grant Likely <grant.likely@secretlab.c=
a> wrote:
>>
>> - If CONFIG_OF_FLATTREE is not set, then make unflatten_device_tree()
>> =A0 an empty #define.
>
> "an empty static inline funtion."
>
>> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
>> index f0fdd1f..54399f1 100644
>> --- a/include/linux/of_fdt.h
>> +++ b/include/linux/of_fdt.h
>> @@ -99,6 +99,8 @@ extern int early_init_dt_scan_root(unsigned long node,=
 const char *uname,
>> =A0/* Other Prototypes */
>> =A0extern void unflatten_device_tree(void);
>> =A0extern void early_init_devtree(void *);
>> +#else /* CONFIG_OF_FLATTREE */
>> +static inline void define unflatten_device_tree(void) {}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0^^^^^^
> You need to remove that.

Fixed.  Thanks.

g.
