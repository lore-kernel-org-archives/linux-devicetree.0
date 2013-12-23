From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [RFC PATCH 2/3] arm64: dts: APM X-Gene PCIe device tree nodes
Date: Mon, 23 Dec 2013 10:46:34 -0700
Message-ID: <20131223174634.GD25089@obsidianresearch.com>
References: <1387785725-24262-1-git-send-email-tinamdar@apm.com>
 <1387785725-24262-3-git-send-email-tinamdar@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1387785725-24262-3-git-send-email-tinamdar@apm.com>
Sender: linux-doc-owner@vger.kernel.org
To: Tanmay Inamdar <tinamdar@apm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, patches@apm.com, linux-kernel@vger.kernel.org, jcm@redhat.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 23, 2013 at 01:32:03PM +0530, Tanmay Inamdar wrote:
> This patch adds the device tree nodes for APM X-Gene PCIe controller and
> PCIe clock interface. Since X-Gene SOC supports maximum 5 ports, 5 dts nodes
> are added.

Can you include an lspci dump for PCI DT bindings please? It is
impossible to review otherwise..

Regards,
Jason
