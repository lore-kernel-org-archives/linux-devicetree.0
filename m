From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 1/4] pwm_backlight: Fix PWM levels support in non DT case
Date: Tue, 29 Jan 2013 09:17:04 +0100
Message-ID: <51078580.2000808@ti.com>
References: <1358861996-27194-1-git-send-email-peter.ujfalusi@ti.com> <1358861996-27194-2-git-send-email-peter.ujfalusi@ti.com> <20130128210123.GA24673@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130128210123.GA24673@avionic-0098.mockup.avionic-design.de>
Sender: linux-doc-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@secretlab.ca>, Rob Landley <rob@landley.net>, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>, Andrew Morton <akpm@linux-foundation.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/28/2013 10:01 PM, Thierry Reding wrote:
> On Tue, Jan 22, 2013 at 02:39:53PM +0100, Peter Ujfalusi wrote:
>> It is expected that board files would have:
>> static unsigned int bl_levels[] =3D { 0, 50, 100, 150, 200, 250, };
>>
>> static struct platform_pwm_backlight_data bl_data =3D {
>> 	.levels =3D bl_levels,
>> 	.max_brightness =3D ARRAY_SIZE(bl_levels),
>> 	.dft_brightness =3D 4,
>> 	.pwm_period_ns =3D 7812500,
>> };
>>
>> In this case the max_brightness would be out of range in the levels =
array.
>> Decrement the received max_brightness in every case (DT or non DT) w=
hen the
>> levels has been provided.
>=20
> What's wrong with specifying .max_brightness =3D ARRAY_SIZE(bl_levels=
) - 1
> instead?

There is nothing wrong with that either but IMHO it is more natural for=
 board
files to use just ARRAY_SIZE(bl_levels). In this way the handling of
data->max_brightness among non DT and DT booted kernel is more uniform =
in the
driver itself.
Right now all board files are using only the .max_brightness to specify=
 the
maximum value, I could not find any users of .levels in the kernel.

--=20
P=E9ter
