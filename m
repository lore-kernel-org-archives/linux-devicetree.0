From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] ARM: add DT support to the S3C SDI driver
Date: Wed, 13 Apr 2011 11:35:58 -0600
Message-ID: <20110413173558.GF2254@ponder.secretlab.ca>
References: <20110413172547.GA27819@dandreoli.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110413172547.GA27819-iIV0ii4H0r6tG0bUXCXiUA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 13, 2011 at 07:25:47PM +0200, Domenico Andreoli wrote:
> From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> This patch adds DeviceTree support to the S3C SDI driver.
> 
> It implements all the configurations of the platform driver except the
> set_power() callback and the ocr_avail mask.
> 
> Signed-off-by: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> ---
> 
> ocr_avail is a bit mask that could be easily ported to DT. If there
> is not any better (or readable) way to render it in DT, I will
> straightforwardly implement it.
> 
> set_power() instead deserves some more considerations. Current
> implementations boil down to gpio on/off settings, its DT implementation
> is again straightforward. Problem would arise if any board requires
> some naive implementation, would it require a different of_device_id
> with proper .data set?

It would be better to think out the binding a bit more, but I'd need
to know more details about what is possible.

g.
