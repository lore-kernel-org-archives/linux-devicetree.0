From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 0/3] kbuild: Add wilddt function instead of listing dtbs
Date: Mon, 21 Jan 2019 16:16:55 +0000
Message-ID: <VI1PR04MB553355D6D5EBC2604E1AD256EE9F0@VI1PR04MB5533.eurprd04.prod.outlook.com>
References: <cover.1546888138.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Michal Marek <michal.lkml@markovi.net>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 1/7/2019 9:31 PM, Leonard Crestez wrote:
> The dts makefiles go through a lot of pointless churn when boards are
> added. Many SOCs (such as imx) have very simple naming conventions for
> all boards using a certain chip and board listings can be easily
> collapsed using wildcards.
> 
> Add a "wilddt" function and use it for imx6/7/8 and layerscape. This can
> be applied to many other soc families later.
> 
> Previously sent as RFC: https://lore.kernel.org/patchwork/patch/1022737/

Any feedback? This should be reviewed by kbuild and arm-soc

I think this is a worthwhile cleanup, are there any corner cases or more 
exotic setup I should try in order to validate this series?

--
Regards,
Leonard
