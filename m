From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCHv2 0/3] Initial support for Picochip picoxcell
Date: Mon, 26 Sep 2011 10:20:08 +0100
Message-ID: <20110926092008.GC3372@pulham.picochip.com>
References: <1314196906-20709-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1314196906-20709-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 24, 2011 at 03:41:43PM +0100, Jamie Iles wrote:
> This series adds support for Picochip picoXcell (PC3X2 and PC3X3)
> ARM1176JZ-S based devices.  This is a device tree only platform and
> currently supports interrupt controllers and UARTs.
> 
> This series is based off of Grant's devicetree/test branch and also uses
> Russell's io and gpio cleanup patches to remove the definition of
> IO_SPACE_LIMIT and trivial gpio definitions.
> 
> Changes since v1:
> 
> 	- Cleanup empty headers
> 	- Use of_platform_populate() and the default match table
> 	- Split the VIC's into separate device nodes
> 
> Jamie Iles (3):
>   picoxcell: support for Picochip picoxcell devices
>   picoxcell: add the DTS for pc3x2 and pc3x3 devices
>   picoxcell: add the DTS for the PC7302 board

Hi Arnd,

Is there likely to be any chance of getting support for picoxcell 
merged?  This series can now be based on top of Nicolas' static IO 
mapping patches to remove some more code but I'm not sure what else I 
can do to make them easier to review!

Thanks,

Jamie
