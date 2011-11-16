From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 3/8] of: create of_phandle_args to simplify return of
 phandle parsing data
Date: Wed, 16 Nov 2011 11:47:33 -0700
Message-ID: <CACxGe6t8-FT4Y+BYtq5yK5n-6vGCtBefKEFMRt2uKsMCF8zzVQ@mail.gmail.com>
References: <1320801583-12774-1-git-send-email-grant.likely@secretlab.ca>
 <1320801583-12774-4-git-send-email-grant.likely@secretlab.ca>
 <20111114035908.GA10236@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111114035908.GA10236-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 13, 2011 at 8:59 PM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Hi Grant,
>
> On Tue, Nov 08, 2011 at 06:19:38PM -0700, Grant Likely wrote:
> [...]
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 4948552..566deab 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -222,6 +222,13 @@ extern const void *of_get_property(const struct dev=
ice_node *node,
>> =A0#define for_each_property(pp, properties) \
>> =A0 =A0 =A0 for (pp =3D properties; pp !=3D NULL; pp =3D pp->next)
>>
>> +#define MAX_PHANDLE_ARGS 8
>> +struct of_phandle_args {
>> + =A0 =A0 struct device_node *np;
>> + =A0 =A0 int args_count;
>> + =A0 =A0 uint32_t args[MAX_PHANDLE_ARGS];
>> +};
>> +
>
> I'm seeing a bunch of warnings like the one below when compiling imx
> with the series. =A0And moving the definition to somewhere before
> '#include <asm/prom.h>' in linux/of.h removes the warnings for me.
>
> =A0CC =A0 =A0 =A0arch/arm/kernel/devtree.o
> In file included from arch/arm/plat-mxc/include/mach/irqs.h:14:0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from arch/arm/include/asm/irq.h:4,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from arch/arm/include/asm/prom.h:17,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/of.h:133,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from arch/arm/kernel/devtree.c:17:
> include/asm-generic/gpio.h:133:24: warning: =91struct of_phandle_args=92 =
declared inside parameter list
> include/asm-generic/gpio.h:133:24: warning: its scope is only this defini=
tion or declaration, which is probably not what you want

Fixed, thanks.

g.
