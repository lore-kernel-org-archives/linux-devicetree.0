From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH V3 2/4] arm64: dts: APM X-Gene PCIe device tree nodes
Date: Thu, 30 Jan 2014 15:09:25 +0100
Message-ID: <201401301509.26080.arnd@arndb.de>
References: <1390599168-13150-1-git-send-email-tinamdar@apm.com>
 <1390599168-13150-3-git-send-email-tinamdar@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1390599168-13150-3-git-send-email-tinamdar@apm.com>
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
> +               pcie3: pcie@1f500000 {
> +                       reg-names = "csr", "cfg";
> +                       ranges = <0x01000000 0x0 0x00000000 0xa0 0x00000000 0x0 0x00010000  /* mem */
> +                                 0x02000000 0x0 0x10000000 0xa0 0x10000000 0x0 0x80000000>; /* io  */

The two comments are wrong for this instance.

	Arnd
