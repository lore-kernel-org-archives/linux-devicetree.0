From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH V3 0/4] APM X-Gene PCIe controller
Date: Thu, 30 Jan 2014 15:17:51 +0100
Message-ID: <201401301517.51352.arnd@arndb.de>
References: <1390599168-13150-1-git-send-email-tinamdar@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1390599168-13150-1-git-send-email-tinamdar@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tanmay Inamdar <tinamdar@apm.com>
Cc: devicetree@vger.kernel.org, jcm@redhat.com, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, patches@apm.com, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Friday 24 January 2014, Tanmay Inamdar wrote:
> This patch adds support for AppliedMicro X-Gene PCIe host controller. The
> driver is tested on X-Gene platform with different gen1/2/3 PCIe endpoint
> cards.
> 
> X-Gene PCIe controller driver has depedency on the pcie arch support for
> arm64. The arm64 pcie arch support is not yet part of mainline Linux kernel
> and approach for arch support is under discussion with arm64 maintainers.
> The reference patch can be found here --> https://lkml.org/lkml/2013/10/23/244
> 
> If someone wishes to test PCIe on X-Gene, arch support patch must be applied
> before the patches in this patch set.

This is starting to look really good now. I have a few small comments left,
otherwise it can get merged. As mentioned in one of my review comments, it
would be good to have the arch support patch posted along with the driver.

	Arnd
