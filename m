From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: msm8974: Hook up adsp-pil's xo clock
Date: Mon, 20 Feb 2017 21:45:04 -0800
Message-ID: <20170221054504.GA24291@minitux>
References: <20170215045157.11659-1-j.neuschaefer@gmx.net>
 <20170220220041.GA3170@hector>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170220220041.GA3170@hector>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Jonathan Neusch?fer <j.neuschaefer@gmx.net>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 20 Feb 14:00 PST 2017, Andy Gross wrote:

> On Wed, Feb 15, 2017 at 05:51:56AM +0100, Jonathan Neuschäfer wrote:
> > Without this patch (and with CONFIG_QCOM_ADSP_PIL), I get this error:
> > 
> > 	[    0.711529] qcom_adsp_pil adsp-pil: failed to get xo clock
> > 	[    0.711540] remoteproc remoteproc0: releasing adsp-pil
> > 
> > With this patch, adsp-pil can initialize correctly.
> > 
> > Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> > 
> > ---
> > NOTE: I don't know if I actually chose the right clock source.
> >       Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> >       suggests that adsp-pil's xo should be controlled by the RPM
> >       processor; Existing devicetrees and a recent patch to msm8996.dtsi
> >       use &xo_board, though:
> >       https://www.spinics.net/lists/linux-arm-msm/msg25711.html

The ADSP is running off a clock derived from XO, as such a vote for XO
must be held while the ADSP is running. It's possible the all
application CPUs hit idle after launching the ADSP, but before the ADSP
firmware can communicate this need with the RPM, which would result in
the votes hitting 0 and the RPM might gate the XO.

To prevent this the ADSP remoteproc driver must hold an extra vote with
the RPM until the ADSP signals that it has cast its vote.

Unfortunately there are some issues with nested probe deferral in the
clock framework, so we can't accurately describe the XO today and as
we're still missing some last pieces of idle mechanism causing above
events we can survive by faking it and using xo_board - for a little
bit longer...

> > ---
> >  arch/arm/boot/dts/qcom-msm8974.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> > index d3e1a61b8671..cccd8cba8872 100644
> > --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> > +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> > @@ -250,6 +250,9 @@
> >  
> >  		cx-supply = <&pm8841_s2>;
> >  
> > +		clocks = <&xo_board>;
> > +		clock-names = "xo";
> > +
> 
> I have to wonder if this wasn't done specifically so that the board specific DTS
> file would specify the XO clock.  If you do it here, it applies to all boards
> using msm8974.
> 

The reason for the adsp node missing the xo reference is that it
wasn't required originally. It is now and I didn't feel we had wide
spread usage and omitted backwards compatibility in the driver

> Maybe someone can answer that question.  Adding Bjorn to the CC.
> 

I forgot that I had sent you the original patch and hence didn't send
you a fix for it. Sorry about that, perhaps we should flag this for
stable?

Regards,
Bjorn
