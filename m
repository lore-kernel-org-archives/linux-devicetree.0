From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6q-bx50v3/imx6q-b450v3/imx6q-b650v3: change
 pca953x GPIO default settings
Date: Tue, 7 Mar 2017 12:45:15 +0100
Message-ID: <20170307114514.GA6585@x250>
References: <20170203012114.20411-1-ken.lin@advantech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170203012114.20411-1-ken.lin@advantech.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ken Lin <yungching0725@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, peter.chiang@advantech.com, ken.lin@advantech.com, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, akshay.bhat@timesys.com, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-arm-kernel@lists.infradead.org, peter.stretz@advantech.com
List-Id: devicetree@vger.kernel.org

On Fri, Feb 03, 2017 at 09:21:14AM +0800, Ken Lin wrote:
> Leave pca953x P06,P07 pins on b850v3 platform and P06 pin on b450v3/b650v3 unconfigured
> in the kernel space since they could be configured as DP1_RST and DP2_RST by the applications
> for the DP FW update support
> 
> Signed-off-by: Ken Lin <ken.lin@advantech.com>

I wrapped commit log and shorten the subject prefix a bit, and then
applied the patch.

Shawn
