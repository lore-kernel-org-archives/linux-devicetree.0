From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 01/14] pinctrl: SPEAr: add spi chipselect control driver
Date: Mon, 12 Nov 2012 15:03:28 +0000
Message-ID: <201211121503.28392.arnd@arndb.de>
References: <cover.1352608333.git.viresh.kumar@linaro.org>
 <4a92290e8a3b1a19c3a5e864edfa7badfc2af5d0.1352608333.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4a92290e8a3b1a19c3a5e864edfa7badfc2af5d0.1352608333.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, Shiraz Hashim <shiraz.hashim-qxv4g6HH51o@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sr-ynQEQJNshbs@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 11 November 2012, Viresh Kumar wrote:
> From: Shiraz Hashim <shiraz.hashim-qxv4g6HH51o@public.gmane.org>
> 
> SPEAr platform provides a provision to control chipselects of ARM PL022
> Prime Cell spi controller through its system registers, which otherwise
> remains under PL022 control which some protocols do not want.
> 
> This commit intends to provide the spi chipselect control in software
> over gpiolib interface. Since it is tied to pinctrl, we place it under
> 'drivers/pinctrl/spear/' directory.
> 
> spi chip drivers can use the exported gpiolib interface to define their
> chipselect through DT or platform data.
> 
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The driver looks ok to me, but I'll wait for Linus to take a look first
and give his ack.

	Arnd
