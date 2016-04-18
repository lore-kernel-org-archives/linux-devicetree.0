From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Axi-usb: Add support for 64-bit addressing.
Date: Mon, 18 Apr 2016 16:35:07 +0200
Message-ID: <4449845.qT8BZnpD4R@wuerfel>
References: <1460360506-14692-1-git-send-email-navam@xilinx.com>
 <4542055.HvdgVkDRYK@wuerfel> <20160418142909.GA5608@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160418142909.GA5608@rob-hp-laptop>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, navam@xilinx.com, pawel.moll@arm.com, hyun.kwon@xilinx.com, ijc+devicetree@hellion.org.uk, Nava kishore Manne <nava.manne@xilinx.com>, radhey.shyam.pandey@xilinx.com, michal.simek@xilinx.com, balbi@ti.com, linux-kernel@vger.kernel.org, galak@codeaurora.org, soren.brinkmann@xilinx.com, gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 18 April 2016 09:29:09 Rob Herring wrote:
> 
> Right, you don't need to know the exact bus width for determining the 
> register/descriptor set is 32 or 64 bit addesses. I'm fine with a 
> property for that, but if limiting the actual connected address bits is 
> needed, then dma-ranges should be used.

The other way round: dma-ranges is needed to allow 64-bit addressing,
the default is to only allow 32-bit addressing (and arm64 has a known
bug here, it just allows it anyway when it shouldn't).

	Arnd
