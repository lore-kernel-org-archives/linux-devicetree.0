From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4] dma: Add Xilinx AXI Direct Memory Access Engine driver support
Date: Tue, 21 Oct 2014 11:14:55 +0200
Message-ID: <3236720.MHeqOodrCV@wuerfel>
References: <1413374436-14410-1-git-send-email-sthokal@xilinx.com> <4301925.4pMHXMXqA4@wuerfel> <ff137744d6474640aab09e5d6f62921a@BN1AFFO11FD019.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ff137744d6474640aab09e5d6f62921a@BN1AFFO11FD019.protection.gbl>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "vinod.koul@intel.com" <vinod.koul@intel.com>, Srikanth Vemula <svemula@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Srikanth Thokala <sthokal@xilinx.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Michal Simek <michals@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 21 October 2014 09:06:13 Appana Durga Kedareswara Rao wrote:
> The above mentioned API's  and structures will be used by the dma test
> client driver's to set hardware configuration information. The dma
> client drivers are not mainlined  yet and it is
> Internally used by  our git-tree  to test the DMA functionality in loopback .

I would suggest you add the test driver into the main dmaengine driver
file directly then, so you don't need to export the symbols. If there
are important reasons to keep that as separate files, just move the
header to the drivers/dma/ directory and add the test driver there.

	Arnd 
