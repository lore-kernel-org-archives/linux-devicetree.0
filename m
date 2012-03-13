From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 2/5 v3] ARM: at91: sam9g20 add i2c DT support
Date: Tue, 13 Mar 2012 08:08:13 +0100
Message-ID: <20120313070813.GD18320@game.jcrosoft.org>
References: <1331196635-27203-1-git-send-email-plagnioj@jcrosoft.com>
 <1331196635-27203-2-git-send-email-plagnioj@jcrosoft.com>
 <4F58E77B.4010500@gmail.com>
 <20120309095336.GK27213@game.jcrosoft.org>
 <4F5A0CB5.2020203@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <4F5A0CB5.2020203@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 07:59 Fri 09 Mar     , Rob Herring wrote:
> On 03/09/2012 03:53 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > On 11:08 Thu 08 Mar     , Rob Herring wrote:
> >> On 03/08/2012 02:50 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> >>> For now on use i2c-gpio driver on the same pin as the hardware IP.
> >>>
> >>> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> >>> Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> >>> Cc: devicetree-discuss@lists.ozlabs.org
> >>> ---
> >>> v3:
> >>>
> >>> 	update i2c binding (Rob comments)
> >>>
> >>> Best Regards,
> >>> J.
> >>>  arch/arm/boot/dts/at91sam9g20.dtsi |   13 +++++++++++++
> >>>  1 files changed, 13 insertions(+), 0 deletions(-)
> >>>
> >>> diff --git a/arch/arm/boot/dts/at91sam9g20.dtsi b/arch/arm/boot/dts/at91sam9g20.dtsi
> >>> index 4b0dc99..072b2da 100644
> >>> --- a/arch/arm/boot/dts/at91sam9g20.dtsi
> >>> +++ b/arch/arm/boot/dts/at91sam9g20.dtsi
> >>> @@ -189,4 +189,17 @@
> >>>  			status = "disabled";
> >>>  		};
> >>>  	};
> >>> +> > +	i2c-gpio@0 {
> >>
> >> You updated the example, but not all the actual uses to i2c@0.
> > on purpose as on some soc we will have HW and soft binding
> > 
> > on the board you put the alias
> > 
> 
> I'm not sure I follow.
> 
> If you use the h/w block, then you would have i2c@<addr> while for gpio
> it's basically an index.
> 
> Also, I don't think you need an alias for i2c. You should not care about
> bus numbering as devices should be sub nodes.
forget about it tired when I reply

Best Regards,
J.
