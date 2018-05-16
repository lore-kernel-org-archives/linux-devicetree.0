From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: imx6/7: Remove unit-address from anatop
 regulators
Date: Wed, 16 May 2018 09:35:43 -0300
Message-ID: <CAOMZO5AxTjyrDeT+HvPN_4Ue8yBG0U4tnwFU5nS9zTPOwFDqAQ@mail.gmail.com>
References: <1526304714-23821-1-git-send-email-festevam@gmail.com>
 <20180515074042.GP26863@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180515074042.GP26863@dragon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Tue, May 15, 2018 at 4:40 AM, Shawn Guo <shawnguo@kernel.org> wrote:

> I'm a bit confused.  It looks that the change is just to revert commit
> 685e1321ba74 ("ARM: dts: imx6: Add unit address and reg for the anatop
> nodes").  But what about the simple_bus_reg warning the commit was
> fixing?

Yes, I don't get the original simple_bus_reg warning anymore.

I think we don't need the unit address and reg properties to the
anatop regulators.

There is already a 'anatop-reg-offset' property that indicates the
anatop register offset.

Rob, is this patch the correct solution to fix the duplicate
unit-address dtc warnings?

Thanks
