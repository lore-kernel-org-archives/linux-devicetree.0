From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC 5/5] ARM: dts: Improve Peach Pit and Pi power scheme model
Date: Wed, 30 Jul 2014 10:53:24 +0200
Message-ID: <53D8B284.8040002@collabora.co.uk>
References: <1406651339-28901-1-git-send-email-javier.martinez@collabora.co.uk> <1406651339-28901-6-git-send-email-javier.martinez@collabora.co.uk> <20140729172005.GW17528@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20140729172005.GW17528@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/29/2014 07:20 PM, Mark Brown wrote:
> On Tue, Jul 29, 2014 at 06:28:59PM +0200, Javier Martinez Canillas wrote:
>> The DeviceTree files for the Peach Pit and Pi machines have
>> a simplistic model of the connections between the different
>> regulators since not all the tps65090 regulators get their
>> input supply voltage from the VDC. DCDC1-3, LD0-1 and fet7
>> parent supply is indded VDC but the fet1-6 get their input
>> supply from the DCDC1 and DCDC2 output voltage rails.
> 
> Acked-by: Mark Brown <broonie@linaro.org>
> 

Thanks.

> This *should* be independent of the rest of this series.
> 

Yes, it is independent as I explained in the cover letter. I just added in the
series since it was an RFC and I wanted you to have the complete picture.

I'll post it as an separate patch with your ack, sorry if this may cause an
inconvenience to you.

Best regards,
Javier
