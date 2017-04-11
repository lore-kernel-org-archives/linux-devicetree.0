From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: mxs: add support for I2SE Duckbill 2 boards
Date: Tue, 11 Apr 2017 18:32:04 +0800
Message-ID: <20170411103202.GA9880@dragon>
References: <20170410082400.GA1872@dragon>
 <1491815335-26469-1-git-send-email-michael.heimpold@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1491815335-26469-1-git-send-email-michael.heimpold@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michael Heimpold <michael.heimpold@i2se.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, stefan.wahren@i2se.com, robh+dt@kernel.org, Michael Heimpold <mhei@heimpold.de>, kernel@pengutronix.de, fabio.estevam@nxp.com, frowand.list@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 10, 2017 at 11:08:55AM +0200, Michael Heimpold wrote:
> The Duckbill devices are small, pen-drive sized boards based on
> NXP's i.MX28 SoC. While the initial variants (Duckbill series)
> were equipped with a micro SD card slot only, the latest generation
> (Duckbill 2 series) have an additional internal eMMC onboard.
> 
> To distinguish between both generations, a new device tree
> compatible string was introduced. To get the MAC address fixup
> applied, we need to check for this new string here, too.
> 
> Signed-off-by: Michael Heimpold <michael.heimpold@i2se.com>

Applied, thanks.
