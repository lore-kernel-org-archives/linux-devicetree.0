From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mach-ux500: add devicetree compat nodes
Date: Fri, 11 Nov 2011 16:59:56 +0100
Message-ID: <CACRpkda-9OVP8E1qO3Nc5znw_v7cKFiv8T5HHwTCnY2C9Fg7iA@mail.gmail.com>
References: <1321023902-18870-1-git-send-email-niklas.hernaeus@linaro.org>
 <4EBD3C85.1010508@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EBD3C85.1010508-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Niklas Hernaeus <niklas.hernaeus-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Nicolas.Pitre.nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Grant.Likely.grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 11, 2011 at 4:17 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>> =A0MACHINE_START(U8500, "ST-Ericsson MOP500 platform")
>> =A0 =A0 =A0 /* Maintainer: Srinidhi Kasagar <srinidhi.kasagar@stericsson=
.com> */
>> =A0 =A0 =A0 .boot_params =A0 =A0=3D 0x100,
>> @@ -651,6 +666,7 @@ MACHINE_START(U8500, "ST-Ericsson MOP500 platform")
>> =A0 =A0 =A0 /* we re-use nomadik timer here */
>> =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &ux500_timer,
>> =A0 =A0 =A0 .init_machine =A0 =3D mop500_init_machine,
>> + =A0 =A0 .dt_compat =A0 =A0 =A0=3D mop500_dt_board_compat,
>> =A0MACHINE_END
>>
>> =A0MACHINE_START(HREFV60, "ST-Ericsson U8500 Platform HREFv60+")
>> @@ -659,6 +675,7 @@ MACHINE_START(HREFV60, "ST-Ericsson U8500 Platform H=
REFv60+")
>> =A0 =A0 =A0 .init_irq =A0 =A0 =A0 =3D ux500_init_irq,
>> =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &ux500_timer,
>> =A0 =A0 =A0 .init_machine =A0 =3D mop500_init_machine,
>> + =A0 =A0 .dt_compat =A0 =A0 =A0=3D hrefv60_dt_board_compat,
>> =A0MACHINE_END
>>
>> =A0MACHINE_START(SNOWBALL, "Calao Systems Snowball platform")
>> @@ -668,4 +685,5 @@ MACHINE_START(SNOWBALL, "Calao Systems Snowball plat=
form")
>> =A0 =A0 =A0 /* we re-use nomadik timer here */
>> =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &ux500_timer,
>> =A0 =A0 =A0 .init_machine =A0 =3D mop500_init_machine,
>> + =A0 =A0 .dt_compat =A0 =A0 =A0=3D snowball_dt_board_compat,
>> =A0MACHINE_END
>
> These all look very similar and should be combined. Why do you not have
> 1 machine for all DT platforms as other SOCs are doing?

This needs to be rebased for the latest kernel.
Which looks like this:

MACHINE_START(U8500, "ST-Ericsson MOP500 platform")
        /* Maintainer: Srinidhi Kasagar <srinidhi.kasagar-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org> */
        .atag_offset    =3D 0x100,
        .map_io         =3D u8500_map_io,
        .init_irq       =3D ux500_init_irq,
        /* we re-use nomadik timer here */
        .timer          =3D &ux500_timer,
        .init_machine   =3D mop500_init_machine,
MACHINE_END

MACHINE_START(HREFV60, "ST-Ericsson U8500 Platform HREFv60+")
        .atag_offset    =3D 0x100,
        .map_io         =3D u8500_map_io,
        .init_irq       =3D ux500_init_irq,
        .timer          =3D &ux500_timer,
        .init_machine   =3D hrefv60_init_machine,
MACHINE_END

MACHINE_START(SNOWBALL, "Calao Systems Snowball platform")
        .atag_offset    =3D 0x100,
        .map_io         =3D u8500_map_io,
        .init_irq       =3D ux500_init_irq,
        /* we re-use nomadik timer here */
        .timer          =3D &ux500_timer,
        .init_machine   =3D snowball_init_machine,
MACHINE_END

So - different .init_machine() calls, needed to simplify the board
files as of now. (Patch from Lee Jones.)

Yours,
Linus Walleij
