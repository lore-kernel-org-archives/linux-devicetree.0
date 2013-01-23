From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: arm: Kernel failures when several memory banks are used with
 starting address above 128MB
Date: Wed, 23 Jan 2013 09:15:37 +0000
Message-ID: <20130123091537.GN23505@n2100.arm.linux.org.uk>
References: <CAHTX3dJZxuoz_0Eaa7QcoK9bF4LdLuWcDcwK3OUKc6qY_0PeuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAHTX3dJZxuoz_0Eaa7QcoK9bF4LdLuWcDcwK3OUKc6qY_0PeuQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Michal Simek <monstr@monstr.eu>, Stephen Warren <swarren@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, John Williams <jwilliams@xilinx.com>, Olof Johansson <olof@lixom.net>, linux-arm <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 22, 2013 at 08:18:13PM +0100, Michal Simek wrote:
> I have a question regarding to the case where DTS specify one memory bank
> for example <0x0 0x40000000> with CONFIG_ARM_PATCH_PHYS_VIRT=y
> where the kernel can be loaded at a 16MB boundary.

That's where you're going wrong.  We assume that the kernel is loaded
within the 16MB of memory _always_.  Can't get around this on a
multiplatform kernel.
