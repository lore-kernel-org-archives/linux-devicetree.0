From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: i.MX DT memory nodes
Date: Wed, 12 Sep 2018 10:39:05 +0800
Message-ID: <20180912023902.GA28239@dragon>
References: <CAL_JsqKtwt39k95d32ni=mKrZ=UVmTBH_onxC3ncjWs9eLbdJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKtwt39k95d32ni=mKrZ=UVmTBH_onxC3ncjWs9eLbdJw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 11, 2018 at 04:54:40PM -0500, Rob Herring wrote:
> It appears that many i.MX platforms have duplicate, incomplete memory
> nodes with both "memory" and "memory@<addr>" nodes. Are you all aware
> of this? Plan to fix it? I guess u-boot fixes things enough to work.

@Fabio, it seems that the most of them are caused by the empty 'memory'
node in <soc>.dtsi.  Can these be removed now?

Shawn
