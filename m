From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 04/10] dt-bindings: soc: qcom: Add AOSS QMP binding
Date: Tue, 22 Jan 2019 11:28:23 -0800
Message-ID: <154818530327.20280.1477070677484130832@swboyd.mtv.corp.google.com>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org> <20190122055112.30943-5-bjorn.andersson@linaro.org> <154818385792.20280.7601798748317142776@swboyd.mtv.corp.google.com> <20190122192537.GC31919@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122192537.GC31919@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-01-22 11:25:37)
> On Tue 22 Jan 11:04 PST 2019, Stephen Boyd wrote:
>=20
> > Quoting Bjorn Andersson (2019-01-21 21:51:06)
> > > Add binding for the QMP based side-channel communication mechanism to
> > > the AOSS, which is used to control resources not exposed through the
> > > RPMh interface.
> > >=20
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >=20
> > > Changes since v2:
> > > - Update indentation of example
> > > - Add colling device subnodes to the description
> > >=20
> > >  .../bindings/soc/qcom/qcom,aoss-qmp.txt       | 75 +++++++++++++++++=
++
> > >  include/dt-bindings/power/qcom-aoss-qmp.h     | 15 ++++
> > >  2 files changed, 90 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,a=
oss-qmp.txt
> > >  create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp=
.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> > > new file mode 100644
> > > index 000000000000..881dc8c7907a
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> > > @@ -0,0 +1,75 @@
> > > +Qualcomm Always-On Subsystem side channel binding
> > > +
> > > +This binding describes the hardware component responsible for side c=
hannel
> > > +requests to the always-on subsystem (AOSS), used for certain power m=
anagement
> > > +requests that is not handled by the standard RPMh interface. Each cl=
ient in the
> > > +SoC has it's own block of message RAM and IRQ for communication with=
 the AOSS.
> > > +The protocol used to communicate in the message RAM is known as QMP.
> >=20
> > Just curious if QMP is "Qualcomm Messaging Protocol"? I don't think it's
> > ever spelled out in this patchset.
> >=20
>=20
> I believe that is the case, would you like me to spell it out?

Yes, at least once would be great. Thanks.
