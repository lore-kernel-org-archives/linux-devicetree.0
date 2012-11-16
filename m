From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 01/16] gpio: SPEAr: add spi chipselect control driver
Date: Fri, 16 Nov 2012 08:19:04 +0000
Message-ID: <201211160819.04343.arnd@arndb.de>
References: <4a92290e8a3b1a19c3a5e864edfa7badfc2af5d0.1352608333.git.viresh.kumar@linaro.org>
 <3702a1036f8e714e6d18e4726569bbb1eadd65bf.1353042873.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <3702a1036f8e714e6d18e4726569bbb1eadd65bf.1353042873.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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

On Friday 16 November 2012, Viresh Kumar wrote:
> From: Shiraz Hashim <shiraz.hashim-qxv4g6HH51o@public.gmane.org>
> 
> SPEAr platform provides a provision to control chipselects of ARM PL022
> Prime Cell spi controller through its system registers, which otherwise
> remains under PL022 control which some protocols do not want.
> 
> This commit intends to provide the spi chipselect control in software over
> gpiolib interface. spi chip drivers can use the exported gpiolib interface to
> define their chipselect through DT or platform data.
> 
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Signed-off-by: Shiraz Hashim <shiraz.hashim-qxv4g6HH51o@public.gmane.org>
> Reviewed-by: Vipin Kumar <vipin.kumar-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
