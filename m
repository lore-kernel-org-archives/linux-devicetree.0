From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: RE: [PATCH v4] dma: Add Xilinx AXI Direct Memory Access Engine
 driver support
Date: Fri, 24 Oct 2014 12:08:26 +0000
Message-ID: <7dc11ef7ccec49bcb052c30b9aa916c3@BL2FFO11FD044.protection.gbl>
References: <1413374436-14410-1-git-send-email-sthokal@xilinx.com>
 <4301925.4pMHXMXqA4@wuerfel>
 <ff137744d6474640aab09e5d6f62921a@BN1AFFO11FD019.protection.gbl>
 <3236720.MHeqOodrCV@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3236720.MHeqOodrCV@wuerfel>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "vinod.koul@intel.com" <vinod.koul@intel.com>, Srikanth Vemula <svemula@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Srikanth Thokala <sthokal@xilinx.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Michal Simek <michals@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

-----Original Message-----
From: Arnd Bergmann [mailto:arnd@arndb.de]
Sent: Tuesday, October 21, 2014 2:45 PM
To: linux-arm-kernel@lists.infradead.org
Cc: Appana Durga Kedareswara Rao; devicetree@vger.kernel.org; vinod.koul@intel.com; Srikanth Vemula; linux-kernel@vger.kernel.org; Srikanth Thokala; dmaengine@vger.kernel.org; robh+dt@kernel.org; Michal Simek; Anirudha Sarangi; grant.likely@linaro.org; dan.j.williams@intel.com
Subject: Re: [PATCH v4] dma: Add Xilinx AXI Direct Memory Access Engine driver support

On Tuesday 21 October 2014 09:06:13 Appana Durga Kedareswara Rao wrote:
> The above mentioned API's  and structures will be used by the dma test
> client driver's to set hardware configuration information. The dma
> client drivers are not mainlined  yet and it is Internally used by
> our git-tree  to test the DMA functionality in loopback .

I would suggest you add the test driver into the main dmaengine driver file directly then, so you don't need to export the symbols. If there are important reasons to keep that as separate files, just move the header to the drivers/dma/ directory and add the test driver there.

        Arnd

Sorry I forgot to mention the below things in the mail .The Config API's and structures not only used by the dmaengine driver's but also used by the  various IP's  (Ex: Ethernet driver and SRIO driver these drivers are under development).For example the Ethernet driver is resides under drivers/net/ethernet but it needs to set some specific configuration parameters of the dma that's why created a separate header file for the h/w configurable parameters.


Regards,
Kedar.


This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
