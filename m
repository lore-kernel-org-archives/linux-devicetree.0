From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] ARM: dts: stmpe-ts: fix wrong bindings
Date: Wed, 02 Apr 2014 09:48:58 +0200
Message-ID: <2acd964e18e59b35996d042a3dd6e99b@agner.ch>
References: <1386620111-1413-1-git-send-email-stefan@agner.ch>
 <201312092132.29575.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201312092132.29575.marex@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.guo@freescale.com
Cc: viresh.linux@gmail.com, shiraz.hashim@st.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, ijc+devicetree@hellion.org.uk, Marek Vasut <marex@denx.de>
List-Id: devicetree@vger.kernel.org

Am 2013-12-09 21:32, schrieb Marek Vasut:
> On Monday, December 09, 2013 at 09:15:11 PM, Stefan Agner wrote:
>> Fix bindings for STMPE touchscreen device to match the documented
>> bindings and the actual bindings used by the driver.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>> I don't have any of these hardware, but the error is obvious. The device
>> probably works anyway since the device/driver will use default values.
> 
> Full agreement here.
> 
> Reviewed-by: Marek Vasut <marex@denx.de>
> 
> btw. I plan to rework the STMPE TS as it doesn't work nicely on my device at 
> all. I am seriously lacking time, but I will try! ;-)
> 
> Best regards,
> Marek Vasut

Hi Shawn,

Just noticed that I forgot to add you when sending this patch. I guess
this should go through your tree...

--
Stefan
