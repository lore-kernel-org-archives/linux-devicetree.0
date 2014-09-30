From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [RFC 0/7] Qualcomm SMEM, SMD, RPM and regulators
Date: Tue, 30 Sep 2014 07:51:32 -0700
Message-ID: <20140930145131.GL28481@sonymobile.com>
References: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com>
 <E6EEBBAE-C710-4280-824D-CC5D54CB2551@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E6EEBBAE-C710-4280-824D-CC5D54CB2551-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jeffrey Hugo <jhugo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue 30 Sep 06:49 PDT 2014, Kumar Gala wrote:

>=20
> On Sep 29, 2014, at 7:34 PM, Bjorn Andersson <Bjorn.Andersson@sonymob=
ile.com> wrote:
>=20
> > All Qualcomm platforms implements a shared heap among the processor=
s in the
> > SoC, used for sharing data with other parts of the system.
> >=20
> > One consumer of items from this heap is the "Shared Memory Driver",=
 a ring
> > buffer based point-to-point communication mechanism used to send ei=
ther stream
> > or packet based data to remote processors.
> >=20
> > Starting with 8x74 this system is used to talk to the Resource Powe=
r Manager
> > (RPM), a power efficient "coprocessor" with responsibility of aggre=
gate votes
> > from the various systems in the SoC related to regulators, clocks a=
nd bus
> > frequencies.
> >=20
> > The PMIC regulators and root clocks in these platforms are only acc=
essible via
> > the RPM, so to get access to these we need the full chain of smem, =
smd, rpm and
> > a regulator driver implemented. And that is exactly what this serie=
s provides.
> >=20
> >=20
> > A key outstanding question is where in the tree we should put the
> > implementation, for now I dropped them in drivers/soc/qcom but that=
's only
> > because I don't know where to put it otherwise. I have not found an=
y equivalent
> > of the SMEM driver, SMD resembles mailbox and rpmsg - but comments =
in that
> > patch on why it's neither.
> >=20
> > RPM is a mfd and regulator is a regulator :)
>=20
> I still don=92t see why RPM support for either A-family or B-family s=
hould
> exist in MFD vis drivers/soc/qcom.  What benefit is there in putting =
this in
> MFD?
>=20
> I think both A and B-family support should be in drivers/soc/qcom for=
 the
> current time being until we determine there is some framework that ma=
kes more
> sense in the future.  I almost see RPM more like a bus controller tha=
n
> anything else.  Something like an I2C bus controller that than has so=
me set
> of devices off of that bus.
>=20

When you look at what functionality the RPM exposes it has very much in=
 common
with a PMIC. So after looking at this back and forth for months I think=
 MFD is
a nice fit.

As with all the other pmics we could create a new subsystem (drivers/pm=
ic?) for
this kind of devices that exposes variable size registers for children =
to read
and write.

But if you can convince the maintainers about that then we have a whole=
 bunch
of stuff in mfd etc that we should move out, so let's not put this in
qcom-staging just for the sake of it.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
