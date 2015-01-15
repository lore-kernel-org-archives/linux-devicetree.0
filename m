From: Bart Tanghe <bart.tanghe@thomasmore.be>
Subject: Re: [PATCH v3] ARM: dts: add bcm2835-pwm bindings
Date: Thu, 15 Jan 2015 13:29:34 +0100
Message-ID: <54B7B2AE.3020309@thomasmore.be>
References: <1421227134-8590-1-git-send-email-bart.tanghe@thomasmore.be> <54B6A200.4040209@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54B6A200.4040209@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, lee@kernel.org
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

I'm really sorry. I've used the wrong source. I make v4.

Regards,

Bart

On 01/14/2015 06:06 PM, Stephen Warren wrote:
> On 01/14/2015 02:18 AM, Bart Tanghe wrote:
>> To probe the bcm2835-pwm driver properly, this dts bindings has to be added
>> to the bcm2835 dtsi file.
>> In expectation of a bcm2835 clock driver, I've added fixed-clock clock binding.
>> ---
>> Changes in v3:
>>   - node added by reg value
> 
> The pwm node still seems to be in the wrong place. Sorting by reg value, it should be after i2c@20205000 and before sdhci@7e300000, as I mentioned before.
