From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: imx6qdl-wandboard: enable USB OTG
Date: Tue, 29 May 2018 09:58:20 -0300
Message-ID: <CAOMZO5DW12s2d_79JUPGY3Y=G+Nizp2bB56TRm1gQHwVDQLESg@mail.gmail.com>
References: <20180529062021.3154-1-akurz@blala.de>
 <20180529062021.3154-4-akurz@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180529062021.3154-4-akurz@blala.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Kurz <akurz@blala.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 29, 2018 at 3:20 AM, Alexander Kurz <akurz@blala.de> wrote:
> Enable USB OTG (dual-role) on the Wandboard.
> Note, that the USB_OTG_VBUS current is quite limited due to a 22R resistor
> in the power line. Hence, the overcurrent signal of 1A will never be
> triggered on this board.
>
> Signed-off-by: Alexander Kurz <akurz@blala.de>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
