From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v4 03/20] fdt: Add basic support for decoding GPIO
 definitions
Date: Tue, 24 Jan 2012 15:14:46 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178CB81F0D@HQMAIL01.nvidia.com>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
 <1326342789-5781-4-git-send-email-sjg@chromium.org>
 <4F1744FE.4090409@nvidia.com>
 <CAPnjgZ0TCNTZjR_Fc1+UvYxyjH-a-Bxtkz60OERR7YmC5tbuug@mail.gmail.com>
 <4F1DA490.6090903@nvidia.com>
 <CAPnjgZ0eNXhWYtkb+4-FswpByAE7NHXoLz-ngp7Af_P0+u4GiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ0eNXhWYtkb+4-FswpByAE7NHXoLz-ngp7Af_P0+u4GiQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Simon Glass wrote at Tuesday, January 24, 2012 4:12 PM:
> On Mon, Jan 23, 2012 at 10:18 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> > On 01/21/2012 10:08 AM, Simon Glass wrote:
> >> Hi Stephen,
> >>
> >> On Wed, Jan 18, 2012 at 2:17 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> >>> On 01/11/2012 09:32 PM, Simon Glass wrote:
> >>>> This adds some support into fdtdec for reading GPIO definitions from
> >>>> the fdt. ...
> > ...
> >>>> diff --git a/include/fdtdec.h b/include/fdtdec.h
> >>> ...
> >>>> +/* GPIOs are numbered from 0 */
> >>>> +enum {
> >>>> + =A0 =A0 FDT_GPIO_NONE =3D -1U, =A0 =A0/* an invalid GPIO used to e=
nd our list */
> >>>
> >>> Is this due to the way U-Boot works right now, or something defined by
> >>> this patch? It's been pointed out that the kernel's choice to use -1 =
as
> >>> "invalid GPIO" rather than 0 was a mistake, since that prevents GPIO
> >>> fields being easily added to platform data structures, since you then
> >>> have to go and initialize every new instance to -1, rather than relyi=
ng
> >>> on BSS initializing it to 0. I assume this is just the way U-Boot wor=
ks,
> >>> so solving this is outside the scope of this patch.
> >>
> >> It is nothing to do with U-Boot itself - we can choose any number.
> >
> > Surely the value you choose for DT parsing has to align with the value
> > that U-Boot's GPIO API chooses, so you can't just choose any number.
> =

> No, in the fdt we just leave out the gpio if it is not required. The
> FDT_GPIO_NONE is purely internal to U-Boot.

That's consistent with what I said; I'm talking about the value that a
missing DT property translates into within U-Boot.

-- =

nvpublic
