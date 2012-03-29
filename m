From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 1/2] fdt: Avoid early panic() when there is no
 FDT present
Date: Thu, 29 Mar 2012 08:57:39 -0700
Message-ID: <CAPnjgZ1Hu3gPVcGg4NKg9dQbsnWYaXaWMnABCrSYwPser+Jujg@mail.gmail.com>
References: <1332965305-21151-1-git-send-email-sjg@chromium.org>
	<20120329063015.85A59202B18@gemini.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20120329063015.85A59202B18@gemini.denx.de>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Wolfgang Denk <wd@denx.de>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Wolfgang,

On Wed, Mar 28, 2012 at 11:30 PM, Wolfgang Denk <wd@denx.de> wrote:
> Dear Simon Glass,
>
> In message <1332965305-21151-1-git-send-email-sjg@chromium.org> you wrote:
>> CONFIG_OF_CONTROL requires a valid device tree. However, we cannot call
>> panic() before the console is set up since the message does not appear,
>> and we get a silent failure.
> ...
>> +int fdtdec_prepare_fdt(void);
>> +
>> +/**
>> + * Checks that we have a valid fdt available to control U-Boot.
>> +
>> + * However, if not then for the moment nothing is done, since this func=
tion
>> + * is called too early to panic().
>> + *
>> + * @returns 0
>
> If the function always returns 0, then it makes no sense to return any
> value at all. =A0Please make it void, then.

fdtdec_check_fdt() is used in the ARM init sequence, so I need to
follow that signature and return a value. In fact I must return 0 or
the board will hang.

>
>> +int fdtdec_check_fdt(void)
>> +{
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* We must have an FDT, but we cannot panic() yet since the =
console
>> + =A0 =A0 =A0* is not ready. So for now, just assert(). Boards which nee=
d an early
>> + =A0 =A0 =A0* FDT (prior to console ready) will need to make their own
>> + =A0 =A0 =A0* arrangements and do their own checks.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 assert(!fdtdec_prepare_fdt());
>> + =A0 =A0 return 0;
>> +}
>
> Ditto - make that "void fdtdec_check_fdt(void)".
>
>> +int fdtdec_prepare_fdt(void)
> ...
>> =A0 =A0 =A0 return 0;
>> =A0}
>
> Ditto - make that "void fdtdec_prepare_fdt(void)".

This fdtdec_prepare_fdt() is intended to provide a way to find out if
there is a valid fdt. The 'return 0' that you have shown is only if it
succeeds - it does actually return -1 on failure. I want a function
which just checks this, and returns the result (rather than dying if
it fails, which the behaviour that in principle I would like in the
init sequence).

>
>
> I have to admit that I do not understand how this patch will help you
> anything. =A0You write "we cannot panic()", but "just assert()".
>
> If the assertion fails, it will call __assert_fail() - which in turn
> will just call panic(). =A0So you are out of the frying pan into the
> fire.

Yes, but only if DEBUG is turned on in fdtdec. Otherwise we just
continue and panic later when we can report the error.

Regards,
Simon

>
> Best regards,
>
> Wolfgang Denk
>
> --
> DENX Software Engineering GmbH, =A0 =A0 MD: Wolfgang Denk & Detlev Zundel
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
> Life. Don't talk to me about life. =A0 =A0 =A0- Marvin the Paranoid Andro=
id
