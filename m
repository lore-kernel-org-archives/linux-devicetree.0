From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: standard property to convey device dma address width?
Date: Tue, 17 Aug 2010 15:54:19 -0500
Message-ID: <0BF1E97C-2531-4BE3-9EED-2EB8E12C76D8@kernel.crashing.org>
References: <5A878376-AFCC-4CB0-A0E9-F2F497066FD5@kernel.crashing.org>
	<9696D7A991D0824DBA8DFAC74A9C5FA3065BD776@az33exm25.fsl.freescale.net>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <9696D7A991D0824DBA8DFAC74A9C5FA3065BD776-ofAVchDyotYzzZk0BCvKg5jmvxFtTJ+o0e7PPNI6Mm0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Aug 17, 2010, at 3:50 PM, Yoder Stuart-B08248 wrote:

> 
> 
>> -----Original Message-----
>> From: Kumar Gala [mailto:galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org]
>> Sent: Monday, August 16, 2010 11:02 AM
>> To: devicetree-discuss
>> Cc: Yoder Stuart-B08248
>> Subject: standard property to convey device dma address width?
>> 
>> Do we or should we have a standard property to convey that address
>> width a device is capable of?
> 
> Is this a case of where a device can only address something like
> 32-bits, and you want some kind of per-device property to
> convey this?
> 
> Stuart

Exactly.  With SOC devices the address width different devices on the SOC can address may (and does) very.

- k
