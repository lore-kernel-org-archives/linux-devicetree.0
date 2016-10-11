From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v19 01/12] fpga: add bindings document for fpga region
Date: Tue, 11 Oct 2016 14:31:58 -0500
Message-ID: <alpine.DEB.2.02.1610111427370.2480@linuxheads99>
References: <20160928182200.15800-1-atull@opensource.altera.com>
 <20160928182200.15800-2-atull@opensource.altera.com>
 <20161008204928.GB11595@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161008204928.GB11595@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Moritz Fischer <moritz.fischer@ettus.com>, Frank Rowand <frowand.list@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Walter Goossens <waltergoossens@home.nl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, Cyril Chemparathy <cyril.chemparathy@xilinx.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Josh Cartwright <joshc@ni.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Matthew Gerlach <mgerlach@opensource.altera.com>, delicious.quinoa@gmail.com, Jon Masters <jcm@redhat.com>
List-Id: devicetree@vger.kernel.org

On Sat, 8 Oct 2016, Rob Herring wrote:

> On Wed, Sep 28, 2016 at 01:21:49PM -0500, Alan Tull wrote:
> > New bindings document for FPGA Region to support programming
> > FPGA's under Device Tree control
> > 
> > Signed-off-by: Alan Tull <atull@opensource.altera.com>
> > Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> > ---
> > v9:  initial version added to this patchset
> > v10: s/fpga/FPGA/g
> >      replace DT overlay example with slightly more complicated example
> >      move to staging/simple-fpga-bus
> > v11: No change in this patch for v11 of the patch set
> > v12: Moved out of staging.
> >      Changed to use FPGA bridges framework instead of resets
> >      for bridges.
> > v13: bridge@0xff20000 -> bridge@ff200000, etc
> >      Leave out directly talking about overlays
> >      Remove regs and clocks directly under simple-fpga-bus in example
> >      Use common "firmware-name" binding instead of "fpga-firmware"
> > v14: Use firmware-name in bindings description
> >      Call it FPGA Area
> >      Remove bindings that specify FPGA Manager and FPGA Bridges
> > v15: Cleanup as per Rob's comments
> >      Combine usage doc with bindings document
> >      Document as being Altera specific
> >      Additions and changes to add FPGA Bus
> > v16: Reworked to document FPGA Regions
> >      rename altera-fpga-bus-fpga-area.txt -> fpga-region.txt
> >      Remove references that made it sound exclusive to Altera
> >      Remove altr, prefix from fpga-bus and fpga-area compatible strings
> >      Added Moritz' usage example with Xilinx
> >      Cleaned up unit addresses
> > v17: Lots of rewrites to try to make things clearer
> >      Clarify that overlay can be rejected if FPGA isn't programmed
> >      Add external-fpga-config binding already used in u-boot
> >      Change partial-reconfig binding to partial-fpga-config to align
> >        with existing u-boot binding format *-fpga-config
> >      Add a document from Xilinx' website
> > v18: Fix node names underscores to be hyphens
> >      Fix copy/pasted duplicate nodes in diagram
> > v19: Fix more underscores
> >      Make FPGA regions to be children of bridges
> >      General cleanup and clarification
> > ---
> >  .../devicetree/bindings/fpga/fpga-region.txt       | 494 +++++++++++++++++++++
> >  1 file changed, 494 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/fpga/fpga-region.txt
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Nice job.
> 
> Rob
> 

Thanks, Rob!  I'll add your reviewed-by in v20 just
to make it even.  

Besides that, squashing some patches and some
minor changes for the Arria10 FPGA manager support.

Alan
