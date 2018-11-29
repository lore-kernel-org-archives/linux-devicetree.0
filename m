From: Rob Herring <robh@kernel.org>
Subject: Re: i.MX DT memory nodes
Date: Thu, 29 Nov 2018 14:10:07 -0600
Message-ID: <CAL_JsqJvwyY4GzNei-n945KywgoWgmNVCO8LfEF7XjZZAfQzSw@mail.gmail.com>
References: <CAL_JsqKtwt39k95d32ni=mKrZ=UVmTBH_onxC3ncjWs9eLbdJw@mail.gmail.com>
 <20180912023902.GA28239@dragon>
 <CAOMZO5AgrUEqTUwXEm4vkkaDKZs2Yzi7gVYR4MXAN1KsqTz7OA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5AgrUEqTUwXEm4vkkaDKZs2Yzi7gVYR4MXAN1KsqTz7OA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 11, 2018 at 9:54 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Shawn,
>
> On Tue, Sep 11, 2018 at 11:39 PM, Shawn Guo <shawnguo@kernel.org> wrote:
> > On Tue, Sep 11, 2018 at 04:54:40PM -0500, Rob Herring wrote:
> >> It appears that many i.MX platforms have duplicate, incomplete memory
> >> nodes with both "memory" and "memory@<addr>" nodes. Are you all aware
> >> of this? Plan to fix it? I guess u-boot fixes things enough to work.
> >
> > @Fabio, it seems that the most of them are caused by the empty 'memory'
> > node in <soc>.dtsi.  Can these be removed now?
>
> Yes, I will follow Rob's suggestion and will try to come with a fix.

Still going to do this?

Rob
