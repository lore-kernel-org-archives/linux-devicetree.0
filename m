From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH] of/irq: of_irq_init: add check for parent equal to
 child node
Date: Mon, 28 Nov 2011 16:40:49 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174FDAF9C4@HQMAIL01.nvidia.com>
References: <1322448550-15392-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1322448550-15392-1-git-send-email-robherring2@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
Cc: Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

Rob Herring wrote at Sunday, November 27, 2011 7:49 PM:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> With the revert of "of/irq: of_irq_find_parent: check for parent equal to
> child" (dc9372808412edb), we need another way to handle parent node equal
> to the child node. This can simply be handled in of_irq_init by checking
> for this condition.
> 
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>

Tested-by: Stephen Warren <swarren@nvidia.com>

This fixed the issue I was having testing a Tegra patch that converted
over to the new ARM GIC bindings.

-- 
nvpublic
