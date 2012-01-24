From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 03/20] fdt: Add basic support for decoding GPIO
 definitions
Date: Tue, 24 Jan 2012 15:11:58 -0800
Message-ID: <CAPnjgZ0eNXhWYtkb+4-FswpByAE7NHXoLz-ngp7Af_P0+u4GiQ@mail.gmail.com>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
 <1326342789-5781-4-git-send-email-sjg@chromium.org>
 <4F1744FE.4090409@nvidia.com>
 <CAPnjgZ0TCNTZjR_Fc1+UvYxyjH-a-Bxtkz60OERR7YmC5tbuug@mail.gmail.com>
 <4F1DA490.6090903@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F1DA490.6090903-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, Jan 23, 2012 at 10:18 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On 01/21/2012 10:08 AM, Simon Glass wrote:
>> Hi Stephen,
>>
>> On Wed, Jan 18, 2012 at 2:17 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
>>> On 01/11/2012 09:32 PM, Simon Glass wrote:
>>>> This adds some support into fdtdec for reading GPIO definitions from
>>>> the fdt. ...
> ...
>>>> diff --git a/include/fdtdec.h b/include/fdtdec.h
>>> ...
>>>> +/* GPIOs are numbered from 0 */
>>>> +enum {
>>>> + =A0 =A0 FDT_GPIO_NONE =3D -1U, =A0 =A0/* an invalid GPIO used to end=
 our list */
>>>
>>> Is this due to the way U-Boot works right now, or something defined by
>>> this patch? It's been pointed out that the kernel's choice to use -1 as
>>> "invalid GPIO" rather than 0 was a mistake, since that prevents GPIO
>>> fields being easily added to platform data structures, since you then
>>> have to go and initialize every new instance to -1, rather than relying
>>> on BSS initializing it to 0. I assume this is just the way U-Boot works,
>>> so solving this is outside the scope of this patch.
>>
>> It is nothing to do with U-Boot itself - we can choose any number.
>
> Surely the value you choose for DT parsing has to align with the value
> that U-Boot's GPIO API chooses, so you can't just choose any number.

No, in the fdt we just leave out the gpio if it is not required. The
FDT_GPIO_NONE is purely internal to U-Boot.

>
>> What is Linux using now / planning to use?
>
> Linux uses -1 right now, but should really have used 0. I don't think
> there's an actual plan to change this now, since the numbering scheme is
> entrenched.
>
> What Linux does isn't relevant; the numbering scheme I'm talking about
> is the internal numbering scheme within U-Boot or Linux, which are
> independent from each-other and the values in the device tree.
>
> So that said, I was wondering if U-Boot's GPIO support (covering both
> non-DT and DT cases) was new enough that it could use 0 to represent
> "invalid GPIO" rather than -1, and hence FDT_GPIO_NONE be 0 not -1. It
> probably isn't though; I guess U-Boot's GPIO numbering scheme is also
> already entrenched?

Yes it starts at zero. I'm not sure how to even begin such a
discussion on the list :-)

Regards,
Simon

>
> --
> nvpublic
