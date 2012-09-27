From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH v4 2/2] ARM: at91: add at91sam9_wdt driver to
 at91sam926x, at91sam9g45
Date: Thu, 27 Sep 2012 07:50:21 +0200
Message-ID: <20120927055021.GO17667@game.jcrosoft.org>
References: <1348568704-28304-1-git-send-email-fabio.porcedda@gmail.com>
 <1348568704-28304-3-git-send-email-fabio.porcedda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1348568704-28304-3-git-send-email-fabio.porcedda@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Wim Van Sebroeck <wim@iguana.be>, Andrew Victor <linux@maxim.org.za>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 12:25 Tue 25 Sep     , Fabio Porcedda wrote:
> Enable the driver for the evk-pro3 board.
> 
> Tested on an at91sam9260 board (evk-pro3).
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  arch/arm/boot/dts/at91sam9260.dtsi | 6 ++++++
>  arch/arm/boot/dts/at91sam9263.dtsi | 6 ++++++
>  arch/arm/boot/dts/at91sam9g45.dtsi | 6 ++++++
>  arch/arm/boot/dts/evk-pro3.dts     | 4 ++++
split board and soc

Best Regards,
J.
