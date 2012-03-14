From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2] ARM: SPEAr600: Add device-tree support to SPEAr600
 boards
Date: Wed, 14 Mar 2012 15:54:25 +0000
Message-ID: <201203141554.25262.arnd@arndb.de>
References: <1331737232-25477-1-git-send-email-sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1331737232-25477-1-git-send-email-sr-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 14 March 2012, Stefan Roese wrote:
> This patch adds a generic target for SPEAr600 board that can be
> configured via the device-tree. Currently the following devices
> are supported via the devicetree:
> 
> - VIC interrupts
> - PL011 UART
> - PL061 GPIO
> - Synopsys DW I2C
> - Synopsys DW ethernet
> 
> Other peripheral devices (e.g. SMI flash, FSMC NAND flash etc) will
> follow in later patches.
> 
> Only the spear600-evb is currently supported. Other SPEAr600
> based boards will follow later.
> 
> Additionally the file spear600.c is deleted. It contained only
> one empty function and is not needed. So lets just remove it.
> 
> Signed-off-by: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
> Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Looks very good to me.

Reviewed-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
