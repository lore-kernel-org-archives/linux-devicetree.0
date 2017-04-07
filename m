From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH v4 1/3] clk: vc5: Add structure to describe particular
 chip features
Date: Fri, 7 Apr 2017 21:55:55 +0200
Message-ID: <cf7f7276-23f6-6854-e59c-88f9d86057c6@gmail.com>
References: <1491556344-9465-1-git-send-email-alexey_firago@mentor.com>
 <1491556344-9465-2-git-send-email-alexey_firago@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1491556344-9465-2-git-send-email-alexey_firago@mentor.com>
Sender: linux-clk-owner@vger.kernel.org
To: Alexey Firago <alexey_firago@mentor.com>, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, geert@linux-m68k.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/07/2017 11:12 AM, Alexey Firago wrote:
> Introduce vc5_chip_info structure to describe features of a particular
> VC5 chip (id, number of FODs, number of outputs, flags).
> For now flags are only used to indicate if chip has internal XTAL.
> vc5_chip_info is set on probe from the matched of_device_id->data.
> 
> Also add defines to specify maximum number of FODs and clock outputs
> supported by the driver.
> 
> With these changes it should be easier to extend driver to support
> more VC5 models.
> 
> Signed-off-by: Alexey Firago <alexey_firago@mentor.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
