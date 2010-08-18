From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: standard property to convey device dma address width?
Date: Tue, 17 Aug 2010 22:57:57 -0500
Message-ID: <FA1CD633-B9CA-4490-8873-888D7E58361E@kernel.crashing.org>
References: <5A878376-AFCC-4CB0-A0E9-F2F497066FD5@kernel.crashing.org>
	<4C699CC6.1060507@firmworks.com>
	<366D8D84-D210-4BC1-8FC1-4E0A9E06C433@kernel.crashing.org>
	<20100817160317.458ea513@schlenkerla.am.freescale.net>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100817160317.458ea513-1MYqz8GpK7RekFaExTCHk1jVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Yoder Stuart-B08248 <b08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Aug 17, 2010, at 4:03 PM, Scott Wood wrote:

> On Tue, 17 Aug 2010 15:55:04 -0500
> Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> 
>> As I said to Stuart.  On the Freescale SOCs we have different device
>> blocks w/varying dma address capabilities.  Some are limited to 32-bits
>> some are capable of 36-bits on the same SOC.
> 
> Is this something that the driver would not know about, just based on
> the compatible that it is matching?
> 
> -Scott

There is some variation here that is reasonable that the same compatible could have a different width for different SOC integration.

- k
