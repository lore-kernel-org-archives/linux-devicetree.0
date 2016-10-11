From: Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [PATCH 15/19] reset: sti: Remove STiH415/6 reset support
Date: Tue, 11 Oct 2016 09:05:05 +0200
Message-ID: <b9a50ba1-9932-0d71-6b61-efccee587d74@st.com>
References: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
 <1473859677-9231-16-git-send-email-peter.griffin@linaro.org>
 <1474963347.2494.8.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1474963347.2494.8.camel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

Hi Philipp

On 09/27/2016 10:02 AM, Philipp Zabel wrote:
> Hi Peter,
> 
> Am Mittwoch, den 14.09.2016, 14:27 +0100 schrieb Peter Griffin:
>> Support for STiH415/6 SoCs is being removed from the
>> kernel because the platforms are obsolete. This patch removes
>> the reset drivers for these SoC's.
>>
>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>> Cc: <p.zabel@pengutronix.de>
>> ---

[...]

>> -	.driver = {
>> -		.name = "reset-stih416",
>> -		.of_match_table = stih416_reset_match,
>> -	},
>> -};
>> -
>> -static int __init stih416_reset_init(void)
>> -{
>> -	return platform_driver_register(&stih416_reset_driver);
>> -}
>> -arch_initcall(stih416_reset_init);
> 
> Can I pick up patches 15 and 19, or are there dependencies in the
> series?

Yes, you can pick up patches 15 and 19

> In the latter case,
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> to merge both together with the other patches. Currently there is no
> conflict with changes queued from the reset tree.
> 
> regards
> Philipp
> 

Thanks

Patrice
