From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 01/17] fdt: Tidy up a few fdtdec problems
Date: Mon, 5 Dec 2011 14:11:07 -0800
Message-ID: <CAPnjgZ36vurCx1yi2PoERBDVMwgkN_HVibHm_5fJ8QAuPKPMeg@mail.gmail.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
 <1322878300-5551-2-git-send-email-sjg@chromium.org>
 <4EDD375D.9090509@nvidia.com>
 <CAPnjgZ0h39vB2H4MuCwVqb2Tgcr4==yN8Pj6a3s9dciyXPBu1A@mail.gmail.com>
 <4EDD4091.1030708@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EDD4091.1030708-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, Dec 5, 2011 at 2:07 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On 12/05/2011 02:40 PM, Simon Glass wrote:
>> Hi Stephen,
>>
>> On Mon, Dec 5, 2011 at 1:27 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrot=
e:
>>> On 12/02/2011 07:11 PM, Simon Glass wrote:
>>> ...
>>>> +int fdtdec_get_is_enabled(const void *blob, int node)
>>>> =A0{
>>>> =A0 =A0 =A0 const char *cell;
>>>>
>>>> =A0 =A0 =A0 cell =3D fdt_getprop(blob, node, "status", NULL);
>>>> =A0 =A0 =A0 if (cell)
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 return 0 =3D=3D strcmp(cell, "ok");
>>>> - =A0 =A0 return default_val;
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0 =3D=3D strcmp(cell, "okay");
>>>> + =A0 =A0 return 1;
>>>> =A0}
>>>
>>> The kernel accepts both okay (standard) and ok (non-standard). I assume
>>> the latter is required for some in-use-but-technically-incorrect .dts
>>> files. I imagine U-Boot should act like the kernel here.
>>
>> Given that we are just starting out with fdt, do you think it would be
>> better to not bloat the code in this way? I don't mind either way -
>> just asking :-)
>
> My point is that there are probably .dts files using "ok" instead of
> "okay" or the kernel wouldn't support "ok". People will probably want to
> use those with U-Boot without changing anything else. So, U-Boot should
> interpret the FDT in the same way as the kernel.

OK, how about:
		return 0 =3D=3D strncmp(cell, "ok", 2);

(I do feel that if you do this sort of thing you end up with people
using 'ok' even in new fdts, since they look at code like this and
think it is fine)

Regards,
Simon

>
> --
> nvpublic
