From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6qdl-nitrogen6_som2: fix sgtl5000
 pinctrl init
Date: Tue, 3 Jan 2017 14:41:55 +0100
Message-ID: <20170103134155.5mgn4ebq2afikwtm@t450s.lan>
References: <20170103112247.4563-1-gary.bisson@boundarydevices.com>
 <20170103112247.4563-3-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170103112247.4563-3-gary.bisson@boundarydevices.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org
Cc: fabio.estevam@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Tue, Jan 03, 2017 at 12:22:47PM +0100, Gary Bisson wrote:
> Since the codec is probed first, the pinctrl node should be
> under the codec node.
> 
> The codec init was working for this board since U-Boot was
> already setting GPIO_0 as CLKO1 but better fix it anyway.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Fixes: 3faa1bb2e89c ("ARM: dts: imx: add Boundary Devices Nitrogen6_SOM2 support")

Thanks,
Gary
