From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH] arm64: dts:  add <dt-bindings/> symlink
Date: Fri, 10 Jan 2014 11:54:32 +0100
Message-ID: <20140110115432.21fb03af@ipc1.ka-ro>
References: <1389346197-5127-1-git-send-email-pankaj.dubey@samsung.com>
	<20140110102226.63f5bf30@ipc1.ka-ro>
	<52CFCFA1.4080405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52CFCFA1.4080405-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Pankaj Dubey wrote:
> On 01/10/2014 06:22 PM, Lothar Wa=C3=9Fmann wrote:
> > Hi,
> >
> > Pankaj Dubey wrote:
> >> Add symlink to include/dt-bindings from arch/arm64/boot/dts/includ=
e/ to
> >> match the ones in ARM architectures so that preprocessed device
> >> tree files can include various useful constant definitions.
> >>
> >> See commit c58299a (kbuild: create an "include chroot" for DT bind=
ings)
> >> merged in v3.10-rc1 for details.
> >>
> >> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >> ---
> >>   arch/arm64/boot/dts/include/dt-bindings |    1 +
> >>   1 file changed, 1 insertion(+)
> >>   create mode 120000 arch/arm64/boot/dts/include/dt-bindings
> >>
> >> diff --git a/arch/arm64/boot/dts/include/dt-bindings b/arch/arm64/=
boot/dts/include/dt-bindings
> >> new file mode 120000
> >> index 0000000..08c00e4
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/include/dt-bindings
> >> @@ -0,0 +1 @@
> >> +../../../../../include/dt-bindings
> >> \ No newline at end of file
> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> I just created symlink file to "include/dt-bindings", and when create=
d=20
> patch it is showing this line
> at the end of patch. I do not have much idea why this came in patch? =
But=20
> when I checked similar patches
> it looks like it is required.
>
I noticed after sending the email, that the file in question was
actually only a symlink. The message seems to be a 'feature' of
'patch' when dealing with symlinks.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org
___________________________________________________________
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
