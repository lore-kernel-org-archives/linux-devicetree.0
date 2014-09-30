From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH v7 1/3] mfd: devicetree: bindings: Add Qualcomm RPM DT
 binding
Date: Tue, 30 Sep 2014 08:28:39 -0700
Message-ID: <20140930152838.GN28481@sonymobile.com>
References: <1411428329-23172-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1411428329-23172-2-git-send-email-bjorn.andersson@sonymobile.com>
 <334C6A04-9607-4E97-A7A7-2FEED5986E57@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <334C6A04-9607-4E97-A7A7-2FEED5986E57@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Andy Gross <agross@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@linaro.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed 24 Sep 09:39 PDT 2014, Kumar Gala wrote:

>=20
> On Sep 22, 2014, at 6:25 PM, Bjorn Andersson <Bjorn.Andersson@sonymob=
ile.com> wrote:
>=20

[..]

> > diff --git a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt b/D=
ocumentation/devicetree/bindings/mfd/qcom-rpm.txt

[..]

> > +- qcom,ipc:
> > +     Usage: required
> > +     Value type: <prop-encoded-array>
> > +
> > +     Definition: three entries specifying the outgoing ipc bit use=
d for
> > +                 signaling the RPM:
> > +                 - phandle to a syscon node representing the apcs =
registers
> > +                 - u32 representing offset to the register within =
the syscon
> > +                 - u32 representing the ipc bit within the registe=
r
> > +
>=20
> Does this really ever differ for the SoCs, and even if it does why do=
 we need
> to encode it in DT.  Can=92t we determine it via the compatible setti=
ng?
>=20

The two offsets could be hard coded, especially based on the compatible=
=2E

But I don't know if it's worth respinning this just to get those two nu=
mber out
of here. Also this is now "symmetric" with the smd use cases, where it
shouldn't be hard coded.

Regards,
Bjorn
