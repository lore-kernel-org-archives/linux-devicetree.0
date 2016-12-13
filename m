From: Yao Yuan <yao.yuan@nxp.com>
Subject: RE: [PATCH 3/5] Documentation: dt: mtd: add chip support for "jedec,
 spi-nor"
Date: Tue, 13 Dec 2016 02:46:10 +0000
Message-ID: <DB6PR0402MB2902124A1862A91F4FA18643899B0@DB6PR0402MB2902.eurprd04.prod.outlook.com>
References: <1481188984-43683-1-git-send-email-yao.yuan@freescale.com>
 <1481188984-43683-4-git-send-email-yao.yuan@freescale.com>
 <20161212170903.ixr6iu4c5txzreub@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161212170903.ixr6iu4c5txzreub@rob-hp-laptop>
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
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 13, 2016 at 05:23:02PM +0800, Rob Herring wrote:
> On Thu, Dec 08, 2016 at 05:23:02PM +0800, Yuan Yao wrote:
> > From: Yuan Yao <yao.yuan@nxp.com>
> 
> The compatible string is wrong in the subject.
> 
> >
> > "sst25wf040b" and "en25s64" are also chip compatible with SPI NOR flash.
> >
> > Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Otherwise,
> 
> Acked-by: Rob Herring <robh@kernel.org>

Thanks for your review.
I will update the subject and send v2 soon.
