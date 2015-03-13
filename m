From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 2/4] arm64: dts: Add Qualcomm MSM8916 SoC and
 evaluation board dts
Date: Fri, 13 Mar 2015 16:25:16 +0000
Message-ID: <20150313162516.GA9603@leverpostej>
References: <1426182985-10425-1-git-send-email-galak@codeaurora.org>
 <20150313105207.GB3592@leverpostej>
 <04AD8E46-277D-4652-88AF-D16538C2AA87@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <04AD8E46-277D-4652-88AF-D16538C2AA87-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 13, 2015 at 03:50:42PM +0000, Kumar Gala wrote:
>=20
> On Mar 13, 2015, at 5:52 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrot=
e:
>=20
> >> +/ {
> >> +	chosen {
> >> +		stdout-path =3D &blsp1_uart2;
> >> +	};
> >=20
> > It would be good if we had the configuration too (see
> > Documentation/devicetree/bindings/chosen.txt), as that avoids any
> > reliance on kernel defaults.
> >=20
> > You can refer to an alias, so this could be:
> >=20
> > aliases {
> > 	serial0 =3D &blsp1_uart2;
> > };
> >=20
> > chosen {
> > 	stdout-path =3D "serial0:115200n8";
> > };
> >=20
> > ...assuming that 115200n8 is correct for your UART, of course.
> >=20
> >=20
> > [=E2=80=A6]
>=20
> Where is the code that actually handles this parsing?  I=E2=80=99m no=
t see it
> in early_init_dt_scan_chosen_serial and I don=E2=80=99t believe
> fdt_path_offset does anything special with =E2=80=98:'

Take a look at commit 7914a7c5651a5161 ("of: support passing console op=
tions with
stdout-path").

Early on of_alias_scan will find the options and in of_console_check
we'll call add_preferred_console as appropriate. That'll be called in
uart_add_one_port.

> I=E2=80=99ll kill off usage of skeleton.dtsi

Cheers.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
