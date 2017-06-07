From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] drm/tinydrm: Add RePaper e-ink driver
Date: Wed, 7 Jun 2017 10:30:35 +0100
Message-ID: <CACvgo50+0DEeR=M9pyWvhgzKFnUivFVrmjisDL0jLPmB4ofz1w@mail.gmail.com>
References: <1496404155-8344-1-git-send-email-noralf@tronnes.org> <1496404155-8344-5-git-send-email-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496404155-8344-5-git-send-email-noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Cc: ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Noralf,

Small drive-by comment, noticed while going through my morning coffee.
By no means a full review.

On 2 June 2017 at 12:49, Noralf Tr=C3=B8nnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org> wrote:


> +/* pixels on display are numbered from 1 */
> +static void repaper_all_pixels(struct repaper_epd *epd, u8 **pp,
> +                              const u8 *data, u8 fixed_value, const u8 *=
mask,
> +                              enum repaper_stage stage)
> +{
> +       unsigned int b;
> +
> +       for (b =3D epd->width / 8; b > 0; b--) {
> +               if (data) {
> +                       u16 pixels =3D repaper_interleave_bits(data[b - 1=
]);
> +                       u16 pixel_mask =3D 0xffff;
> +
> +                       if (mask) {
> +                               u16 pixel_mask =3D repaper_interleave_bit=
s(mask[b - 1]);
> +
> +                               pixel_mask =3D (pixel_mask ^ pixels) & 0x=
5555;
> +                               pixel_mask |=3D pixel_mask << 1;

The second u16 pixel_mask seems very suspicious - likely a copy/paste mista=
ke ?

-Emil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
