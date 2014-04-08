From: Thor Thayer <tthayer@altera.com>
Subject: Re: [PATCH 3/3] edac: altera: Add SDRAM EDAC support for
 CycloneV/ArriaV
Date: Tue, 8 Apr 2014 08:57:39 -0500
Message-ID: <1396965459.23349.4.camel@dinh-ubuntu>
References: <1396907649-20212-1-git-send-email-tthayer@altera.com>
	 <1396907649-20212-4-git-send-email-tthayer@altera.com>
	 <20140408100851.GF30077@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140408100851.GF30077@pd.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: robherring2@gmail.com, dougthompson@xmission.com, grant.likely@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, dinguyen@altera.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2014-04-08 at 12:08 +0200, Borislav Petkov wrote:
> On Mon, Apr 07, 2014 at 04:54:09PM -0500, tthayer@altera.com wrote:
> > From: Thor Thayer <tthayer@altera.com>
> > 
> > Added EDAC support for reporting ECC errors of CycloneV
> > and ArriaV SDRAM controller.
> > - The SDRAM Controller registers are used by the FPGA bridge so
> >   these are accessed through the syscon interface.
> > - The configuration of the SDRAM memory size for the EDAC framework
> >   is discovered from the memory node of the device tree.
> > - Documentation of the bindings in devicetree/bindings/arm/altera/
> >   socfpga-sdram-edac.txt
> > - Correction of single bit errors, detection of double bit errors.
> 
> Before I go and take a look at this further, is anyone at Altera going
> to maintain this driver in case of bug reports and issues with it?

Yes, Altera has a group specifically supporting Linux drivers on the
Altera SoCs.

> 
> Also, I see patch 3/3. Are the other two related? I see they are
> devicetree additions and, as such, all three should go together...
> 

I was told that the device tree additions should be separate patches in
a series since the device tree additions go to a separate group for
approval.
