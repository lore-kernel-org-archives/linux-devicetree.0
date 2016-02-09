From: John Crispin <blogic@openwrt.org>
Subject: Re: [PATCH V5 1/2] regulator: Add document for MT6323 regulator
Date: Tue, 9 Feb 2016 13:45:17 +0100
Message-ID: <56B9DF5D.2010501@openwrt.org>
References: <1454874037-38905-1-git-send-email-blogic@openwrt.org>
 <20160209124133.GE13270@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160209124133.GE13270@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, chen.zhong@mediatek.com, HenryC.Chen@mediatek.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 09/02/2016 13:41, Mark Brown wrote:
> On Sun, Feb 07, 2016 at 08:40:36PM +0100, John Crispin wrote:
> 
>> +Required properties:
>> +- compatible: "mediatek,mt6323-regulator"
> 
> I'm really not happy with MFD subfunctions like this which add no
> information over the parent device name appearing directly in the
> binding, it results in us putting Linux specifics about how we split the
> device up into the driver.  It's not like this could realistically be
> used separately to the parent device.  Just have the MFD create the
> device directly or if the individual regulators are reusable IPs which
> can share a driver then describe them as such in the DT.
> 

Hi Mark,

How would you like it to be. i am failing to understand that from your
comment.

	John
