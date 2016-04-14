From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Add EDAC peripheral init functions & Ethernet EDAC.
Date: Thu, 14 Apr 2016 09:35:01 -0500
Message-ID: <20160414143501.GA25212@rob-hp-laptop>
References: <1460499181-23080-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460499181-23080-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, Apr 12, 2016 at 05:12:55PM -0500, tthayer@opensource.altera.com wrote:
> This patch set adds the memory initialization functions for Altera's
> Arria10 peripherals, the first of which is the Ethernet EDAC. The
> first 3 patches add the memory initialization functionality. The
> last 3 patches add Ethernet EDAC support.

The ethernet part seems a bit strange to me to put under EDAC as EDAC 
is primarily memory controller ECC (and caches to some extent). Also you 
would not halt the system in case of an UC, but rather just drop the 
frame. This would need to be part of the ethernet driver in that case.
 
Of course, given that ethernet frames already have a CRC, ECC of the 
FIFO seems a bit redundant.

Rob
