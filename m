From: Fabio Estevam <festevam@gmail.com>
Subject: Re: i.MX DT memory nodes
Date: Tue, 11 Sep 2018 23:54:03 -0300
Message-ID: <CAOMZO5AgrUEqTUwXEm4vkkaDKZs2Yzi7gVYR4MXAN1KsqTz7OA@mail.gmail.com>
References: <CAL_JsqKtwt39k95d32ni=mKrZ=UVmTBH_onxC3ncjWs9eLbdJw@mail.gmail.com>
 <20180912023902.GA28239@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180912023902.GA28239@dragon>
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
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Tue, Sep 11, 2018 at 11:39 PM, Shawn Guo <shawnguo@kernel.org> wrote:
> On Tue, Sep 11, 2018 at 04:54:40PM -0500, Rob Herring wrote:
>> It appears that many i.MX platforms have duplicate, incomplete memory
>> nodes with both "memory" and "memory@<addr>" nodes. Are you all aware
>> of this? Plan to fix it? I guess u-boot fixes things enough to work.
>
> @Fabio, it seems that the most of them are caused by the empty 'memory'
> node in <soc>.dtsi.  Can these be removed now?

Yes, I will follow Rob's suggestion and will try to come with a fix.
