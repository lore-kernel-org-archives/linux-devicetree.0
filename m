From: "Kim, Milo" <milo.kim@ti.com>
Subject: Re: [PATCH RESEND 16/16] regulator: add LM363X driver
Date: Tue, 3 Nov 2015 15:59:17 +0900
Message-ID: <56385B45.7090700@ti.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-17-git-send-email-milo.kim@ti.com>
 <20151102122640.GF20228@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151102122640.GF20228@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/2/2015 9:26 PM, Mark Brown wrote:
> On Mon, Nov 02, 2015 at 02:24:35PM +0900, Milo Kim wrote:
>> LM363X regulator driver supports LM3631 and LM3632.
>> LM3631 has 5 regulators. LM3632 provides 3 regulators.
>> One boost output and LDOs are used for the display module.
>> Boost voltage is configurable but always on.
>> Supported operations for LDOs are enabled/disabled and voltage change.
>
> As far as I can tell this is another partial resend of a series you
> originally sent about 15 minutes previously - what's going on here?
>

My apologies, I did send patches without --thread and 
--no-chain-reply-to options. So I've resent the patch-set.

Best regards,
Milo
