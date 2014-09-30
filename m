From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH v7 1/3] mfd: devicetree: bindings: Add Qualcomm RPM DT
 binding
Date: Tue, 30 Sep 2014 09:25:42 -0700
Message-ID: <20140930162541.GQ28481@sonymobile.com>
References: <1411428329-23172-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1411428329-23172-2-git-send-email-bjorn.andersson@sonymobile.com>
 <334C6A04-9607-4E97-A7A7-2FEED5986E57@codeaurora.org>
 <20140930152838.GN28481@sonymobile.com>
 <2FC56515-E6AF-4A4D-9B04-70B4A8B2C4C7@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2FC56515-E6AF-4A4D-9B04-70B4A8B2C4C7@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Andy Gross <agross@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@linaro.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue 30 Sep 09:02 PDT 2014, Kumar Gala wrote:

>=20
> On Sep 30, 2014, at 10:28 AM, Bjorn Andersson <Bjorn.Andersson@sonymo=
bile.com> wrote:
>=20
> > On Wed 24 Sep 09:39 PDT 2014, Kumar Gala wrote:
> >=20
> >>=20
> >> On Sep 22, 2014, at 6:25 PM, Bjorn Andersson <Bjorn.Andersson@sony=
mobile.com> wrote:
> >>=20
> >=20
> > [..]
> >=20
> >>> diff --git a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt b=
/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
> >=20
> > [..]
> >=20
> >>> +- qcom,ipc:
> >>> +     Usage: required
> >>> +     Value type: <prop-encoded-array>
> >>> +
> >>> +     Definition: three entries specifying the outgoing ipc bit u=
sed for
> >>> +                 signaling the RPM:
> >>> +                 - phandle to a syscon node representing the apc=
s registers
> >>> +                 - u32 representing offset to the register withi=
n the syscon
> >>> +                 - u32 representing the ipc bit within the regis=
ter
> >>> +
> >>=20
> >> Does this really ever differ for the SoCs, and even if it does why=
 do we need
> >> to encode it in DT.  Can=92t we determine it via the compatible se=
tting?
> >>=20
> >=20
> > The two offsets could be hard coded, especially based on the compat=
ible.
> >=20
> > But I don't know if it's worth respinning this just to get those tw=
o number out
> > of here. Also this is now "symmetric" with the smd use cases, where=
 it
> > shouldn't be hard coded.
>=20
> I do think its worth respinning until the DT is agreed to as we shoul=
dn=92t
> be changing the binding.
>=20

Correct, if there's valid reason for it.

> I=92m not sure how being =91symmetric=92 with the smd use case maters=
 if
> we are treating this RPM support vs RPM-SMD as two different things.
>=20

Not rpm-smd but smd. Which is also used on family a and uses the same k=
pss-gcc
(or apcs) node as rpm for outgoing ipc on those platforms.

Regards,
Bjorn
