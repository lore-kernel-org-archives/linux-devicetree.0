From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: imx28: Remove unit-address from pinctrl
Date: Thu, 10 May 2018 21:37:19 -0300
Message-ID: <CAOMZO5D9XguGVTV7GHYWTPPQ-whiQTTtL0ZVt6qV0R_ojyu89Q@mail.gmail.com>
References: <1525997810-10964-1-git-send-email-festevam@gmail.com>
 <1525997810-10964-2-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1525997810-10964-2-git-send-email-festevam@gmail.com>
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

On Thu, May 10, 2018 at 9:16 PM, Fabio Estevam <festevam@gmail.com> wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
>
> Remove unit-address and reg property from pinctrl subnodes to fix
> the following DTC warnings with W=1:
>
> arch/arm/boot/dts/imx28-apf28dev.dtb: Warning (unique_unit_address): /apb@80000000/apbh@80000000/pinctrl@80018000/hog@0: duplicate unit-address (also used in node /apb@80000000/apbh@80000000
>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Please discard this one and 3/3 for now.

I noticed that audio is no longer functional after this change. I will debug it.
