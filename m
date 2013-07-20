From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Reusing DTSI files across trees with differing numbers of address-cells
Date: Sat, 20 Jul 2013 06:03:04 +0100
Message-ID: <20130720050304.CF0F93E167A@localhost>
References: <517B0B20.3000305@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <517B0B20.3000305@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stepan Moskovchenko <stepanm@codeaurora.org>, devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 26 Apr 2013 16:17:52 -0700, Stepan Moskovchenko <stepanm@codeaurora.org> wrote:
> 
> Hello. I am creating a DTS file for an ARM (Qualcomm MSM) target which 
> supports LPAE, meaning that the target is capable of addressing memory 
> beyond the standard 4GB boundary. To account for the fact that the 
> memory node can contain reg addresses that exceed 32 bits, I am setting 
> #address-cells and #size-cells to 2 at the top level of my tree, since 
> this is what the kernel will use when parsing the memory node.
> 
> However, my internal tree contains multiple DTSI files with definitions 
> for some hardware blocks that are used across multiple MSM targets, 
> including ones that have #address-cells and #size-cells set to 1 at the 
> top level, I would like to re-use some of these files in the tree for my 
> LPAE-based target. Additionally, most MSM I/O devices are declared at 
> the top level of the tree, rather than on a dedicated simple-bus.
> 
> To allow reuse of common hardware block definitions, I am considering 
> moving all the MSM memory-mapped I/O devices to a dedicated /soc node 
> (per the Power spec), declaring this node as a simple-bus with 
> #address-cells and #size-cells of 1, and using the ranges property to 
> map this bus into the top-level address space. Since MSM I/O devices are 
> located at addresses below 4GB, I believe it is okay to keep them on a 
> simple-bus with #address-cells=1.
> 
> Does this seem like a reasonable approach?

Yes.

g.
