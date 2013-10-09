From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] pinctrl: phandle entries will be applied sequentially
Date: Wed, 09 Oct 2013 09:58:03 -0600
Message-ID: <52557D0B.5040901@wwwdotorg.org>
References: <1381297324-19006-1-git-send-email-shawn.guo@linaro.org>
 <CACRpkdazPK6SNg9PdWCrjB8nwho1rCueumJWAN=STXdN1zNnMA@mail.gmail.com>
 <20131009124425.GG25034@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131009124425.GG25034@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>
Cc: Sherman Yin <syin@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 10/09/2013 06:44 AM, Russell King - ARM Linux wrote:
> On Wed, Oct 09, 2013 at 02:40:49PM +0200, Linus Walleij wrote:
>> NAK this this a Linux kernel implementation detail. Sherman Yin
>> fixed this up so the drivers does not have to imply any sequence
>> semantic for this.
>>
>> Study commit 03b054e9696c3cbd3d5905ec96da15acd0a2fe8d
>> "pinctrl: Pass all configs to driver on pin_config_set()"
>>
>> It is perfectly legal for a driver to accumulate the settings into
>> e.g. a single register write if it can, e.g.:
>>
>> u32 val = 0;
>>
>> for (i = 0; i < num_configs; i++) {
>>   switch() {
>>   FOO:
>>      val |= 1;
>>      break;
>>    BAR:
>>      val |= 2:
>>      break;
>>    BAZ:
>>      val |=4;
>>      break;
>> };
>>
>> writel(val, base+pinreg);
>>
>> I.e. the driver may choose to apply configs sequentially, but that is
>> not at all necessary.
> 
> So, just to be clear, what you're saying is that specifying two settings
> in a pinctrl declaration which provide different values results in
> undefined behaviour?

That makes sense to me, yes. It should be simple to separate out the
common/shared parts of a configuration, vs. other unique parts, and put
them into separate "pin configuration nodes", and hence avoid the
situation completely.
