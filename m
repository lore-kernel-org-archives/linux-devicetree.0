From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/2] regulator: s5m8767: Modify parse_dt function to parse
 data related to ramp
Date: Fri, 25 Oct 2013 18:08:32 +0900
Message-ID: <526A3510.1020603@samsung.com>
References: <1381369296-17101-1-git-send-email-cw00.choi@samsung.com>
 <20131024101501.GA17157@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20131024101501.GA17157@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, sbkim73@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

On 10/24/2013 07:15 PM, Mark Brown wrote:
> On Thu, Oct 10, 2013 at 10:41:35AM +0900, Chanwoo Choi wrote:
>> This patch parse 'buck[2-4]_ramp_enable and buck_ramp_delay' platform data
>> from dts file.
> 
> Applied both, thanks.  Please submit a followup patch to use
> of_property_read_bool() as noted by Mark.
> 

OK, Thanks,

Best regards,
Chanwoo Choi
