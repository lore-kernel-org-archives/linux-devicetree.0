From: Kuldeep Singh <kuldeep.singh@nxp.com>
Subject: RE: [EXT] Re: [PATCH] dt-bindings: spi: spi-fsl-qspi: Add ls2080a
 compatibility string
Date: Wed, 22 May 2019 07:06:12 +0000
Message-ID: <AM0PR0402MB3556568F1033897FC4784D83E0000@AM0PR0402MB3556.eurprd04.prod.outlook.com>
References: <20190516104046.23830-1-kuldeep.singh@nxp.com>
 <20190516104046.23830-2-kuldeep.singh@nxp.com>
 <20190521210449.GB1580@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190521210449.GB1580@sirena.org.uk>
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
To: Mark Brown <broonie@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Ashish Kumar <ashish.kumar@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

> -----Original Message-----
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: Wednesday, May 22, 2019 2:35 AM
> To: Kuldeep Singh <kuldeep.singh@nxp.com>
> Cc: devicetree@vger.kernel.org; bbrezillon@kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-mtd@lists.infradead.org; Ashish Kumar
> <ashish.kumar@nxp.com>
> Subject: [EXT] Re: [PATCH] dt-bindings: spi: spi-fsl-qspi: Add ls2080a
> compatibility string
> 
> On Thu, May 16, 2019 at 10:39:45AM +0000, Kuldeep Singh wrote:
> > There are 2 version of QSPI-IP, according to which it can be big
> > endian or little endian. There are some other minor changes as well.
> > The big endian version uses driver compatible fsl,ls1021a-qspi and
> > little endian version uses fsl,ls10280a-qspi
> 
> This doesn't apply against current code, please check and resend.

I have sent v2 of patches by converting them to patch series.

Regards 
Kuldeep Singh
