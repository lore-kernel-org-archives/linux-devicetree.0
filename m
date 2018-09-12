From: Rob Herring <robh@kernel.org>
Subject: Re: i.MX DT memory nodes
Date: Tue, 11 Sep 2018 21:52:03 -0500
Message-ID: <CAL_JsqJSe20Zj4Fsxw=UCJ4DiqUUjY9Sxa_hZrsv+s2XP_+MZw@mail.gmail.com>
References: <CAL_JsqKtwt39k95d32ni=mKrZ=UVmTBH_onxC3ncjWs9eLbdJw@mail.gmail.com>
 <CAOMZO5DTW8KWKwxj8pnS6zv8VhiuFDc-bf=+k=1c4sgqubEPVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5DTW8KWKwxj8pnS6zv8VhiuFDc-bf=+k=1c4sgqubEPVA@mail.gmail.com>
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

On Tue, Sep 11, 2018 at 9:38 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Rob,
>
> On Tue, Sep 11, 2018 at 6:54 PM, Rob Herring <robh@kernel.org> wrote:
> > It appears that many i.MX platforms have duplicate, incomplete memory
> > nodes with both "memory" and "memory@<addr>" nodes. Are you all aware
> > of this? Plan to fix it? I guess u-boot fixes things enough to work.
>
> I was not aware.
>
> I spent some time fixing all the memory node errors reported by dtc with W=1.

Unfortunately, dtc is not catching it because we have 'memory' with
just device_type and 'memory@<addr>' with reg.

> Any suggestions on how to fix the remaining issues?

Make sure every memory@<addr> has device_type added and remove the
'memory' nodes.

> Also, how can I trigger such warnings?

Install the schema tools:

pip3 install git+https://github.com/robherring/yaml-bindings.git@master
--process-dependency-links

Use this kernel branch with the build support:

https://github.com/robherring/linux/commits/yaml-bindings

And this dtc:

https://github.com/robherring/dtc/tree/yaml

Rob
