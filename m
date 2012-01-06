From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [RFC PATCH v3 2/5] pinctrl: add dt binding support for pinmux
 mappings
Date: Fri, 6 Jan 2012 21:14:14 +0800
Message-ID: <20120106131411.GA6372@S2101-09.ap.freescale.net>
References: <1324402840-32451-1-git-send-email-b29396@freescale.com>
 <1324402840-32451-3-git-send-email-b29396@freescale.com>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE92F00@HQMAIL01.nvidia.com>
 <7FE21149F4667147B645348EC6057885075542@039-SN2MPN1-013.039d.mgd.msft.net>
 <74CDBE0F657A3D45AFBB94109FB122FF176CC743EF@HQMAIL01.nvidia.com>
 <CAA+hA=RBqpSmntS2h+6xMQuRvSRHenmDgrYSSzMXHtOCpU+HCQ@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17761F18F8@HQMAIL01.nvidia.com>
 <7FE21149F4667147B645348EC605788507F698@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <7FE21149F4667147B645348EC605788507F698@039-SN2MPN1-013.039d.mgd.msft.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng-B29396 <B29396@freescale.com>
Cc: Stephen Warren <swarren@nvidia.com>, Dong Aisheng <dongas86@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "cjb@laptop.org" <cjb@laptop.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 06, 2012 at 11:33:54AM +0000, Dong Aisheng-B29396 wrote:
> In board dts file:
> usdhc@0219c000 { /* uSDHC4 */
>         fsl,card-wired;
>         status = "okay";
>         pinmux = <&pinctrl_sd4>;

Would it be more proper to have the phandle named as 'pinctrl' than
'pinmux'?

> };

-- 
Regards,
Shawn
