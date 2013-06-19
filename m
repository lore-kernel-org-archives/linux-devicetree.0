From: zhangfei <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v3 1/2] i2c: designware: use module_platform_driver
Date: Wed, 19 Jun 2013 09:00:02 +0800
Message-ID: <51C10292.9000906@linaro.org>
References: <1370918230-24793-1-git-send-email-zhangfei.gao@linaro.org>
 <1370918230-24793-2-git-send-email-zhangfei.gao@linaro.org>
 <20130618162711.GG7718@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130618162711.GG7718@katana>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, baruch@tkos.co.il, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 13-06-19 12:27 AM, Wolfram Sang wrote:
> On Tue, Jun 11, 2013 at 10:37:09AM +0800, Zhangfei Gao wrote:
>> Instead of use platform_driver_probe, use module_platform_driver
>> To support deferred probing
>> Also subsys_initcall may too early to auto set pinctl
>>
>> Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
>> CC: Baruch Siach <baruch@tkos.co.il>
>
> Basically OK, but please resend for 3.12, so we get enough testing
> before entering mainline. I am a bit anxious of side
> effects and 3.11 is too near.
>

Dear Wolfram,

Sorry for the silly question: How to be prepared for 3.12?

Do you mean there is specific git & branch, which I should rebase on?
linux-next.git is what I use now.

Thanks
