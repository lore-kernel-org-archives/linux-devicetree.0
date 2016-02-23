From: Scott Wood <oss@buserror.net>
Subject: Re: [PATCH v2 3/7] QE: Add uqe_serial document to bindings
Date: Tue, 23 Feb 2016 14:27:13 -0600
Message-ID: <1456259233.5360.25.camel@buserror.net>
References: <1455757572-44955-1-git-send-email-qiang.zhao@nxp.com>
	 <1455757572-44955-3-git-send-email-qiang.zhao@nxp.com>
	 <20160223202342.GA9008@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160223202342.GA9008@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Zhao Qiang <qiang.zhao@nxp.com>
Cc: leoyang.li@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, 2016-02-23 at 14:23 -0600, Rob Herring wrote:
> On Thu, Feb 18, 2016 at 09:06:08AM +0800, Zhao Qiang wrote:
> > Add uqe_serial document to
> > Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> > 
> > Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> > ---
> > Changes for v2
> > 	- modify tx/rx-clock-name specification
> > 
> >  .../bindings/powerpc/fsl/cpm_qe/uqe_serial.txt        | 19
> > +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> > b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> > new file mode 100644
> > index 0000000..436c71c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> > @@ -0,0 +1,19 @@
> > +* Serial
> > +
> > +Currently defined compatibles:
> > +- ucc_uart
> > +
> > +Properties for ucc_uart:
> > +port-number : port number of UCC-UART
> 
> How is this used?
> 
> > +tx/rx-clock-name : should be "brg1"-"brg16" for internal clock source,
> > +		   should be "clk1"-"clk28" for external clock source.
> 
> Perhaps you should be using the clock binding here and in other 
> bindings?

These properties are required by the underlying UCC binding
(Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/ucc.txt) and predate
the clock binding.

-Scott
