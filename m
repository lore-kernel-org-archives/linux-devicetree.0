From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: imx7d: sbc imx7: add uart5
Date: Tue, 11 Dec 2018 00:35:36 -0200
Message-ID: <CAOMZO5ADmamd6rsUKKPmYPE9wfaRQmSUc7r4m+cYKxCKwsRLhA@mail.gmail.com>
References: <20181204110741.6943-1-hohatzel@jusst.de>
 <20181204110741.6943-5-hohatzel@jusst.de>
 <20181206031520.GE3987@dragon> <58a84012-73b8-1679-0c5b-981fd2a0acd6@jusst.de>
 <CAOMZO5At5oSv0MCpsuYj4nEd26Y4h9hj-shadq3477fNz8A+HA@mail.gmail.com>
 <20181211020613.GR3987@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181211020613.GR3987@dragon>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, jscheel@jusst.de, NXP Linux Team <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, hohatzel@jusst.de, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Tue, Dec 11, 2018 at 12:07 AM Shawn Guo <shawnguo@kernel.org> wrote:

> Okay, but would it be better to set the default parent clock in soc
> level of dtsi, since the configuration doesn't seem to be board
> specific?

Yes, I think this is a good idea.
