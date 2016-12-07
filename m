From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v3] ARM: at91/dt: add dts file for sama5d36ek CMP board
Date: Wed, 7 Dec 2016 15:44:41 +0100
Message-ID: <20161207144441.ponnh4eeyxpifbxt@piout.net>
References: <1479705283-3052-1-git-send-email-wenyou.yang@atmel.com>
 <20161121140248.utlir6krokjeeobi@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20161121140248.utlir6krokjeeobi@piout.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wenyou Yang <wenyou.yang@atmel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Wenyou Yang <wenyou.yang@microchip.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On 21/11/2016 at 15:02:48 +0100, Alexandre Belloni wrote :
> > Changes in v3:
> >  - Use a dual license scheme for DT files.
> >  - Use the proper model name and the compatible string to reflect
> >    the nature of this new "CMP" board.
> >  - Change name of wakeup property to "wakeup-source".
> >  - Remove unnecessary comments.
> >  - Remove bootargs.
> > 
> > Changes in v2:
> >  - Add the pinctrl sleep state for adc0 node to fix the over
> >    consumption on VDDANA.
> >  - Improve the commit log.
> > 
> >  arch/arm/boot/dts/sama5d36ek_cmp.dts  |  87 ++++++++++
> >  arch/arm/boot/dts/sama5d3xcm_cmp.dtsi | 201 +++++++++++++++++++++++
> >  arch/arm/boot/dts/sama5d3xmb_cmp.dtsi | 301 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 589 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/sama5d36ek_cmp.dts
> >  create mode 100644 arch/arm/boot/dts/sama5d3xcm_cmp.dtsi
> >  create mode 100644 arch/arm/boot/dts/sama5d3xmb_cmp.dtsi
> > 
> Applied, thanks.
> 

Actually, I have to postpone this one for 4.12 because it depends on
https://patchwork.ozlabs.org/patch/688265/


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
